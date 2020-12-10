#!/bin/bash

source ~/.config/twitch.key

QUEUE="queue leaky=downstream"
CAPS="videorate ! video/x-raw, framerate=20/1 ! videoconvert"
MIXER="videomixer name=vmix"
ENCODER=(
  x264enc
  bitrate=768
  speed-preset=faster # CPU/quality tradeoff
  qp-min=30 # quality/VBV-underflow tradeoff
  tune=zerolatency # rtmpsink crashes due to SIGPIPE if there is latency
)
MUXER="flvmux streamable=true"
SINK="rtmpsink location=rtmp://live-syd.twitch.tv/app/$KEY"

APPEND=""

function verbose {
  export GST_DEBUG="$@"
}

function debug {
  SINK="filesink location=debug.flv"
}

function add_src {
  APPEND="$@ ! $QUEUE ! $CAPS ! vmix. $APPEND"
}

function desktop {
  add_src ximagesrc $@
}

function webcam {
  add_src v4l2src $@
}

source <(cat)

PIPELINE="$MIXER ! $CAPS ! $QUEUE ! ${ENCODER[@]} ! $MUXER ! $QUEUE ! $SINK $APPEND"

echo 
echo $PIPELINE
echo
exec gst-launch-1.0 -v $PIPELINE
