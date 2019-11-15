uglifyjs  --compress --mangle --output ./js/jquery.fitvids.min.js -- ./js/jquery.fitvids.js
uglifyjs  --compress --mangle --output ./js/script.min.js -- ./js/script.js
uglifyjs  --compress --mangle --output ./assets/PgnViewerJS-0.9.8/js/pgnvjs.min.js -- ./assets/PgnViewerJS-0.9.7/js/pgnvjs.js

bundle exec jekyll build
