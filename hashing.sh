#!/bin/bash
set -e

mkdir -p ./data/assets/css/
mkdir -p ./data/assets/js/

HASH=`rev-hash --rename ./static/css/learn-love-save.css | awk '{print $1}'`
SRI=`shasum -b -a 384 ./static/css/learn-love-save-$HASH.css | xxd -r -p | base64`

HASH_JS=`rev-hash --rename ./static/js/learn-love-save.js | awk '{print $1}'`
SRI_JS=`shasum -b -a 384 ./static/js/learn-love-save-$HASH_JS.js | xxd -r -p | base64`

echo "{ \"filename\": \"/css/learn-love-save-$HASH.css\", \"sri384\": \"sha384-$SRI\" }" > ./data/assets/css/lls.json
echo "{ \"filename\": \"/js/learn-love-save-$HASH_JS.js\", \"sri384\": \"sha384-$SRI_JS\" }" > ./data/assets/js/lls.json
