import json
import logging
import os
import boto3
from decimal import Decimal
from boto3.dynamodb.conditions import Key
import base64

logger = logging.getLogger()
logger.setLevel(logging.INFO)

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["PROJECTS_TABLE_NAME"]) #type:ignore

def serialize(obj):
    if isinstance(obj, Decimal):
        return int(obj) if obj % 1 == 0 else float(obj)
    if isinstance(obj, list):
        return [serialize(i) for i in obj]
    if isinstance(obj, dict):
        return {k: serialize(v) for k, v in obj.items()}
    return obj

def lambda_handler(event, context):
    try:
        path_params = event.get("pathParameters") or {}

        # ---- SINGLE PROJECT ----
        if "id" in path_params:
            project_id = path_params["id"]
            res = table.get_item(
                Key={
                    "PK": "PROJECT",
                    "SK": f"PROJECT#{project_id}"
                }
            )

            if "Item" not in res:
                return response(404, {"error": "Project not found"})

            return response(200, serialize(res["Item"]))

        # ---- PROJECT LIST (PAGINATED) ----
        qs = event.get("queryStringParameters") or {}
        limit = int(qs.get("limit", 10))
        next_token = qs.get("nextToken")

        query_args = {
            "KeyConditionExpression": Key("PK").eq("PROJECT"),
            "Limit": limit
        }

        if next_token:
            query_args["ExclusiveStartKey"] = json.loads(
                base64.b64decode(next_token)
            )

        res = table.query(**query_args)

        output = {
            "projects": serialize(res.get("Items", []))
        }

        if "LastEvaluatedKey" in res:
            output["nextToken"] = base64.b64encode(
                json.dumps(res["LastEvaluatedKey"]).encode()
            ).decode()

        return response(200, output)

    except Exception as e:
        logger.error(str(e))
        return response(500, {"error": "Internal server error"})

def response(status, body):
    return {
        "statusCode": status,
        "headers": {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Methods": "GET,OPTIONS"
        },
        "body": json.dumps(body)
    }
