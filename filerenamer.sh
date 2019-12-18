#!/bin/bash

for d in /ripit/*/*
do
#        mv "$d" "${d//[ ()@$üõäö]/}"
        rename 's/ü/u/g;s/ö/o/g;s/ä/a/g;s/õ/o/g' /ripit/*/*
done
