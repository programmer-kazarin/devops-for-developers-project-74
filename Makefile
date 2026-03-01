dev:
	docker compose up
test:
	docker compose -f docker-compose.yml run --rm app make test
ci:
	docker compose -f docker-compose.yml run --rm app make test
