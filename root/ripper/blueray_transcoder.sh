#!/bin/bash

for path in "$1"/*.mkv; do
   ffmpeg -hide_banner -loglevel error -stats -i "$path" -c:v libx264 -crf 23 -preset veryfast -tune film -c:a aac -y "${path%.*}.mp4"
done