SRC = $(wildcard jupyter_notebooks/*/*.ipynb)
SRC2 = $(wildcard jupyter_notebooks/*/*/*.ipynb)
TAR = $(SRC:.ipynb=.md) $(SRC2:.ipynb=.md) 
IMAGELIST = $(wildcard jupyter_notebooks/*/*.jpeg) $(wildcard jupyter_notebooks/*/*/*.jpeg) $(wildcard jupyter_notebooks/*/*/*.jpg) $(wildcard jupyter_notebooks/*/*/*.png) $(wildcard jupyter_notebooks/*/*/*.svg)	

all: $(TAR) images
	git add _notebooks/*.md

jupyter_notebooks/%.md: jupyter_notebooks/%.ipynb
	jupyter nbconvert --to markdown $<
	python make_post.py $@

.PHONY: clean

clean:
	rm -f _notebooks/*.md
	rm -f _notebooks/*.jpeg
	rm -f _notebooks/*.jpg
	rm -f _notebooks/*.svg
	rm -f _notebooks/*.png
   
images:
	echo $(IMAGELIST)
	for i in $(IMAGELIST) ; do \
		cp $$i _notebooks ; \
	done
	git add _notebooks/*.svg _notebooks/*.jpeg _notebooks/*.png _notebooks/*.jpg
