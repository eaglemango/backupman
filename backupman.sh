#!/bin/bash

if [ ! -d $HOME/backupman-archives ]; then
  mkdir $HOME/backupman-archives
fi

cd $HOME/backupman-archives

DIR_NAME=$1
ARCHIVE_NAME=$2

mkdir $DIR_NAME

shopt -s globstar
for file in $HOME/**/*.cpp; do
  cp $file $DIR_NAME
done

tar -cf $ARCHIVE_NAME.tar $DIR_NAME

rm -rf $DIR_NAME

echo "done"

