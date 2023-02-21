#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E21()
    local aArea  := getArea()
    local cAlias := getNextAlias()
    local cTipo  := " "
    local cCod := " "
    local cQuery := " "

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA1' MODULO 'COM'
    cQuery := "SELECT B1_COD, B1_TIPO, B1_ZZGRP FROM " + retSqlName("SB1") + " SB1 "
    TCQUERY cQuery ALIAS &(cAlias) NEW 

    DBSELECTAREA( "SB1" )
    (DBSETORDER(2))
    (DBGOTOP())

    while &(cAlias) -> (!EOF())
        cTipo  := &(cAlias) -> (B1_TIPO)
        cCod := &(cAlias) -> (B1_COD)

        if (DbSeek(xFilial("SB1") + cTipo + cCod))

            RecLock("SB1", .F.)

            if cTipo == "MP"
                SB1 -> B1_ZZGRP := "Materia Prima Produção"  
            elseif cTipo == "PA"
                SB1 -> B1_ZZGRP := "Produto Para Comercialização"    
            else
                SB1 -> B1_ZZGRP := "Outros Produtos"    
            endif

             MsUnLock() 
        endif
        &(cAlias) -> (DbSkip())
    end

    &(cAlias) -> (DbCloseArea())
    restArea(aArea) 

Return   
