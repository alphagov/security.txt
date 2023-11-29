.SHELL := /bin/bash
.DEFAULT_GOAL := build
.PHONY = clean

deploy: build
	terraform -chdir=terraform/cst-test init -upgrade
	terraform -chdir=terraform/cst-test apply
	aws s3 cp --profile cst-test --recursive dist s3://dev-cs-security.staging.gds-cyber-security.digital-website

deploy-mac: build-mac
	terraform -chdir=terraform/cst-test init -upgrade
	terraform -chdir=terraform/cst-test apply
	aws s3 cp --profile cst-test --recursive dist s3://dev-cs-security.staging.gds-cyber-security.digital-website

build-mac: clean
	mkdir -p dist/.well-known/
	cp security.txt dist/
	cp thanks.txt dist/
	
	echo "" >> dist/security.txt
	echo -n "Last-Updated: " >> dist/security.txt
	date +"%Y-%m-%dT%H:%M:%SZ" >> dist/security.txt
	
	echo -n "Expires: " >> dist/security.txt
	date -v+3m +"%Y-%m-%dT%H:%M:%SZ" >> dist/security.txt
	
	echo "" >> dist/security.txt
	echo "# Generated at: https://github.com/alphagov/security.txt" >> dist/security.txt
	
	cp dist/security.txt dist/.well-known/
	cp paas_app/* dist/

build: clean
	mkdir -p dist/.well-known/
	cp security.txt dist/
	cp thanks.txt dist/
	
	echo "" >> dist/security.txt
	echo -n "Last-Updated: " >> dist/security.txt
	date --rfc-3339='seconds' >> dist/security.txt
	
	echo -n "Expires: " >> dist/security.txt
	date -v+3m +"%Y-%m-%dT%H:%M:%SZ" >> dist/security.txt
	
	echo "" >> dist/security.txt
	echo "# Generated at: https://github.com/alphagov/security.txt" >> dist/security.txt
	
	cp dist/security.txt dist/.well-known/
	cp paas_app/* dist/

clean:
	rm -rf dist
