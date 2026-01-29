import { API_BASE_URL } from './config.js';

async function loadProjects() {
    const container = document.getElementById('projects-container');
    
    try {
        const response = await fetch(`${API_BASE_URL}/projects`);
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const projects = await response.json();
        
        if (projects.length === 0) {
            container.innerHTML = '<div class="loading">No projects found.</div>';
            return;
        }
        
        container.innerHTML = '<div class="projects">' + 
            projects.map(project => `
                <div class="project-card">
                    <div class="project-title">${project.title}</div>
                    <div class="project-description">${project.description}</div>
                    <div class="tech-stack">
                        ${project.stack ? project.stack.map(tech => `<span class="tech-tag">${tech}</span>`).join('') : ''}
                    </div>
                    <div class="project-links">
                        ${project.github ? `<a href="${project.github}" target="_blank">GitHub</a>` : ''}
                        ${project.live ? `<a href="${project.live}" target="_blank">Live Demo</a>` : ''}
                    </div>
                </div>
            `).join('') + 
        '</div>';
        
    } catch (error) {
        console.error('Error loading projects:', error);
        container.innerHTML = '<div class="error">Failed to load projects. Please try again later.</div>';
    }
}

document.addEventListener('DOMContentLoaded', loadProjects);