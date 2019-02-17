# Backupman

Backupman is a brand new (no) tool for backup. It helps users to keep important files in safety easily. Just run only command and have your data backuped.

(Truly, that's just my Technologies of Programming homework)

## Usage

Backupman is easy to use, it can be clearly shown by some examples.

### General usage

Script needs to be launched in the following form:

```
$ ./backupman.sh directory_name archive_name file_type1 file_type2 ...
```
As the result, you will get an archive, which contains directory `directory_name` with all files of `file_type1`, `file_type2` and other selected types. Note that Backupman looks for files only in user's home directory.

Backups can be found here:

```
~/backupman-archives/
```

### Examples

Backup all python scripts:

```
$ ./backupman.sh sources python_scripts py
```

Backup all .cpp files:

```
$ ./backupman.sh my_sources CPP_archive cpp
```

Mixing different types:

```
$ ./backupman.sh important sunday_backup cpp py pdf docx mipt
```
## Naming conflicts

To avoid conflicts, script appends current date to the end of the files' name. It also helps to navigate between all backups faster.

