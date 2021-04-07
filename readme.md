# security.txt

## Usage
**Note**: pending a DNS change for an 'official' domain for this app.

You can either:
- use the following origin for your site's
`/.well-known/security.txt`:  
https://securitytxt.cloudapps.digital/.well-known/security.txt

- do a 302 redirect to:  
https://{pending_official_domain}/.well-known/security.txt

This is so that we can update the `security.txt` from one place.

## Deployment
A [GitHub Action](.github/workflows/deploy.yml) deploys changes to [security.txt](security.txt) in `main` to GOV.UK PaaS.  
The deployment also occurs every week to update the _expires_ field.
