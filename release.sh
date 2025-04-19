#! /usr/bin/bash
set -uvx
set -e
pubspec-gen
#dart pub add dev:output dev:path
dart pub get
./do-analyze.sh
./do-test.sh
dart pub publish
git add .
git commit -m.
git push
