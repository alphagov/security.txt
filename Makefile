.SHELL := /bin/bash
.DEFAULT_GOAL := build
.PHONY = clean

deploy: build
	cf7 push securitytxt --strategy rolling

build: clean
	mkdir -p /usr/share/nginx/html/.well-known/
	cp security.txt /usr/share/nginx/html/
	cp thanks.txt /usr/share/nginx/html/
	
	echo "" >> /usr/share/nginx/html/security.txt
	echo -n "Last-Updated: " >> /usr/share/nginx/html/security.txt
	date --rfc-3339='seconds' >> /usr/share/nginx/html/security.txt
	
	echo -n "Expires: " >> /usr/share/nginx/html/security.txt
	date -d '+3 months' --rfc-3339='seconds' >> /usr/share/nginx/html/security.txt
	
	echo "" >> /usr/share/nginx/html/security.txt
	echo "# Generated at: https://github.com/alphagov/security.txt" >> /usr/share/nginx/html/security.txt
	
	cp /usr/share/nginx/html/security.txt /usr/share/nginx/html/.well-known/
	cp paas_app/* /usr/share/nginx/html/

clean:
	rm -rf dist
