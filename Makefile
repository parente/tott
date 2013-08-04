.PHONY: clean doc push watch-doc

TMP_TOTT_DOC := /tmp/tott_doc

push:
	@-rm -rf $(TMP_TOTT_DOC)
	@make -C doc clean html slides
	@git clone -b gh-pages -- https://github.com/parente/tott $(TMP_TOTT_DOC)
	@cp -r doc/_build/html/* $(TMP_TOTT_DOC)
	@cp -r doc/slides/_build/* $(TMP_TOTT_DOC)/slides
	@cd $(TMP_TOTT_DOC) && \
		git add -A && \
		git commit && \
		git remote add public https://github.com/parente/tott && \
		git push public gh-pages

doc:
	@make -C doc clean html slides

clean:
	@make -C doc clean

watch-doc:
	@wr "make -C doc clean html" doc

watch-slides:
	@cd doc/slides; npm run-script watch