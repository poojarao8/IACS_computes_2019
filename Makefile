SRC = $(wildcard jupyter_notebooks/*/*.ipynb)
SRC2 = $(wildcard jupyter_notebooks/*/*/*.ipynb)
TAR = $(SRC:.ipynb=.md) $(SRC2:.ipynb=.md)

all: $(TAR)

jupyter_notebooks/%.md: jupyter_notebooks/%.ipynb
	jupyter nbconvert --to markdown $<
	python make_post.py $@

.PHONY: clean

clean:
	rm _notebooks/*.md
