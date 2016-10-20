#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

declare -r SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare -r UTILS_PATH="${SCRIPT_PATH}/utils"

get_winners_count_by_population() {
  declare -r pop_folder=${1}
  declare -r pop_files=$( ${UTILS_PATH}/get-population-list.sh ${pop_folder} )

  for pop in ${pop_files}; do
    declare pop_number=$(echo ${pop} | sed 's/[^0-9]*//g')
    declare winners_count=$(
      ${UTILS_PATH}/get-winners.sh ${pop_folder}/${pop} | wc -l
    )
    echo "${pop_number} ${winners_count}"
  done
}

get_winners_count_by_population ${@}
