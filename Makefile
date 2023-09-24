.DEFAULT_GOAL := help
IMAGE=$(shell head -n1 local-development.Dockerfile | awk '{print $$2}')

#help: @ List available tasks on this project
help: 
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(MAKEFILE_LIST)| tr -d '#' | sed -E 's/Makefile.//' | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#build: @ Build, but do not run, the container
build:
	docker build -t webauthn-hall-of-shame-local-dev -f local-development.Dockerfile .

#run: @ Build and run the container non-interactively
run: stop build
	docker run -d --name=webauthn-hall-of-shame-local-dev --mount type=bind,source=${CURDIR},destination=/app/ -p 8080:4000 webauthn-hall-of-shame-local-dev

#run-interactively: @ Build and run the container interactively
run-interactively: run
	docker exec -it --workdir=/app/ webauthn-hall-of-shame-local-dev ash
	$(MAKE) stop

#get-logs: @ Get logs from a failed container run
get-logs: 
	docker logs webauthn-hall-of-shame-local-dev

#update-gemfile: @ Update the Gemfile
update-gemfile:
	docker run -it --rm --workdir=/app/ --entrypoint=/app/update_gemfile.sh \
		--mount type=bind,source=${CURDIR},destination=/app/ ${IMAGE}

#test-configs: @ Test parseability and validity of each config
test-configs:
	docker build -t webauthn-hall-of-shame-config-test .github/workflows/config-test/
	docker run --rm --mount type=bind,source=${CURDIR}/_vendors,destination=/configs/ webauthn-hall-of-shame-config-test 

#stop: @ Stop the container
stop:
	@docker stop webauthn-hall-of-shame-local-dev || true
	@docker rm webauthn-hall-of-shame-local-dev || true
