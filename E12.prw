#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E12()
    local aArea  := getArea()
    local cAlias := GetNextAlias()
    local cQuery := ""
    local cMsg   := ""
    local cCod   := ""
    local cVUn   := "" 

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cQuery := "SELECT TOP 1 C6_PRODUTO, C6_PRCVEN FROM " + RetSqlName("SC6") + " SC6 ORDER BY C6_PRCVEN DESC"
    TCQUERY cQuery ALIAS &(cAlias) NEW
    cCod  := &(cAlias) -> (C6_PRODUTO)
    cVUn  := &(cAlias) -> (C6_PRCVEN)

    cMsg += "Código: " + cValToChar(cCod) + CRLF + "Valor Unitário: " + cValToChar(cVUn) + CRLF +"---------------------------------------" + CRLF
    &(cAlias) -> (DbCloseArea())

    cQuery := "SELECT TOP 1 C6_PRODUTO, C6_PRCVEN FROM " + RetSqlName("SC6") + " SC6 ORDER BY C6_PRCVEN ASC"
    TCQUERY cQuery ALIAS &(cAlias) NEW
    cCod  := &(cAlias) -> (C6_PRODUTO)
    cVUn  := &(cAlias) -> (C6_PRCVEN)

    cMsg += "Código: " + cValToChar(cCod) + CRLF + "Valor Unitário: " + cValToChar(cVUn) + CRLF +"---------------------------------------" + CRLF
    &(cAlias) -> (DbCloseArea())
    
    FwAlertInfo(cMsg, 'Maior e Menor Valor')
    
    restArea(aArea)
Return 
