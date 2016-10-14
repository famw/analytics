#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

get_winners() {
  grep "WINNER" ${1} | awk '{print $4}'
}

get_winners ${@}
