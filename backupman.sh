#!/bin/bash

if [ ! -d $HOME/backupman-archives ]; then
  mkdir $HOME/backupman-archives
fi

cd $HOME/backupman-archives

DIR_NAME=$1
ARCHIVE_NAME=$2
shift
shift

mkdir "$DIR_NAME"

shopt -s globstar
for file_type in $@; do
  for file in $HOME/**/*.$file_type; do
    if [[ ( -r "$file" ) && ( -f "$file" ) ]]; then
      FILE_PATH="$(echo "$file" | rev | cut -d'/' -f2- | rev | cut -d'/' -f4-)"

      if [ ! -d "$DIR_NAME/$FILE_PATH" ]; then
        mkdir -p "$DIR_NAME/$FILE_PATH"
      fi

      cp "$file" "$DIR_NAME/$FILE_PATH"
    fi
  done
done

DATE=`date +%d.%m.%Y-%H:%M:%S`
tar --force-local -cf "$ARCHIVE_NAME-$DATE".tar "$DIR_NAME"

rm -rf "$DIR_NAME"

echo "done"
