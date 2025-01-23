#!/bin/bash

set -e

# Configure SBT options
[[ -n "${BEAM_RUNNERS}" ]]                   && echo "-DbeamRunners=$BEAM_RUNNERS"                                >> .sbtopts
[[ -n "${GOOGLE_CLOUD_PROJECT}" ]]           && echo "-Dbigquery.project=$GOOGLE_CLOUD_PROJECT"                   >> .sbtopts
[[ -n "${GOOGLE_APPLICATION_CREDENTIALS}" ]] && echo "-Dbigquery.secret=$GOOGLE_APPLICATION_CREDENTIALS"          >> .sbtopts
[[ -n "${BQ_CONNECT_TIMEOUT}" ]]             && echo "-Dbigquery.connect_timeout=$BQ_CONNECT_TIMEOUT"             >> .sbtopts
[[ -n "${BQ_READ_TIMEOUT}" ]]                && echo "-Dbigquery.read_timeout=$BQ_READ_TIMEOUT"                   >> .sbtopts
[[ -n "${CLOUDSQL_SQLSERVER_PASSWORD}" ]]    && echo "-Dcloudsql.sqlserver.password=$CLOUDSQL_SQLSERVER_PASSWORD" >> .sbtopts
