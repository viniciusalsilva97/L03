#INCLUDE 'totvs.ch'

User Function L03E20()
    local cMsg   := " "
    local cTipo  := " "

    cTipo := M->B1_TIPO

    if cTipo == "MP"
        cMsg := "Matéria Prima Produção"
    elseif cTipo == "PA"
        cMsg := "Produto Para Comercialização"
    else
        cMsg := "Outros Produtos"
    endif 

Return cMsg  
