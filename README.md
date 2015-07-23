# Raspberry-Cam - Scripts per a la Raspberry Cam

Scripts for the raspberry cam
Tested on Raspberry Pi A+ an PiNoir Camera

<h2>start_mjpg.sh</h2>
Start stream based in pictures with MJPG

<h2>start_youtubelive.sh</h2>
creates stream for a Youtube live event
<h3>Steps</h3>
Use the cross compiled ffmpeg for arm, here is the instruction and the download for the compiled ffmpeg:

<ol>
<li>Install Raspbian and download the crosscompiled ffmpeg to your Computer:
https://drive.google.com/file/d/0B0OC20ApqKZ_YVB3NHF6VU9XTUE/edit?usp=sharing</li>
<li>Transfer the arm.tar to raspberry PI and Untar with
<p><code># tar -xvf arm.tar.gz</code></p>
</li>
<li>move to the new folder
<p><code>cd ./arm/bin</code></p>
</li>
<li>Start the Livestream 720p:
<p><code>raspivid -o - -t 0 -w 1280 -h 720 -fps 25 -b 4000000 -g 50 | ./ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://http://a.rtmp.youtube.com/live2/XXyourIDhereXX</code></p>
</li>
</ol>
Adjust the bitrate with      -b 4000000..whatever you like (1500-4000kbit/s wants youtube for 720p)

Source: https://plus.google.com/+WolfgangSchlatter/posts/2L5fRou17AX
