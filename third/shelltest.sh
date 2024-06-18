#!/usr/bin/bash
files=$(ls | xargs)
List=($files)
for item in ${List[@]}; do grep -s -n ds $item /dev/null; done


