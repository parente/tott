.PHONY: clean doc push watch-doc

doc:
	@make -C doc clean html

clean:
	@make -C doc clean

push:
	@rsync -avz \
			--exclude-from 'etc/exclude-list.txt' \
			doc/_build/html/* login.cs.unc.edu:public_html/tott

watch-doc:
	@wr "make -C doc clean html" doc