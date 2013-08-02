.PHONY: clean doc push watch-doc

doc:
	@make -C doc clean html

clean:
	@make -C doc clean

watch-doc:
	@wr "make -C doc clean html" doc