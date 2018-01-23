#Abaixo script para ler arquivos pdf em uma pasta do sistema operacional, 
#pesquisar um dado conteúdo e então renomea-lo com o mesmo.

library(pdfsearch)
library(pdftools)
library(stringr)

#Configura a pasta dos arquivos pdf e armazena a lista na variavel
pasta <- setwd('C:/caminho_da_pasta_dos_pdfs/')
lista_arquivos <- list.files(pasta)

#Para cada arquivo da lista, extrai o texto...
for (arquivo in lista_arquivos){
  pdf_file <- file.path(pasta,arquivo)
  text <- pdf_text(pdf_file)
  
  #procura a palavra 'Inscrição' (esta função retornará um dataframe cujo campo utilizado 
  #será o 'line_text' que contém toda a linha da palavra pesquisada)
  linha_inscricao = keyword_search(text, keyword = 'Inscrição')
  
  #Caso a palavra exista o nrow será maior que zero...
  if (nrow(linha_inscricao)>0){
    #no meu caso sempre retornariam duas linhas, por particularidade do documento
    #então eu coleto a segunda linha
    cod_inscricao = linha_inscricao$line_text[[2]]
    #separo a linhas em dias partes para isolar o código da inscrição
    cod_inscricao = strsplit(cod_inscricao, "-")[[1]][2]
    cod_inscricao = strsplit(cod_inscricao, "Contribuinte")[[1]][1]
    cod_inscricao = str_trim(cod_inscricao)
    #então renomeio o arquivo pdf com o codigo da inscrição
    file.rename(arquivo, paste(cod_inscricao,'.pdf'))
  }
}
