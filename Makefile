# ivoatex Makefile.  The http://ivoa.net/documents/notes/IVOATex
# for the targets available.

# short name of your document (edit $DOCNAME.tex; would be like RegTAP)
DOCNAME = CAOM

# count up; you probably do not want to bother with versions <1.0
DOCVERSION = 2.5

# Publication date, ISO format; update manually for "releases"
DOCDATE = 2024-08-21

# What is it you're writing: NOTE, WD, PR, REC, PEN, or EN
DOCTYPE = WD

# An e-mail address of the person doing the submission to the document
# repository (can be empty until a make upload is being made)
AUTHOR_EMAIL=pdowler.cadc@gmail.com

# Source files for the TeX document (but the main file must always
# be called $(DOCNAME).tex)
SOURCES = $(DOCNAME).tex role_diagram.pdf

# List of image files to be included in submitted package (anything that
# can be rendered directly by common web browsers)
FIGURES = role_diagram.svg

# List of PDF figures (figures that must be converted to pixel images to
# work in web browsers).
VECTORFIGURES =

# Additional files to distribute (e.g., CSS, schema files, examples...)
AUX_FILES =

-include ivoatex/Makefile

ivoatex/Makefile:
	@echo "*** ivoatex submodule not found.  Initialising submodules."
	@echo
	git submodule update --init

test:
	@echo "No tests defined yet"

vodml:
	xsltproc --huge --output generated.tex ivoatex/vo-dml2ivoatex.xslt src/main/resources/CAOM-current-vodml.xml

