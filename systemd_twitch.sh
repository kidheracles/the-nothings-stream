bootscript=/home/pi/adric-gst/stream_pi.sh
servicename=cchs_twitch

chmod +x $bootscript

cat > /etc/systemd/system/$servicename.service <<EOF
[Unit]
After=network.target
[Service]
Type=simple
ExecStart=$bootscript
User=pi
Group=pi
[Install]
WantedBy=default.target
EOF

chmod 640 /etc/systemd/system/$servicename.service 
systemctl enable $servicename
