.PHONY: tf-deps tf-deps-clean tf-init tf-plan tf-apply services-up services-down

ALL_SERVICES = find ./services -mindepth 1 -maxdepth 1 -type d
PUBLIC_IP ?= $(shell curl https://ifconfig.me 2>/dev/null)

.tfdeps:
	mkdir -p ~/.terraform.d/plugins
	mkdir -p .tfdeps-build
	-rm -rf .tfdeps-build/terraform-provider-gandi
	git clone https://github.com/tiramiseb/terraform-provider-gandi.git .tfdeps-build/terraform-provider-gandi
	cd .tfdeps-build/terraform-provider-gandi && git checkout abdf9a3c914f734b7293a62382fe3f5ff882c871 && go build -o ~/.terraform.d/plugins/terraform-provider-gandi
	touch .tfdeps

tf-deps: .tfdeps
tf-deps-clean:
	-rm -rf .tfdeps .tfdeps-build
	-rm -rf ~/.terraform.d/plugins/terraform-provider-gandi

tf-init: .tfdeps
	@(env | grep GANDI_KEY >/dev/null) || (echo "---> [FATAL] Must set GANDI_KEY in env" >&2; exit 1)
	@echo "---> Attempting to init Terraform. If this fails, ensure env includes GANDI_KEY and GANDI_SHARING_ID"
	terraform init

tf-plan: tf-init
	terraform plan -var="public_ip=$(PUBLIC_IP)"

tf-apply: tf-init
	terraform apply -var="public_ip=$(PUBLIC_IP)"

services-up:
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose up -d'

services-down:
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose down'

services-destroy: services-down
	$(ALL_SERVICES) | xargs -i sh -c 'cd {}; echo "---> {}"; docker-compose rm'
