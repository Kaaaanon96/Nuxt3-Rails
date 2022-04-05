RUN_BASE:= docker-compose run
RUN_ONLY:=$(RUN_BASE) --rm

db-init:
	$(RUN_ONLY) api rails db:create

solargraph-init:
	docker-compose exec solargraph mkdir -p `pwd`
	docker-compose exec solargraph ln -s /app `pwd`/api
	docker-compose exec solargraph bundle exec yard gems

rails-c:
	$(RUN_ONLY) api rails console

bundle-i:
	$(RUN_ONLY) api bundle install

credentials:
	$(RUN_ONLY) api rails credentials:edit

.PHONY: db-init solargraph-init rails-c bundle-i credentials
