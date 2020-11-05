.PHONY: tf-deps tf-deps-clean tf-init tf-plan tf-apply services-up services-down

ALL_SERVICES = find ./services -mindepth 1 -maxdepth 1 -type d
PUBLIC_IP ?= $(shell curl https://ifconfig.me 2>/dev/null)

tf-init:
	@echo "---> Attempting to init Terraform. If this fails, ensure env includes DigitalOcean creds"
	cd terraform && terraform init

tf-plan: tf-init
	cd terraform && terraform plan -var="public_ip=$(PUBLIC_IP)"

tf-apply: tf-init
	cd terraform && terraform apply -var="public_ip=$(PUBLIC_IP)"

services-up:
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose up -d'

services-down:
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose down'

services-destroy: services-down
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose rm'
