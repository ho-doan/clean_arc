# TODO(any): change when build server file networks/lib/core/domain/networks/api_client.dart
cd networks && flutter build web
cd ..
rm ./server/public/*.json
rm ./server/public/*.js
rm ./server/public/*.png
rm ./server/public/*.html
rm ./server/public/.last_build_id
rm -r ./server/public/assets
rm -r ./server/public/canvaskit
rm -r ./server/public/icons
cp -r ./networks/build/web/. ./server/public/
cd ./server/public
cp -v index.html 404.html