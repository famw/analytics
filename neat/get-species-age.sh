#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

get_species_number() {
  grep "Species #" ${1} | awk '{print $10}' | sed 's/[^0-9]//'
}

get_species_number ${@}
