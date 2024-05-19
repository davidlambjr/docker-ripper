#!/bin/bash

printf "%s : DVD detected: Transcoding\n" "$(date "+%d.%m.%Y %T")"
for path in "$1"/*.mkv; do
   #ffmpeg -hide_banner -loglevel error -stats -i "$path" -c:v libx264 -crf 18 -preset veryfast -tune film -c:a aac -y "${path%.*}.mp4"
   ffmpeg -hide_banner -loglevel error -i "$path" -c:v libx264 -c:a aac -crf 17 -ac 2 -y "${path%.*}.mp4"
done