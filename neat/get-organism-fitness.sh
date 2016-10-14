#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

# $1 - Population file
# $2 - Number of the organism

get_organism_fitness() {
  grep "Organism #${2:-}" ${1} | awk '{print $5}'
}

get_organism_fitness ${@}
