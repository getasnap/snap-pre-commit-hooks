#!/usr/bin/env bash

if [ -z "$PRE_COMMIT_DOCKER_CONTAINER" ]; then
	echo "No PRE_COMMIT_DOCKER_CONTAINER env variable set.  try "
	echo "export PRE_COMMIT_DOCKER_CONTAINER=development_users-api.api_1"
    exit 1
fi

docker exec -it ${PRE_COMMIT_DOCKER_CONTAINER} ./manage.py makemigrations --check --dry-run
