app-up:
	docker-compose up
app-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
