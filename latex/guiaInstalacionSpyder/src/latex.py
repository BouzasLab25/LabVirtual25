#!/usr/bin/python

import os, sys

commands = [
    "pdflatex " + sys.argv[1] + ".tex",
    "bibtex " + sys.argv[1] + ".aux",
    "pdflatex " + sys.argv[1] + ".tex",
    "pdflatex " + sys.argv[1] + ".tex",
    "mv " + sys.argv[1] + ".pdf ../pdf"
]

for c in commands:
    os.system(c)
