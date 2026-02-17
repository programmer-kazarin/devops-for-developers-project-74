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