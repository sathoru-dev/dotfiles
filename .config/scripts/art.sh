#!/usr/bin/bash
url=$(playerctl metadata mpris:artUrl)
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
metadata=$(printf "$artist - $title")

if [ $url == "No player found" ]
then
  exit
elif [ -f /home/sathoru/.cache/albumart/"$metadata".png ]
then
  echo /home/sathoru/.cache/albumart/"$metadata".png
else
  curl -s $url -o /home/sathoru/.cache/albumart/"$metadata"
  magick /home/sathoru/.cache/albumart/"$metadata" /home/sathoru/.cache/albumart/"$metadata".png
  rm /home/sathoru/.cache/albumart/"$metadata"
  echo /home/sathoru/.cache/albumart/"$metadata".png
fi
