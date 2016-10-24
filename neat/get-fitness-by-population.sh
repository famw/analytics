#!/usr/bin/env bash
# vim: set ts=2 sw=2 expandtab :

set -o errexit
set -o pipefail
set -o nounset

declare -r SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
declare -r LIB_PATH="${SCRIPT_PATH}/lib"
declare -r UTILS_PATH="${SCRIPT_PATH}/utils"
declare -r NUM="${LIB_PATH}/num"

get_fitness_by_population() {
  declare -r pop_folder=${1}
  declare -r pop_files=$( ${UTILS_PATH}/get-population-list.sh ${pop_folder} )

  echo "Generation min(all) avg(all) max(all) min(win) avg(win) max(win)"
  for pop in ${pop_files}; do
    declare pop_number=$(echo ${pop} | sed 's/[^0-9]*//g')
    declare all_fitness=$(
      ${UTILS_PATH}/get-organism-fitness.sh ${pop_folder}/${pop}
    )
    declare winners_fitness=$(
      ${UTILS_PATH}/get-winners.sh ${pop_folder}/${pop} | xargs \
      ${UTILS_PATH}/get-organism-fitness.sh ${pop_folder}/${pop}
    )
    declare all_results=$(echo "${all_fitness[*]}" | ${NUM} min avg max)
    declare winner_results=$(echo "${winners_fitness[*]}" | ${NUM} min avg max)
    echo "${pop_number} ${all_results} ${winner_results}"
  done
}

get_fitness_by_population ${@}
