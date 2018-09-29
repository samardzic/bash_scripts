# Youtube_dl Scripts

Scripts for Video & Audio Download with [Youtube_dl](http://rg3.github.io/youtube-dl/) CLI application.

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
