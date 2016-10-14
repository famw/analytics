#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

get_population_list() {
  ls $1 | sort -t _ -k 2 -g
}

get_population_list ${@}
