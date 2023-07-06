.PHONY: src prepare

CC = xelatex
SRC_DIR = src
RESUME_DIR = $(SRC_DIR)/resume
CV_DIR = $(SRC_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*_detailed.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*_detailed.tex')
OUTPUT_DIR = pdfs

all: clean prepare $(foreach x, coverletter cv resume, $x.pdf) finalize

prepare:
	./prepare.sh $(foreach x, coverletter cv resume, $(SRC_DIR)/$x.tex)

resume.pdf: $(SRC_DIR)/resume_detailed.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

cv.pdf: $(SRC_DIR)/cv_detailed.tex $(CV_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

coverletter.pdf: $(SRC_DIR)/coverletter_detailed.tex
	$(CC) -output-directory=$(SRC_DIR) $<

finalize:
	./finalize.sh $(SRC_DIR) $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(SRC_DIR)/*_detailed.tex
