#!/usr/bin/env bash

# Tools used in this script:
# - http: https://httpie.org/
# - hey: https://github.com/rakyll/hey
# - wrk: https://github.com/wg/wrk

start=`date +%s`

ENDPOINT=http://127.0.0.1:8080/helloWorld

echo "ENDPOINT: $ENDPOINT"

echo '==> Simple request'

http :8080/helloWorld

echo '==> First load'

hey -n 100000 -c 100 $ENDPOINT

sleep 10

echo '==> Second request'

hey -n 100000 -c 100 $ENDPOINT

sleep 10

echo '==> Third request'

hey -n 100000 -c 100 $ENDPOINT

sleep 10

echo '==> hit it for 30s'

wrk -c 100 -d 30s -t 10 $ENDPOINT

echo '==> Last simple request'

http :8080/helloWorld

end=`date +%s`

echo "Total time in seconds: $((end-start))"

