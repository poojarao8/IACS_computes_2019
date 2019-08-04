#!/usr/bin/python
import sys
import datetime
import re

def make_post(filename):
    now = datetime.datetime.now()

    title = filename.split('/')[-1][:-3].replace('_', ' ').replace('_', ' ')
    title = re.sub(r"(\w)([A-Z])", r"\1 \2", title).capitalize()

    blog_text = f"""---
layout: post
title:  {title}
date:   {now.strftime("%Y-%m-%d")}
day: {filename.split('/')[-2][3:]}
---

"""
    new_filename = filename.split('/')[-2] + '_' + filename.split('/')[-1]

    with open(filename, 'r') as infile:
        blog_text += infile.read()

    with open('_notebooks/'+new_filename, 'w') as outfile:
        outfile.write(blog_text)

if __name__=="__main__":
    make_post(sys.argv[1])
