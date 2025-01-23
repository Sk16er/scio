#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to configure SBT options based on environment variables
configure_sbt_option () {
  local env_var_name=$1
  local sbt_key=$2
  local env_var_value=${!env_var_name}

  if [[ -n "$env_var_value" ]]; then
    echo "-D$sbt_key=$env_var_value" >> .sbtopts
  fi
}

# List of environment variables and corresponding SBT keys
declare -A sbt_options=(
  ["BEAM_RUNNERS"]="beamRunners"
  ["GOOGLE_CLOUD_PROJECT"]="bigquery.project"
  ["GOOGLE_APPLICATION_CREDENTIALS"]="bigquery.secret"
  ["BQ_CONNECT_TIMEOUT"]="bigquery.connect_timeout"
  ["BQ_READ_TIMEOUT"]="bigquery.read_timeout"
  ["CLOUDSQL_SQLSERVER_PASSWORD"]="cloudsql.sqlserver.password"
)

# Configure each SBT option
for env_var in "${!sbt_options[@]}"; do
  configure_sbt_option "$env_var" "${sbt_options[$env_var]}"
done
