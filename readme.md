# security.txt

## Usage

You can either:
- use the following origin for your site's
`/.well-known/security.txt`:  
https://vdp.cabinetoffice.gov.uk/.well-known/security.txt

- do a 302 redirect to:  
https://vdp.cabinetoffice.gov.uk/.well-known/security.txt

This is so that we can update the `security.txt` from one place.

## Deployment

- To make changes in thanks.txt create a new pull request. Once approved GitHub automatically will deploy new file to the AWS where content is being hosted.
- File security.txt is a template which is being updated and uploaded on every merge to main with new expiration date
- The deployment also occurs every week to update the _expires_ field.

### Caching

- Current setup is using cache service in the fron of the app. Please allow up to 24 hours before any changes will be visible after merging code to main branch.