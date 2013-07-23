.PHONY: clean doc push watch-doc

clean:
	@make -C doc clean

doc:
	@make -C doc clean html

push:
	@rsync -avz \
			--exclude-from 'etc/exclude-list.txt' \
			doc/_build/html/* login.cs.unc.edu:public_html/tott

watch-doc:
	@wr "make -C doc clean html" doc