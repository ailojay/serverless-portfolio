import json
import pytest
import sys
import os

# Add the lambda directories to the path for testing
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'backend', 'lambda', 'health'))
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'backend', 'lambda', 'projects'))

class TestHealthLambda:
    """Test cases for the health Lambda function"""
    
    def test_health_endpoint_structure(self):
        """Test that health endpoint returns proper structure"""
        # Import here to avoid import issues
        from backend.lambda.health.app import lambda_handler
        
        # Mock event and context
        event = {}
        context = {}
        
        # This would need mocking for actual testing
        # response = lambda_handler(event, context)
        # assert response['statusCode'] == 200
        # assert 'body' in response
        pass

class TestProjectsLambda:
    """Test cases for the projects Lambda function"""
    
    def test_projects_endpoint_structure(self):
        """Test that projects endpoint returns proper structure"""
        # This would require mocking DynamoDB
        pass
    
    def test_normalize_function(self):
        """Test the normalize function for DynamoDB data"""
        from backend.lambda.projects.app import normalize
        from decimal import Decimal
        
        # Test decimal normalization
        test_data = {
            'number': Decimal('123.45'),
            'integer': Decimal('100'),
            'string': 'test',
            'list': [Decimal('1'), 'item'],
            'nested': {
                'decimal': Decimal('99.99')
            }
        }
        
        result = normalize(test_data)
        
        assert result['number'] == 123.45
        assert result['integer'] == 100
        assert result['string'] == 'test'
        assert result['list'][0] == 1
        assert result['nested']['decimal'] == 99.99

if __name__ == '__main__':
    pytest.main([__file__])