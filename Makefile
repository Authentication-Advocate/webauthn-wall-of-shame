all: build run-interactively

build:
	docker build -t webauthn-hall-of-shame-local-dev -f local-development.Dockerfile .

run: stop build
	docker run -d --rm --name=webauthn-hall-of-shame-local-dev --mount type=bind,source=${CURDIR},destination=/app/ -p 8080:4000 webauthn-hall-of-shame-local-dev

run-interactively: run
	docker exec -it --workdir=/app/ webauthn-hall-of-shame-local-dev ash
	$(MAKE) stop

stop:
	docker stop webauthn-hall-of-shame-local-dev || true