.PHONY: clean doc watch-doc watch-slides

build:
	@git submodule update --init
	@cd doc/slides; npm install

clean:
	@make -C doc clean

doc:
	@make -C doc clean html

watch-doc:
	@wr "make -C doc clean html" doc

slides:
	@cd doc/slides; npm run-script build

watch-slides:
	@cd doc/slides; npm run-script watch