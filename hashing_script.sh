#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
list_of_files=$(find $1 -type f)

if [ -z $2 ]; then
    outfile="MANIFEST.MF"
else
    outfile=$2
fi

echo 'Manifest-Version: 1.0' > $outfile
echo 'Created-By: 1.0 (Android SignApk)' >> $outfile
echo >> $outfile

for file in $list_of_files; do
    echo "Name: $file" >> $outfile
    echo -n "SHA1-Digest: " >> $outfile
    sha1sum $file | sed 's/\([a-f0-9]*\).*/\1/' | xxd -r -p | base64 >> $outfile
    echo >> $outfile
done

