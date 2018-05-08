echo 'transpiling scss'
wt compile src/scss/learn-love-save.scss --build="./static/css/" --comment="false"

echo 'prefixing css'
./node_modules/.bin/postcss --use autoprefixer -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css

echo 'cleaning css'
./node_modules/.bin/cleancss -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css

echo 'minifying js file'
./node_modules/.bin/uglifyjs ./src/js/learn-love-save.js --compress --mangle -o ./static/js/learn-love-save.js

echo 'hashing css/js file'
./hashing.sh

echo 'building static site'
hugo