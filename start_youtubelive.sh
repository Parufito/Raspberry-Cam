cd ./arm/bin
raspivid -o - -t 0 -w 426 -h 240 -fps 15 -b 300000 -g 50 -vf -hf | ./ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/<PERSONAL YOUTUBE KEY FOR LIVE EVENT>
