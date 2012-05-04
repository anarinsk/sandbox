#!/usr/bin/Rscript

# Pull out all Pandoc style citations to create the .aux file used 
# by bibtool to generate .bib, then run bibtool to generate the .bib

require(methods)
require(utils)
require(gsubfn)
infile <- commandArgs(TRUE)

filename <- gsub("(.+)\\.md", "\\1", infile)
# Read in the file given at the command line
txt <- readLines(infile)
out <- unlist(strapply(txt, "@\\w+"))
writeLines(sprintf("\\citation{%s}", out), "citation.aux")
system(sprintf("bibtool -d -x citations.aux /home/cboettig/Documents/Mendeley/bib/*.bib -o %s.bib", filename))
