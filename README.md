#
#Conversion TXT message to WAV file for Beacon radio
#
#2022 airphel
#
# msg-wav.sh

Script made from that of rany.

Information message generator for HBLink server, FreeDMR, ... This program automatically generates a sound file in Wav format from a text entry in msg-wav.sh file.

The program uses speech synthesis from Microsoft Edge's online text-to-speech service.
Necessary installation prerequisites:

pip install edge-tts

apt-get install ffmpeg

apt-get install mpg321

If you only want to use the `edge-tts` and `edge-playback` commands, it would be better to use pipx:

pipx install edge-tts

### edge-tts

`edge-tts` is a Python module that allows you to use Microsoft Edge's online text-to-speech service from within your Python code or using the provided `edge-tts` or `edge-playback` command.

### Basic usage

If you want to use the `edge-tts` command, you can simply run it with the following command: `edge-tts --text "Hello, world!" --write-media hello.mp3`

If you wish to play it back immediately with subtitles, you could use the `edge-playback` command: `edge-playback --text "Hello, world!`

Note the above requires the installation of the `mpv` command line player.

All `edge-tts` commands work in `edge-playback` as well.

### Changing the voice

If you want to change the language of the speech or more generally, the voice. 

You must first check the available voices with the `--list-voices` option:

`edge-tts --list-voices`

https://learn.microsoft.com/en-us/azure/cognitive-services/speech-service/language-support?tabs=stt-tts#custom-neural-voice

Example:

`edge-tts --voice fr-CA-SylvieNeural --text "serveur TG 208" --write-media server_TG_208_in_French.mp3`

### Changing pitch, rate, volume, etc.

It is possible to make minor changes to the generated speech.

`edge-tts --pitch=-10Hz --text "Hello, world!" --write-media hello_with_pitch_down.mp3`

`edge-tts --rate=0.5 --text "Hello, world!" --write-media hello_with_pitch_down.mp3`

`edge-tts --volume=50 --text "Hello, world!" --write-media hello_with_pitch_down.mp3`

Keep in mind that the `--pitch`, `--rate`, `--volume`, etc. options are applied to the entire SSML document.

In addition, it is required to use `--pitch=-10Hz` instead of `--pitch -10Hz` otherwise the `-10Hz` would be interpreted as just another argument.

### Note on the `edge-playback` command

`edge-playback` is just a wrapper around `edge-tts` that plays back the generated speech. It takes the same arguments as the `edge-tts` option.

### File creation:

1 - In the msg-wav.sh file, choose the conversion language and define the content to convert.

3 - The text will then automatically transform into voice and Wav format. Note: Punctuation can change the intonation of the voice.

4 - The program produces the sound file, with the correct Wav 8k format.


### How the Python script works:

The msg-wav.py script created file into its mp3 `output.mp3` with the edge-tts and mpg321 modules then into wav with the ffmpeg module.
The output file will be called `message.wav`

The command to use is:
`Python3 msg-wav.py`

If you turn it into an executable the ./ command will replace python3.

(chmod +x msg-wav.py)




