-include .env
export

MIGRATIONS := db/migrations

.PHONY: help sqlc migrate-new migrate-up migrate-down

require-db:
	@[ -n "$(DB_URL)" ] || { echo "DB_URL not set (add to .env)"; exit 1; }

help: ## Show targets
	@grep -E '^[a-zA-Z0-9_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-14s %s\n", $$1, $$2}'

sqlc:  ## Generate database code
	sqlc generate

migrate-new: ## Create migration (make migrate-new <name>)
	@name="$(word 2,$(MAKECMDGOALS))"; \
	if [ -z "$$name" ]; then \
		echo "usage: make migrate-new <name>"; exit 1; \
	fi; \
	mkdir -p $(MIGRATIONS); \
	goose -dir $(MIGRATIONS) create "$$name" sql

migrate-up: require-db  ## Run up migrations
	goose -dir $(MIGRATIONS) postgres "${DB_URL}" up

migrate-down: require-db  ## Run down migrations
	goose -dir $(MIGRATIONS) postgres "${DB_URL}" down

%:
	@: