# Sample text
text <- "[Av-34]/49.534 (Protocolo nº 204.538 de [06/03/2017])
[Liberação parcial]: Nos termos da autorização do credor no contrato por instrumento
particular datado de 31 de janeiro de 2017, do qual uma via fica arquivada, averba-se que foi
liberado das hipotecas do R-2 e R-3 o apartamento [611-B] do Condomínio Green Center. Dita
unidade foi alienada a Vinicius Roberto Nascimento Vargas, conforme R-1 da matrícula
56.622 deste serviço. Dou fé. Curitiba, 16 de março de 2017. Custas: 80 VRC = R$ 14,56.

[Av-35]/49.535 (Protocolo nº 204.539 de [07/03/2017])
[Liberação parcial]: Nos termos da autorização do credor no contrato por instrumento
particular datado de 1 de fevereiro de 2017, do qual uma via fica arquivada, averba-se que foi
liberado das hipotecas do R-4 e R-5 o apartamento [712-A] do Condomínio Blue Center. Dita
unidade foi alienada a Ana Maria Silva, conforme R-2 da matrícula
56.623 deste serviço. Dou fé. Curitiba, 17 de março de 2017. Custas: 80 VRC = R$ 14,56."

# Regular expression pattern to extract desired data
pattern <- "\\[Av-([0-9]+)\\]/[0-9]+ \\(Protocolo nº [0-9]+ de \\[([0-9]{2}/[0-9]{2}/[0-9]{4})\\]\\)\\s*\\[([^\\]]+)\\]"

# Extract matching data using regex
matches <- str_match_all(text, pattern)[[1]][-1, ]

# Create a data frame from the extracted data
data <- data.frame(
  AV = matches[, 2],
  Date = matches[, 3],
  Apartamento = matches[, 4],
  stringsAsFactors = FALSE
)

# Print the resulting data frame
print(data)
