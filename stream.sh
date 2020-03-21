#!/bin/sh

set -ex

v4l2-ctl --device=$DEVICE --set-fmt-video=width=1920,height=1080,pixelformat=1

ffmpeg \
  -hide_banner \
  -f lavfi -i anullsrc=r=16000:cl=mono \
  -s 1920x1080 -f v4l2 -vcodec h264 \
  -i $DEVICE -c:v copy \
  -c:a aac -ar 44100 \
  -threads 0 -f flv \
  rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
