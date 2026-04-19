setup:
	docker compose run --rm app make setup

dev:
	docker compose up

test:
	docker compose -f docker-compose.yml run --rm --build app make test

lint:
	docker compose -f docker-compose.yml run --rm --build app make lint

ci:
	docker compose -f docker-compose.yml run --rm --build app make lint test
