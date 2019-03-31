#!/bin/sh
set -e

#HUGO_DESTINATION="${HUGO_DESTINATION}:=/output}"
PWD=`pwd`

HUGO="docker run --rm -v ${PWD}:/src -w /src devndive/uts"

${HUGO} wt compile src/scss/learn-love-save.scss --build="./static/css/" --comment="false"
${HUGO} postcss --use autoprefixer -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css
${HUGO} cleancss -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css
${HUGO} uglifyjs ./src/js/learn-love-save.js --compress --mangle -o ./static/js/learn-love-save.js

mkdir -p ./data/assets/css/
mkdir -p ./data/assets/js/

HASH=`${HUGO} rev-hash --rename ./static/css/learn-love-save.css | awk '{print $1}'`
SRI_384=`${HUGO} cat ./static/css/learn-love-save-$HASH.css | openssl dgst -sha384 -binary | openssl base64 -A`

HASH_JS=`${HUGO} rev-hash --rename ./static/js/learn-love-save.js | awk '{print $1}'`
SRI_384_JS=`${HUGO} cat ./static/js/learn-love-save-$HASH_JS.js | openssl dgst -sha384 -binary | openssl base64 -A`

echo "{ \"filename\": \"/css/learn-love-save-$HASH.css\", \"sri384\": \"sha384-$SRI_384\" }" > ./data/assets/css/lls.json
echo "{ \"filename\": \"/js/learn-love-save-$HASH_JS.js\", \"sri384\": \"sha384-$SRI_384_JS\" }" > ./data/assets/js/lls.json

$HUGO hugo
