#INCLUDE 'totvs.ch'
#INCLUDE 'tbiconn.ch'
#INCLUDE 'topconn.ch'

User Function L03E04()
    local aArea  := getArea()
    local cAlias := getNextAlias()
    local cQuery := " "
    local cDesc  := ""
    local nCOnt := 0
    local cMsg := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "SELECT B1_DESC FROM " + retSqlName("SB1") + " SB1 WHERE B1_GRUPO = 'G002'"  

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cDesc := &(cAlias) -> (B1_DESC)

        cMsg += "Descrição: " + cDesc + CRLF + "------------------------------------------------------------------" + CRLF

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Produtos do Grupo Películas')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Produtos do Grupo Películas')
    endif

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
