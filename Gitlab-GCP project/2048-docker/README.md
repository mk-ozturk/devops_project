![Docker Image Size (tag)](https://img.shields.io/docker/image-size/agrawpri/2048-docker/latest)

Hosted on GitHub Pages: https://agrawpri.github.io/2048-docker/

This is a dockerized version of the 2048 game cloned from https://github.com/gabrielecirulli/2048.

# Local development

### Prerequisites
- docker
- git (for development)

## To run locally
1. `docker pull agrawpri/2048-docker`
2. `docker run --rm -p 80:80 2048`
3. Visit `http://localhost:80`

## To develop
1. `git clone https://github.com/Priyansh121096/2048-docker`
2. `cd 2048-docker`
3. `docker build -t 2048 .`
4. `docker run --rm -p 80:80 2048`
5. Visit `http://localhost:80`

