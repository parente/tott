.PHONY: build ogg ogv main

build:
	@cd docker; docker build -t parente/tott-media .

ogg:
	@docker run -v "$(CURDIR)":"$(CURDIR)" -a stdout -a stderr -w "$(CURDIR)" parente/tott-media mp3_to_ogg
	
ogv:
	@docker run -v "$(CURDIR)":"$(CURDIR)" -a stdout -a stderr -w "$(CURDIR)" parente/tott-media mov_to_ogv

main:
	@docker run -v "$(CURDIR)":"$(CURDIR)" -a stdout -a stderr -w "$(CURDIR)" parente/tott-media mov_main_profile $(MOV_IN) $(MOV_OUT)
	
# docker run -v "$(CURDIR)":"$(CURDIR)" -a stdout -a stderr -w "$(CURDIR)" parente/tott-media ./convert.py $@
