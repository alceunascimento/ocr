library(pdftools)
download.file("http://arxiv.org/pdf/1403.2805.pdf", "data/1403.2805.pdf", mode = "wb")
txt <- pdf_text("data/1403.2805.pdf")


download.file("https://portal.tjpr.jus.br/jurisprudencia/publico/visualizacao.do?tjpr.url.crypto=8a6c53f8698c7ff76db3047d195cb6a566563aad3816aa868bde0090a3bf4724e86bd502b53b7810038e83cb1b6acbb958ff64328c096ecdd35cde69e1a996445829e7e7ff5fc01e283c3b6f93a6a20b2252731d6236cc4fddb27f4d9020c764beb1687013d5b59e9d29422538cdf92a52f64540c9a085d52ad6a33773970a6f0c4762655bd0f0fb010ad5de6c97f1c8b6e47af7fe0d81bb523d51485ce10f49714b89d4e08f9f0c557e6294911746e5", "data/acordaotjprteste.pdf", mode = "wb")
acordao <- pdf_text("data/acordaotjprteste.pdf")


files <- list.files(pattern = "pdf$")

opinions <- lapply(files, pdf_text)

length(opinions)

lapply(opinions, length) 


