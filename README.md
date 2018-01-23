# Renomeando-arquivos-PDF-com-conteudo-interno
No meu atual trabalho me deparei com a necessidade de renomear 1.410 arquivos no formato pdf. Estes arquivos possuiam informações de um tributo que foi pago e um código de inscrição. Este código deveria ser refletido no nome do arquivo pdf, pois o mesmo seria anexado à um registro de um dado sistema de informação, de forma automatica. O programa de anexação do arquivo pdf iria pesquisa-lo no sistema operacional com base no código de inscrição. O meu problema então era:

1-Ler cada arquivo pdf;
2-Pesquisar a linha que continha a palavra "Inscrição";
3-Coletar o código da inscrição que se posicionaca logo após;
4-Renomear o arquivo pdf cujo códido da inscrição foi coletado.


