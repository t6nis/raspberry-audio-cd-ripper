README - 

/usr/local/sbin/ < most sh files go here
/etc/udev/rules.d/ < 99-cd-audio-processing.rules goes here

chmod +x for files and install all needed dependencies


https://somewideopenspace.wordpress.com/yet-another-headless-cd-ripper-and-mpd-on-raspberry-pi-installation-guide-yahcdramorpig/start-ripping-when-cd-is-inserted/

https://howchoo.com/g/mwnlytk3zmm/how-to-add-a-power-button-to-your-raspberry-pi

https://howchoo.com/g/ytzjyzy4m2e/build-a-simple-raspberry-pi-led-power-status-indicator


audio-cd-rip.sh makes all the magic happening when CD inserted.
filerenamer.sh - renames all specialcharacters files öäüõ to oauo
renamer.sh - renames all folder with special characters öäüõ to oauo
ledblink.py - lights up a led
ledblikstop.py - lights down a led

