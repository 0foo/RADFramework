# Makefile for golang-migrate
.PHONY: up down force create newversion version

# Command template
export MIGRATE_CMD=migrate -path $(MIGRATIONS_DIR) -database "$(DB_URL)"

up:
	$(MIGRATE_CMD) up

down:
	$(MIGRATE_CMD) down 1

force:
	@echo "Usage: make force VERSION=your_version_number"
	@exit 1

force-version:
ifndef VERSION
	$(error VERSION is undefined. Usage: make force-version VERSION=your_version_number)
endif
	$(MIGRATE_CMD) force $(VERSION)

create:
ifndef NAME
	$(error NAME is undefined. Usage: make create NAME=your_migration_name)
endif
	migrate create -ext sql -dir $(MIGRATIONS_DIR) $(NAME)

newversion:
	$(MIGRATE_CMD) version

