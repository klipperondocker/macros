#!/bin/bash
INITIAL_DIR=$(pwd)
cd ..
git reset --hard
git pull
cd $INITIAL_DIR
bash rebuild-index.sh
cd ..
git add *
git commit -m "auto-rebuild index"
git push
cd $INITIAL_DIR
