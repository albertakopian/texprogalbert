#!/bin/bash
catalogname=$1
tarname=$2
shift
shift
mkdir "$catalogname"
while [ -n "$1" ]
do
find $HOME -iname "*$1" -print0 |
while read -d $'\0' file
do
cp "$file" "$catalogname"
done
shift
done
tar cf "$tarname.tar" "$catalogname"
rm -rf "$catalogname"
echo "done"
