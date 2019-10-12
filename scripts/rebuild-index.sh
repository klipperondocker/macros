#!/bin/bash
INITIAL_DIR=$(pwd)
cd ../docs

FILES=$(ls *.md)

echo "" > index.md
cat index.prefix.md >> index.md

for FILE in *.md
do
  SKIP=0

  if [ "$FILE" == "index.md" ]; then
    echo "skipping index file"
    SKIP=1
  fi
  if [ "$FILE" == "index.prefix.md" ]; then
    echo "skipping index file"
    SKIP=1
  fi
  if [ "$FILE" == "index.suffix.md" ]; then
    echo "skipping index file"
    SKIP=1
  fi

  if [ "$SKIP" == "0" ]; then
    echo $FILE
    TITLE=$(cat $FILE | grep "# " | head -n 1)
    echo $TITLE

    echo "* [$TITLE]($FILE)" >> index.md
  fi
done

cat index.suffix.md >> index.md


cd $INITIAL_DIR


