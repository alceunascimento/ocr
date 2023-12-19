fls <- list.files(here::here("C:/Users/DELL/OneDrive/R/2649551.pdf"), full.names = T)
# load

arquivo <- C:/Users/DELL/OneDrive/R


# activate packages
library(pdftools)
library(tesseract)
library(tidyverse)
library(here)
library(hunspell)
# set tesseract engine
eng <- tesseract("eng")
# activate klippy for copy-to-clipboard button
klippy::klippy()


ocrs <- sapply("C:/Users/DELL/OneDrive/R/2649551.pdf", function(x){
  # store name
  nm <- stringr::str_replace_all(x, ".*/(.*?).pdf", "\\1")
  # perform ocr
  x <- tesseract::ocr(x, engine = eng) %>%
    paste0(collapse = " ")
})

# create token list
tokens_ocr <- sapply(ocrs, function(x){
  x <- hunspell::hunspell_parse(x)
})

# clean
clean_ocrtext <- sapply(tokens_ocr, function(x){
  correct <- hunspell::hunspell_check(x)
  x <- ifelse(correct == F, 
              x[hunspell::hunspell_check(x)],
              x)
  x <- paste0(x, collapse = " ")
})

head(tokens_ocr)

head(ocrs)


