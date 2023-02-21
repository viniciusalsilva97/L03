#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E08()
    local aArea  := getArea()
    local cAlias := GetNextAlias()
    local cQuery := ""
    local cMsg   := ""
    local cCod   := ""
    local cDes   := ""
    local cVUn   := ""
    local cVTot  := ""      

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cQuery := "SELECT TOP 1 C6_PRODUTO, C6_VALOR, C6_PRCVEN, C6_DESCRI  FROM " + RetSqlName("SC6") + " SC6 ORDER BY C6_VALOR DESC"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
    
        cCod  := &(cAlias) -> (C6_PRODUTO)
        cDes  := &(cAlias) -> (C6_DESCRI)
        cVUn  := &(cAlias) -> (C6_PRCVEN)
        cVTot := &(cAlias) -> (C6_VALOR)

        cMsg += "Código: " + cValToChar(cCod) + CRLF + "Descrição: " + cValToChar(cDes) + CRLF + "Valor Unitário: " + cValToChar(cVUn) + "Valor Total: " + cValToChar(cVTot) + CRLF +"-----------------------------------------------------------------" + CRLF

        &(cAlias) -> (DbSkip())
    end

    FwAlertInfo(cMsg, 'Produto de Maior Valor')
    
    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
