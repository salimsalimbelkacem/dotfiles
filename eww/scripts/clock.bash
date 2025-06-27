#!/bin/bash
date +"%H:%M"
sleep $((60 - $(date +%S)))

while true; do
  date +"%H:%M"
  sleep 60
done
