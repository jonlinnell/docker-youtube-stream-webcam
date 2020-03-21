#!/bin/sh

ffmpeg \
	-f lavfi -i anullsrc=r=16000:cl=mono \
	-f v4l2 -r 10 -i /dev/video0 \
	-c:v libx264 -pix_fmt yuv420p -preset ultrafast -g 20 -b:v 2500k \
	-c:a aac -ar 44100 -threads 0 -bufsize 512k -strict experimental \
	-f flv rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
