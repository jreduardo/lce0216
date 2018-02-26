#!/bin/sh

git config --global user.email "edujrrib@gmail.com"
git config --global user.name "Travis boot to deploy pdf files"

git clone -b gh-pages https://${GIT_KEY}@github.com/jreduardo/lce0216 dir-output
cp *.pdf aulas/*.pdf dir-output/

cd dir-output/
git add --all *
git commit -m "Automatic Update (build number ${TRAVIS_BUILD_NUMBER})" || true
git push origin gh-pages
