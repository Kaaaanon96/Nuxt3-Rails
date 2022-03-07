RUN_BASE:= docker-compose run
RUN_ONLY:=$(RUN_BASE) --rm

db-init:
	$(RUN_ONLY) api rails db:create

rails-c:
	$(RUN_ONLY) api rails console

bundle-i:
	$(RUN_ONLY) api bundle install

credentials:
	$(RUN_ONLY) api rails credentials:edit

.PHONY: init rails-c bundle-i credentials
