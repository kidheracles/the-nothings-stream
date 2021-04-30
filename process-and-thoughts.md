
## 2021-04-27

Impressed by Pippin Barr's the Nothings Suite, and wanting to actually create something for once, I wanted to see how minimal a tool-assisted speedrun I could create. 

The goals of this project are: 
- Play a new Nothing every 4 minutes and 33 seconds.
- According to the defined control scheme, at a random moment during that time, automatically execute a single command.
- Take a screenshot at the end of the playthrough and upload it to a personal speedrun archive.

Thus Nothing is played and a speedrun is recorded.

I have a Raspberry Pi 4 lying around, for which I just got Ubuntu Hirsute Hippo 21.04, and I might as well hook it up. Ubuntu is by no means a minimalist Linux distribution but could be called 'The default'.
A further project would be to explore the minimal number of steps to play Nothing, ie. purchase a Raspberry Pi OS SD card.

The minimum steps required to get this going:
- Burn the image
- Boot
- Go through first user process
- For my personal use, install ssh-server & vim - I can thus connect from the convenience of my personal machine
- Apt update & full-upgrade
- Install github CLI https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- git clone 


## 2021-04-30
Trying to get screen capture going under Wayland.... not easy. Pipewire -> gstreamer -> Twitch was the plan but may have to fall back to OBS.
