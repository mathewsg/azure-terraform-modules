# SHELL := /bin/bash

# build_env:
# 	@echo "Building Env"
# 	chmod +x ./setupenv.sh
# 	source ./setupenv.sh

init:
	terraform -chdir=${ROOT_DIR} init

fmt:
	terraform -chdir=${ROOT_DIR} fmt

lint:
	tflint --chdir=${ROOT_DIR} --init --config=../../.tflint.hcl
	tflint --chdir=${ROOT_DIR}  


plan:
	terraform -chdir=${ROOT_DIR} plan
apply:
	terraform -chdir=${ROOT_DIR} apply  --auto-approve

destroy:
	terraform -chdir=${ROOT_DIR} destroy  --auto-approve
 
clean:
	@echo "Cleaning up..."
	rm -r ${ROOT_DIR}/.terraform*
	rm -r ${ROOT_DIR}/*.tfstate
	rm -r ${ROOT_DIR}/*.backup

e2e_test: init fmt lint plan clean

e2e_deploy: init lint plan apply