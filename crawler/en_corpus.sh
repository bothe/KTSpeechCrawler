#!/bin/bash
trap "exit" INT

target_dir=$1
filter_dir=$2

declare -a arr=("marathi")
for i in `seq 1 30`;
do
    echo "PAGE="$i
    for kw in "${arr[@]}"
    do
        youtube-dl --download-archive ./en-downloaded.txt --no-overwrites -f mp4 --restrict-filenames --youtube-skip-dash-manifest --prefer-ffmpeg --socket-timeout 20  -iwc --write-info-json -k --write-srt --sub-format ttml --sub-lang mr --convert-subs vtt  "https://www.youtube.com/results?sp=EgQIBCgB&q="$kw"&p="$i -o "$target_dir%(id)s%(title)s.%(ext)s" --exec "python ./crawler/process.py {} '$filter_dir'"
    done
done
