#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

declare -r SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare -r UTILS_PATH="${SCRIPT_PATH}/utils"

get_fitness_by_population() {
  declare -r pop_folder=${1}
  declare -r pop_files=$( ${UTILS_PATH}/get-population-list.sh ${pop_folder} )

  for pop in ${pop_files}; do
    declare pop_number=$(echo ${pop} | sed 's/[^0-9]*//g')
    declare all_fitness=$(
      ${UTILS_PATH}/get-winners.sh ${pop_folder}/${pop} |
      ${UTILS_PATH}/get-organism-fitness.sh ${pop_folder}/${pop}
    )
    declare highest_fitness=$(echo "${all_fitness[*]}" | sort -nr | head -n1)
    echo "${pop_number} ${highest_fitness}"
  done
}

get_fitness_by_population ${@}
