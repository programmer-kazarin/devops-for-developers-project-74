### Hexlet tests and linter status:
[![Actions Status](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions)

# Step1
``` bash
touch docker-compose.yml
git clone git@github.com:hexlet-components/js-fastify-blog.git app
rm -rf app/.git
docker run -u $(id -u) -it -w /out -v `pwd`/app:/out node:20.12.2 make setup
docker run -u $(id -u) -it -w /out -v `pwd`/app:/out -p 8080:8080 node:20.12.2 make dev
```

# Step 2
``` bash
vim .dockerignore
vim Dockerfile
docker-compose run --rm app make setup
docker-compose up --abort-on-container-exit
docker-compose up
docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
vim Makefile
```

# Step 3
``` bash
docker login
cp Dockerfile Dockerfile.production
vim Dockerfile.production
vim docker-compose.override.yml
vim docker-compose.yml
docker-compose -f docker-compose.yml up --abort-on-container-exit
vim docker-compose.yml
docker-compose -f docker-compose.yml build app
docker-compose -f docker-compose.yml push app
docker run -p 8080:8080 -e NODE_ENV=development kazarin/devops-for-developers-project-74 make dev
```