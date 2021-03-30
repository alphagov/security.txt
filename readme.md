# security.txt

## Usage
Ideally, you should use the following origin for your site's
`/.well-known/security.txt`:  
https://securitytxt.cloudapps.digital/.well-known/security.txt

Alternatively, you may do a 302 redirect to:
https://securitytxt.cloudapps.digital/.well-known/security.txt

This is so that we can update the `security.txt` from one place.

## Deployment
A [GitHub Action](.github/workflows/deploy.yml) deploys changes to [security.txt](security.txt) in `main` to GOV.UK PaaS.  
The deployment also occurs every week to update the _expires_ field.
