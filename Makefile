SRC = $(wildcard jupyter_notebooks/*/*.ipynb)
SRC2 = $(wildcard jupyter_notebooks/*/*/*.ipynb)
TAR = $(SRC:.ipynb=.md) $(SRC2:.ipynb=.md) 
IMAGELIST = $(wildcard jupyter_notebooks/*/*.jpeg) $(wildcard jupyter_notebooks/*/*/*.jpeg) $(wildcard jupyter_notebooks/*/*/*/*.jpeg) $(wildcard jupyter_notebooks/*/*/*.jpg) $(wildcard jupyter_notebooks/*/*/*/*.jpg) $(wildcard jupyter_notebooks/*/*.png) $(wildcard jupyter_notebooks/*/*/*.png) $(wildcard jupyter_notebooks/*/*/*/*.png) $(wildcard jupyter_notebooks/*/*.svg) $(wildcard jupyter_notebooks/*/*/*.svg) $(wildcard jupyter_notebooks/*/*/*/*.svg)

all: $(TAR) images
	git add _notebooks/*.md

jupyter_notebooks/%.md: jupyter_notebooks/%.ipynb
	jupyter nbconvert --to markdown $< 
	sed -i -E 's~img src="(.*?)"~img src="{{ site.baseurl }}/images/\1"~g' $@
	sed -i -E 's/(!\[.*?\]\()(.*\/|)(.*?)\)/<img src="{{ site.baseurl }}\/images\/\3" \/>/g' $@
	python make_post.py $@

.PHONY: clean

clean:
	rm -f _notebooks/*.md
	rm -f images/*.jpeg
	rm -f images/*.jpg
	rm -f images/*.svg
	rm -f images/*.png
   
images:
	echo $(IMAGELIST)
	for i in $(IMAGELIST) ; do \
		cp $$i images ; \
	done
	git add images/*.svg images/*.jpeg images/*.png images/*.jpg
