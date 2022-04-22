RUN_BASE:= docker-compose run
RUN_ONLY:=$(RUN_BASE) --rm

EXEC_BASE:= docker-compose exec

default:
	@echo "a"

db-init:
	$(RUN_ONLY) api rails db:create

solargraph-init: yard-gems
	$(EXEC_BASE) solargraph mkdir -p `pwd`
	$(EXEC_BASE) solargraph ln -s /app `pwd`/api

yard-gems:
	$(EXEC_BASE) solargraph bundle exec yard gems

rails-c:
	$(EXEC_BASE) api rails console

rails-c-only:
	$(RUN_ONLY) api rails console

bundle-i:
	$(RUN_ONLY) api bundle install

credentials:
	$(RUN_ONLY) api rails credentials:edit

.PHONY: default db-init solargraph-init yard-gems rails-c rails-c-only bundle-i credentials

