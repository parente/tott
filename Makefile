.PHONY: clean doc watch-doc watch-slides

export AUDIO_ROOT=https://s3.amazonaws.com/tott-meetup/audio
export VIDEO_ROOT=https://s3.amazonaws.com/tott-meetup/video

build:
	@git submodule update --init
	@cd doc/slides; npm install

all: slides doc

clean:
	@make -C doc clean

doc:
	@make -C doc clean html

watch-doc:
	@wr "make -C doc clean html" doc/*.rst doc/sessions/*.rst doc/conf.py

slides:
	@cd doc/slides; npm run-script build

watch-slides:
	@cd doc/slides; npm run-script watch
