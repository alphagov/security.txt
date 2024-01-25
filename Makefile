.SHELL := /bin/bash
.DEFAULT_GOAL := build
.PHONY = clean

deploy: build
	echo "Deploy to non-live"
	aws s3 cp --profile cst-test --recursive dist s3://dev-cs-security.staging.gds-cyber-security.digital-website
	echo "Deploy to live"
	aws s3 cp --profile co-cyber-security-external --recursive dist s3://prod-vdp.cabinetoffice.gov.uk-website

build: clean
	mkdir -p dist/.well-known/
	cp security.txt dist/
	cp thanks.txt dist/
	
	echo "" >> dist/security.txt
	echo "Last-Updated: " >> dist/security.txt
	date +"%Y-%m-%dT%H:%M:%SZ" >> dist/security.txt
	
	echo "Expires: " >> dist/security.txt
	date -v+3m +"%Y-%m-%dT%H:%M:%SZ" >> dist/security.txt
	
	echo "" >> dist/security.txt
	echo "# Generated at: https://github.com/alphagov/security.txt" >> dist/security.txt
	
	cp dist/security.txt dist/.well-known/
	cp paas_app/* dist/

clean:
	rm -rf dist
