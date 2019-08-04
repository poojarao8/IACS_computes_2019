SRC = $(wildcard jupyter_notebooks/*/*.ipynb)
TAR = $(SRC:.ipynb=.md)

all: $(TAR)

jupyter_notebooks/%.md: jupyter_notebooks/%.ipynb
	jupyter nbconvert --to markdown $<
	python make_post.py $@

.PHONY: clean

clean:
	rm _notebooks/*.md
