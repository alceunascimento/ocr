# set options
options(stringsAsFactors = F)          # no automatic data transformation
options("scipen" = 100, "digits" = 12) # suppress math annotation
# install packages
install.packages("pdftools")
install.packages("tesseract")
install.packages("tidyverse")
install.packages("here")
install.packages("hunspell")
install.packages("flextable")
# install klippy for copy-to-clipboard button in code chunks
install.packages("remotes")
remotes::install_github("rlesur/klippy")

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


txt_output <- pdftools::pdf_text("C:/Users/DELL/OneDrive/R/greencenter-matricula.pdf") %>%
  paste0(collapse = " ") %>%
  paste0(collapse = " ") %>%
  stringr::str_squish()

# add names to txt files
names(txts) <- paste0(here::here("data","C:/Users/DELL/OneDrive/R/greencenter-matricula.pdf"), 1:length(txts), sep = "")
# save result to disc
lapply(seq_along(txts), function(i)writeLines(text = unlist(txts[i]),
                                              con = paste(names(txts)[i],".txt", sep = "")))


fls <- list.files(here::here("C:/Users/DELL/OneDrive/R/greencenter-matricula.pdf"), full.names = T)
# load

ocrs <- sapply(txt_output, function(x){
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




