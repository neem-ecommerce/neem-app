goal := $(or $(MAKECMDGOALS), $(.DEFAULT_GOAL))

build:
	docker build . --target $(goal) -t neem-app

dev: build
	docker run --name neem-app --env-file .env -p 4210:4200 --net neem-net -v $(shell pwd):/work -it --rm neem-app

runtime:
	docker run --name neem-app --env-file .env -p 4210:4000 --net neem-net -d neem-app