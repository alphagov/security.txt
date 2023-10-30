#!/usr/bin/env groovy

library("govuk")

node {
  // Run against the Postgres 13 Docker instance on GOV.UK CI
  // The database name is set to transition because Bouncer shares its database
  // with transition

  govuk.buildProject()
}
