.POSIX:

INPUT_DIR ?= src
OUTPUT_DIR ?= .build
RESET_STYLESHEET ?= ress.min.css
SITE_TITLE ?= "klardotsh's vat of bytes"
BASE_URL ?= //klar.sh

all: $(OUTPUT_DIR)

.PHONY: $(OUTPUT_DIR)
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)
	./ssg6 $(INPUT_DIR) $(OUTPUT_DIR) $(SITE_TITLE) $(BASE_URL)
	cp -v $(INPUT_DIR)/*.png $(OUTPUT_DIR)/

# A hackish helper script to dither images and then shrink every last bit out
# of them, using https://entropymine.com/imageworsener/ (req. libpng) and
# https://optipng.sourceforge.net/
#
# File names should be provided as env vars or as make args:
#
# make worsen-image WORSEN_INPUT=~/Downloads/input.png src/output.png
#
# I should eventually make @2x and @3x images as well for HiDPI screens, I
# guess. TODO.
#
# 1280 as a standardized width is somewhat arbitrary, it's just the width of a
# 720p image which seems fine for getting any points I'll be making on this
# site across
WORSEN_WIDTH ?= 1280
.PHONY: worsen-image
worsen-image:
	imagew \
		-w $(WORSEN_WIDTH) \
		-cc 6 \
		-dither f \
		-grayscale \
		$(WORSEN_INPUT) \
		$(WORSEN_OUTPUT)
	optipng -o7 $(WORSEN_OUTPUT)
