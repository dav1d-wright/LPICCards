lsmod
Module                  Size  Used by
input_polldev          	16384  	1 applesmc
snd_hda_codec_hdmi     	53248  	1
snd_hda_codec_cirrus    20480  	1
snd_hda_codec_generic   77824  	1 snd_hda_codec_cirrus
snd_hda_intel          	40960  	10
snd_hda_codec         	135168 	4 snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec_cirrus
wl                   	6365184 0
snd_hda_core           	73728  	5 snd_hda_codec_hdmi,snd_hda_codec_generic,snd_hda_codec,snd_hda_intel,snd_hda_codec_cirrus
snd_hwdep              	16384  	1 snd_hda_codec
snd_pcm               	106496  4 snd_hda_codec_hdmi,snd_hda_codec,snd_hda_intel,snd_hda_core

