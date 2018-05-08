HASH=`./node_modules/.bin/rev-hash --rename ./static/css/learn-love-save.css | awk '{print $1}'`

HASH_JS=`./node_modules/.bin/rev-hash --rename ./static/js/learn-love-save.js | awk '{print $1}'`

echo "{ \"css/learn-love-save.css\": \"/css/learn-love-save-$HASH.css\", \"js/learn-love-save.js\": \"/js/learn-love-save-$HASH_JS.js\" }" > ./data/assets.json
