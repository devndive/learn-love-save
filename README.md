# Inspriation to the asset pipeline
https://blog.carlmjohnson.net/post/2017/hugo-asset-pipeline/

# Inspiration for setup
https://vickylai.com/verbose/aws-static-site/

# Setup

## scss wrapper for go
brew install wellington

## node modules
npm install

# Running the pipeline

## Build css
wt compile src/scss/learn-love-save.scss --build="./static/css/" --comment="false"

## Add vendor prefixes
./node_modules/.bin/postcss --use autoprefixer -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css

## Minify the css
./node_modules/.bin/cleancss -o ./static/css/learn-love-save.css ./static/css/learn-love-save.css

## Add hash to css for cash busting
./hashing.sh

# Cleaning up

## cleaning up public
find public/ -mindepth 1 -delete