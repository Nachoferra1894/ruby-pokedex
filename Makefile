setup:
	docker compose build
dev:
	docker compose up
migrate:
	rails db:migrate

.PHONY: setup dev migrate