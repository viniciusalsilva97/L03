#INCLUDE 'totvs.ch'

User Function L03E20()
    local cMsg   := " "
    local cTipo  := " "

    cTipo := M->B1_TIPO

    if cTipo == "MP"
        cMsg := "Mat�ria Prima Produ��o"
    elseif cTipo == "PA"
        cMsg := "Produto Para Comercializa��o"
    else
        cMsg := "Outros Produtos"
    endif 

Return cMsg  
