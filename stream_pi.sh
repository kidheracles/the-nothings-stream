#!/usr/bin/env bash
raspivid -t 0 -b 2097152 -w 1280 -h 720 -fps 30 -n -o - | \
	gst-launch-1.0 fdsrc ! \
	video/x-h264,width=1280,height=720,framerate=30/1,profile=high,stream-format=byte-stream  ! \
	h264parse ! \
       	queue !  \
	flvmux streamable=true ! \
	rtmpsink location=rtmp://live-syd.twitch.tv/app/live_608647353_Z7Z54EqhCSbTXWriBBMqkDBymzWUmW
