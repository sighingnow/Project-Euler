#! /bin/sh

# convert end of line to LF style and remove bom with dos2unix.

for f in $(find ./solutions/ -type f -iname "*.md"); do
    echo "formatting" $f "...";
    dos2unix --quiet --keepdate --remove-bom $f &> /dev/null; ## --remove-bom
done;

