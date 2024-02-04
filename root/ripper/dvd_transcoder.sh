#!/bin/bash

printf "%s : DVD detected: Transcoding\n" "$(date "+%d.%m.%Y %T")"
debug_log "Transcoding DVD." 
for path in "$1"/*.mkv; do
   ffmpeg -hide_banner -loglevel error -stats -i "$path" -c:v libx264 -crf 18 -preset veryfast -tune film -c:a aac -y "${path%.*}.mp4"
done