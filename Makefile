.SHELL := /bin/bash
.DEFAULT_GOAL := build
.PHONY = clean

deploy: build
	cf7 push securitytxt --strategy rolling

build: clean
	mkdir -p dist/.well-known/
	cp security.txt dist/
	cp thanks.txt dist/
	echo -n "Expires: " >> dist/security.txt
	date -d '+3 months' -R >> dist/security.txt
	echo "# Generated at: https://github.com/alphagov/security.txt" >> dist/security.txt
	cp dist/security.txt dist/.well-known/
	cp paas_app/* dist/

clean:
	rm -rf dist
