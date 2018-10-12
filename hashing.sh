#!/bin/bash
set -e

mkdir -p ./data/assets/css/
mkdir -p ./data/assets/js/

HASH=`rev-hash --rename ./static/css/learn-love-save.css | awk '{print $1}'`
SRI=`cat ./static/css/learn-love-save-$HASH.css | openssl dgst -sha384 -binary | openssl base64 -A`

HASH_JS=`rev-hash --rename ./static/js/learn-love-save.js | awk '{print $1}'`
SRI_JS=`cat ./static/js/learn-love-save-$HASH_JS.js | openssl dgst -sha384 -binary | openssl base64 -A`

echo "{ \"filename\": \"/css/learn-love-save-$HASH.css\", \"sri384\": \"sha384-$SRI\" }" > ./data/assets/css/lls.json
echo "{ \"filename\": \"/js/learn-love-save-$HASH_JS.js\", \"sri384\": \"sha384-$SRI_JS\" }" > ./data/assets/js/lls.json
