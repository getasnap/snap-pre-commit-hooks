#!/bin/sh
# husky

# Hook created by Husky
#   Version: 3.1.0
#   At: 1/15/2020, 11:06:06 AM
#   See: https://github.com/typicode/husky#readme

# From
#   Directory: /app/node_modules/husky
#   Homepage: https://github.com/typicode/husky#readme

echo $@

scriptPath="node_modules/husky/run.js"
hookName="pre-commit"
gitParams="$*"

debug() {
  if [ "${HUSKY_DEBUG}" = "true" ] || [ "${HUSKY_DEBUG}" = "1" ]; then
    echo "husky:debug $1"
  fi
}

debug "husky v3.1.0 (created at 1/15/2020, 11:06:06 AM)"
debug "$hookName hook started"
debug "Current working directory is '`pwd`'"

if [ "${HUSKY_SKIP_HOOKS}" = "true" ] || [ "${HUSKY_SKIP_HOOKS}" = "1" ]; then
  debug "HUSKY_SKIP_HOOKS is set to ${HUSKY_SKIP_HOOKS}, skipping hook"
  exit 0
fi

debug "Calling husky through Yarn"
yarn husky-run $hookName "$gitParams"
