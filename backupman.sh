#!/bin/bash

if [ ! -d $HOME/backupman-archives ]; then
  mkdir $HOME/backupman-archives
fi

cd $HOME/backupman-archives

DIR_NAME=$1
ARCHIVE_NAME=$2
shift
shift

mkdir $DIR_NAME

shopt -s globstar
for file_type in $@; do
  for file in $HOME/**/*.$file_type; do
    cp $file $DIR_NAME
  done
done

tar -cf $ARCHIVE_NAME.tar $DIR_NAME

rm -rf $DIR_NAME

echo "done"

