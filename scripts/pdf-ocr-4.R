
library(pdftools)

download.file("http://arxiv.org/pdf/1403.2805.pdf", "data/1403.2805.pdf", mode = "wb")

txt <- pdftools::pdf_text("C:/Users/DELL/OneDrive/R/greencenter-matricula.pdf")

# all 29 pages  
length(txt) 

#> [1] 29

cat(txt[[1]])



tibble::enframe(txt) %>% 
  dplyr::rename(page = name) %>% 
  ggpage::nest_paragraphs(input = value, width = 100) %>%
  head()

text2 <- strsplit(txt, "\n")
head(text2[[1]])


library(stringr)

# Sample text
text3 <- cleaned_text

# Regular expression pattern to extract text between "Av-" and "Dou"
pattern <- "parcial(.*?)Dou"

# Extract matching blocks of text using regex
matches <- str_extract_all(text3, pattern)[[1]]

# Remove leading and trailing whitespace from the extracted blocks
matches <- trimws(matches)

# Print the resulting blocks of text
print(matches)

cleaned_text <- gsub("\\s+", " ", txt)
