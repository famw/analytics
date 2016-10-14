#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

# $1 - Population file
# $2 - Number of the organism

get_organism() {
  sed -n '/\/* Organism #'${2}' /,/genomeend/p' $1 | tail -n+2
}

get_organism ${@}
