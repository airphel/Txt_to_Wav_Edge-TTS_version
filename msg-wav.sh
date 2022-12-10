#!/bin/sh
#
#Conversion TXT message to WAV file for Beacon radio
#2022 airphel
#


#Delete old file
rm message.wav
#Work in progress...
#edge-tts
edge-tts --voice fr-CA-SylvieNeural --text "serveur TG 208" --write-media output.mp3
#Convert mp3 file in Wav file
sleep 3
mpg321 -w $fichiertemp output.mp3
#File format transformation
sleep 3
ffmpeg -i output.mp3 -b:a 8000 message.wav
rm output.mp3

exit 0
