#!/bin/bash

./ngrok tcp 22 > /dev/null &

WURL=""
while [[ $WURL == "" ]]; do
    set -e
    WURL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")" || true
done

echo "Server Running....."


WURL=null
while [[ $WURL == null ]]; do
    set -e
    WURL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")" || true
    sleep 1
done
echo ""
echo ""
echo $WURL
