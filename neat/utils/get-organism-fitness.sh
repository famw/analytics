#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

# $1 - Population file
# $2 - Number of the organism

get_organism_fitness() {
  declare -r org_file=${1}
  shift
  if [ $# -eq 0 ]; then
    grep "Organism #" ${org_file} | awk '{print $5}'
  else
    for org in "${@}"; do
      grep "Organism #${org} " ${org_file} | awk '{print $5}'
    done
  fi
}

get_organism_fitness ${@}
