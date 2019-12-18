#!/bin/bash
LOGFILE=/var/log/cdrip.log
echo "$(date)" >> $LOGFILE
(
  flock -x -w 3 200 || exit 1

  cdinfo=$(setcd -i /dev/cdrom)
  if [[ $cdinfo == *"Disc found"* ]]; then
     #killall ripit
     python /usr/local/sbin/ledblink.py &
   else
     exit $?
  fi

  ripit --nointeraction --outputdir /ripit 15 >> $LOGFILE

  rc=$?
  if [[ $rc != 0 ]] ; then
   killall ripit
   rm -rf /ripit/*
   python /usr/local/sbin/ledblinkstop.py
   eject /dev/cdrom
   exit $rc
  fi
  if [ $rc -eq 0 ]; then
   killall ripit
   /usr/local/sbin/renamer.sh
   /usr/local/sbin/filerenamer.sh
   mv /ripit/* /media/usb0/
   rm -rf /ripit/*
   #rm /var/lock/.audio-cd-rip.lock
   python /usr/local/sbin/ledblinkstop.py
   #flock --unlock 200 # we're done with the lock, we can release it
   eject /dev/cdrom
   exit $rc
  fi

) 200>/var/lock/.audio-cd-rip.lock
