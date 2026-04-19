# DevOps for developers — проект

## Статус CI

[![build-and-test](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions/workflows/push.yml)

[![Hexlet check](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/programmer-kazarin/devops-for-developers-project-74/actions)

## Системные требования

- [Docker](https://docs.docker.com/get-docker/) и Docker Compose (plugin `docker compose` v2)
- ОС: Linux, macOS или Windows с WSL2 (рекомендуется для согласованности путей и прав)

## Образ на Docker Hub

Сборка и публикация выполняются в GitHub Actions в job `build-and-test` (секреты `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`).

- Пример страницы образа (логин совпадает с владельцем репозитория на GitHub): [hub.docker.com/r/programmer-kazarin/devops-for-developers-project-74](https://hub.docker.com/r/programmer-kazarin/devops-for-developers-project-74)

В `docker-compose.yml` в поле `image` указано имя `kazarin/devops-for-developers-project-74` — при необходимости замените на свой `<username>/devops-for-developers-project-74`, совпадающий с публикацией из CI.

## Подготовка и запуск (локальная разработка)

Переменные для сервиса `app` заданы в `docker-compose.override.yml` (отдельный файл `.env` в корне не нужен — из‑за него падал `docker compose` в CI, если файла нет в репозитории).

1. Подготовьте зависимости и миграции внутри контейнера приложения:

   ```bash
   make setup
   ```

2. Запустите стек (приложение, при необходимости Caddy из `docker-compose.override.yml`):

   ```bash
   make dev
   ```

При необходимости скопируйте `app/.env.example` в `app/.env` для локальных переопределений внутри каталога приложения.

Приложение в режиме разработки доступно на порту **8080** (см. `docker-compose.override.yml`).

## Тесты и линтер

Запуск тестов в том же окружении, что и в CI (только `docker-compose.yml`, без override). Перед запуском образ `app` пересобирается из `Dockerfile.production` (`--build`), чтобы не использовать устаревший образ с Docker Hub.

```bash
make test
```

Линтер:

```bash
make lint
```

Линтер и тесты подряд (как в CI):

```bash
make ci
```

## Команды Makefile

| Цель   | Назначение |
|--------|------------|
| `make setup` | Первичная подготовка: `make setup` внутри сервиса `app` (compose с override) |
| `make dev`   | Запуск `docker compose up` |
| `make test`  | Тесты в контейнере `app` |
| `make lint`  | ESLint в контейнере `app` |
| `make ci`    | Линтер и тесты в контейнере (как в GitHub Actions) |
