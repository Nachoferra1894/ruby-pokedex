setup:
	docker compose build
dev:
	docker compose up

.PHONY: setup dev