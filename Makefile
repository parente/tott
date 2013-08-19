.PHONY: clean doc push watch-doc

TMP_TOTT_DOC := /tmp/unctott.bitbucket.org
YEAR := 2014

push:
	@-rm -rf $(TMP_TOTT_DOC)
	@make -C doc clean html slides
	@git clone git@bitbucket.org:unctott/unctott.bitbucket.org.git $(TMP_TOTT_DOC)
	@-rm -r $(TMP_TOTT_DOC)/$(YEAR)
	@cp -r doc/_build/html $(TMP_TOTT_DOC)/$(YEAR)
#@cp -r doc/slides/_build $(TMP_TOTT_DOC)/$(YEAR)/slides
	@cd $(TMP_TOTT_DOC) && \
		git add -A && \
		git commit && \
		git push origin master

doc:
	@make -C doc clean html slides

clean:
	@make -C doc clean

watch-doc:
	@wr "make -C doc clean html slides" doc

watch-slides:
	@cd doc/slides; npm run-script watch