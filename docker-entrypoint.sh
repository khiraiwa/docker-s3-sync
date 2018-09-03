#!/bin/sh

set -eo pipefail


case "$1" in
    s3-sync)
        busybox crond -l 2 -L /dev/stderr -f
        exit 0
        ;;

    help)
        echo "nothing."
        exit 0
        ;;
esac

exec "$@"
