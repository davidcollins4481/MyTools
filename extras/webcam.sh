ffserver -f /etc/ffserver.conf & ffmpeg -v verbose -r 5 -s 640x480 -b 2048 -f video4linux2 -i /dev/video0 http://localhost/webcam.ffm
