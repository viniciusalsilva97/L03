#INCLUDE 'totvs.ch'
#INCLUDE 'tbiconn.ch'
#INCLUDE 'topconn.ch'

User Function L03E05()
    local aArea  := getArea()
    local cAlias := getNextAlias()
    local nCont  := 0
    local cMsg   := ""
    local cQuery := ""
    local cCod   := ""
    local cDesc  := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "SELECT B1_COD, B1_DESC FROM "  + retSqlName("SB1") + " SB1 ORDER BY B1_DESC DESC "

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    while &(cAlias) -> (!EOF())
        cCod  := &(cAlias) -> (B1_COD)
        cDesc := &(cAlias) -> (B1_DESC)

        cMsg += "Código: " + cValToChar(cCod) + CRLF + "Descrição: " + cValToChar(cDesc) + CRLF + "-----------------------------------------------------------------------------------" + CRLF

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Informações sobre a Nota Fiscal')
            nCont := 1
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Pedidos do Fornecedor')
    endif

    &(cAlias) -> (DbCloseArea())
    restArea(aARea)
Return 
