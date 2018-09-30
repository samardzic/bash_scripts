# Youtube_dl Scripts

Scripts for Video & Audio Download with [Youtube_dl](http://rg3.github.io/youtube-dl/) CLI application.

GUI for this CLI tool can be found here: [youtube-dl-gui](https://github.com/MrS0m30n3/youtube-dl-gui)

## Installation

### System Info
- Linux Mint 18.3 Cinnamon x64

### Installation steps

#### Prerequisites:
- ffmpeg 
- libav-tools 
- rtmpdump

```
$ sudo apt-get install ffmpeg libav-tools rtmpdump
$ sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O ~/Applications/youtube-dl^C
$ sudo chmod +x ~/Applications/youtube-dl
```

#### Version check:
```
./youtube-dl --version
2018.09.26
```


#### Notes:

If you decide to install using **apt/apt-get** you will probablly end up with older version.




## Audio download & conversion

### Switches

#### Option list:
```
./youtube-dl --help
```

- **--audio-format mp3** - Selects the audio output type (mp3) 
- **--audio-quality 320k** - Selects the output birtrate 
- **--audio-quality 8** - Another way to define output audio quality
- **-i** - Ignore errors (removed Youtube files)
- **-o** - Output parameters (save location, file name...)
- **"%(title)s.%(ext)s"** - Output file name and extension configuration
- **-o pavel_mix02/"%(title)s.%(ext)s"** - Outputs the converted file to new **pavel_mix02/** directory
- **--playlist-start 1 --playlist-end 3** - Selects the START and END position of the files to be downloaded from playlist
- **--verbose** - More detailed output


### My Examples

#### Playlist range example

```
$ ./youtube-dl --extract-audio --audio-format mp3 -i --audio-quality 320k --playlist-start 1 --playlist-end 3 -o somelist/"%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PL8Qq4oerbOvgsYoVwgw8ig2y6fqRUdmPV
```


#### Default playlist download example
```
$ ./youtube-dl --extract-audio --audio-format mp3 -i --audio-quality 320k -o pavel_mix02/"%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PL8RSs51arMMTfa3R7i3ZJUW7QhYv6yC4i
```


## Video download


### Switches


**-f, --format** - _FORMAT video format code. The special name "best" will pick the best quality._

**-c, --continue** - _force resume of partially downloaded files_

**-i, --ignore-errors** - _continue on download errors, for example to skip unavailable videos in a channel_ 

**-t, --title** - _use title in file name (default)_ 

**-w, --no-overwrites** - _do not overwrite files_

**-v, --verbose** - _print various debugging information_

**-o, --output** - _outputs videos to defined location_



### List available video & audio formats:

$ ./youtube-dl -F https://www.youtube.com/watch?v=2MpUj-Aua48




### Available AV formats


17           3gp        176x144    small , mp4v.20.3, mp4a.40.2@ 24k, 4.36MiB

36           3gp        320x180    small , mp4v.20.3, mp4a.40.2, 9.71MiB

249          webm       audio only DASH audio   52k , opus @ 50k, 5.54MiB

250          webm       audio only DASH audio   70k , opus @ 70k, 7.11MiB

171          webm       audio only DASH audio   99k , vorbis@128k, 9.89MiB

251          webm       audio only DASH audio  126k , opus @160k, 12.84MiB

140          m4a        audio only DASH audio  128k , m4a_dash container, mp4a.40.2@128k, 14.06MiB

141          m4a        audio only DASH audio  255k , audio@256k (44100Hz), 5.99MiB

--------

278          webm       256x144    144p   57k , webm container, vp9, 30fps, video only, 2.14MiB

242          webm       426x240    240p   87k , vp9, 30fps, video only, 2.85MiB

243          webm       640x360    360p  159k , vp9, 30fps, video only, 5.19MiB

244          webm       854x480    480p  283k , vp9, 30fps, video only, 7.94MiB

247          webm       1280x720   720p  538k , vp9, 30fps, video only, 14.59MiB

302          webm       1280x720   720p60  768k , vp9, 60fps, video only, 21.70MiB

248          webm       1920x1080  1080p 1070k , vp9, 30fps, video only, 30.37MiB

303          webm       1920x1080  1080p60 1464k , vp9, 60fps, video only, 45.88MiB

43           webm       640x360    medium , vp8.0, vorbis@128k, 18.89MiB

271          webm       2560x1440  1440p 9048k , vp9, 30fps, video only, 1.18GiB

313          webm       3840x2160  2160p 18011k , vp9, 30fps, video only, 2.76GiB


----------


18           mp4        640x360    medium , avc1.42001E, mp4a.40.2@ 96k, 23.80MiB

22           mp4        1280x720   hd720 , avc1.64001F, mp4a.40.2@192k (best)

160          mp4        256x144    144p   34k , avc1.4d400c, 30fps, video only, 1.20MiB

133          mp4        426x240    240p   53k , avc1.4d4015, 30fps, video only, 1.82MiB

134          mp4        640x360    360p  114k , avc1.4d401e, 30fps, video only, 3.28MiB

135          mp4        854x480    480p  202k , avc1.4d401f, 30fps, video only, 5.41MiB

136          mp4        1280x720   720p  368k , avc1.4d401f, 30fps, video only, 9.21MiB

298          mp4        1280x720   720p60  577k , avc1.4d4020, 60fps, video only, 12.67MiB

137          mp4        1920x1080  1080p  651k , avc1.640028, 30fps, video only, 15.37MiB

299          mp4        1920x1080  1080p60 1064k , avc1.64002a, 60fps, video only, 22.34MiB




### My examples:


- Download playlist, specified folder, specific naming and indexing, with ignore errors (Video + Audio):
```
$ ./youtube-dl -f 137+140 -i -o python_corey/"%(playlist_index)s-%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU
```


- Download playlist (Video only):
```
$ ./youtube-dl -f 137 https://www.youtube.com/playlist?list=PLBZBJbE_rGRXorsjEaXiyAm0OPUPcQJlI
```

- Download playlist to specified "google" folder, with specific naming and indexing (Video only):
```
$ ./youtube-dl -f 137 -o google/"%(playlist_index)s-%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLBZBJbE_rGRXorsjEaXiyAm0OPUPcQJlI
```

- Added ignore errors and verbose (Video only):
```
$ ./youtube-dl -f 137 -iv -o google2/"%(playlist_index)s-%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PLBZBJbE_rGRXorsjEaXiyAm0OPUPcQJlI
```

- Download playlist, specified folder, specific naming and indexing, with ignore errors (Video only):
```
$ ./youtube-dl -f 137 -i -o python_corey/"%(playlist_index)s-%(title)s.%(ext)s" https://www.youtube.com/playlist?list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU
```




### Other examples

Some of the other options to download the best quality videos other than that mentioned here depending on your convenience is given below:

- Download best mp4 format available or any other best if no mp4 available
```
$ youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
```

- Download best format available but not better that 480p
```
$ youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'
```

- Download best video only format but no bigger than 50 MB
```
$ youtube-dl -f 'best[filesize<50M]'
```

- Download best format available via direct link over HTTP/HTTPS protocol
```
$ youtube-dl -f '(bestvideo+bestaudio/best)[protocol^=http]'
```
- For highest quality Video or Audio: 
```
youtube-dl -f bestvideo+251
youtube-dl -f 137+bestaudio --merge-output-format mp4
```

- For highest resulting quality available.
```
youtube-dl -f bestvideo+bestaudio/best
```

If you wanted to prefer MP4 format containers instead of WebM, use:
```
-f bestvideo[ext!=webm]‌​+bestaudio[ext!=webm]‌​/best[ext!=webm].

```

- notice that youtube-dl has labeled the last option 1280x720 as the 'best' quality and that's what it will download by default, but that the line starting with 137 is actually higher quality 1920x1080. Youtube has separated the video and audio streams for the lines labeled DASH so we also need to pick the highest quality audio which in this case is the line starting with 141. Then we run youtube-dl again this time specifying the audio and video:
```
youtube-dl -f 137+141 https://www.youtube.com/watch\?v\=-pxRXP3w-sQ
```
and it will download the 1080p video and auto-merge it with the highest-quality audio. It should also auto-deleted the separate downloaded parts. This method is a little extra work, but will get you the best results.
