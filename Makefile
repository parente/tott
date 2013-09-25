.PHONY: clean doc watch-doc watch-slides

doc:
	@make -C doc clean html slides

clean:
	@make -C doc clean

watch-doc:
	@wr "make -C doc clean html slides" doc

watch-slides:
	@cd doc/slides; npm run-script watch