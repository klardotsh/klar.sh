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
	cp ./headshot-*x.jpg $(OUTPUT_DIR)/
