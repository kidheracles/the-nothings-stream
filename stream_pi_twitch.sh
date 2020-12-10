gst-launch-1.0 -v \
	! videomixer name=vmix \
	! videorate \
	! video/x-raw, framerate=20/1 ! videoconvert \
	! queue leaky=downstream \
	! x264enc bitrate=768 speed-preset=faster qp-min=30 tune=zerolatency \
	! flvmux streamable=true \
	! queue leaky=downstream \
	! rtmpsink location=rtmp://live-syd.twitch.tv/app/live_608647353_Z7Z54EqhCSbTXWriBBMqkDBymzWUmW v4l2src \
	! videoscale \
	! video/x-raw, height=720, width=1280 \
	! queue leaky=downstream \
	! videorate \
	! video/x-raw, framerate=20/1 \
	! videoconvert \
	! vmix.

