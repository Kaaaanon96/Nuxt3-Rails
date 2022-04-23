RUN_BASE:= docker-compose run
RUN_ONLY:=$(RUN_BASE) --rm

EXEC_BASE:= docker-compose exec

default:
	@echo "a"

bundle-i:
	$(RUN_ONLY) api bundle install

rails-c:
	$(EXEC_BASE) api rails console

rails-c-only:
	$(RUN_ONLY) api rails console

credentials:
	$(RUN_ONLY) api rails credentials:edit

db-init:
	$(RUN_ONLY) api rails db:create

solargraph-init: yard-gems
	$(EXEC_BASE) solargraph mkdir -p `pwd`
	$(EXEC_BASE) solargraph ln -s /app `pwd`/api

yard-gems:
	$(EXEC_BASE) solargraph bundle exec yard gems

npm-i:
	$(RUN_ONLY) front npm install $(ARG)

volar-init:
	$(EXEC_BASE) volar mkdir -p `pwd`
	$(EXEC_BASE) volar ln -s /nuxt-app `pwd`/front

.PHONY: default db-init solargraph-init yard-gems rails-c rails-c-only bundle-i credentials npm-i

