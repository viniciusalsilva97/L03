#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E03()
    local aArea   := getArea()
    local cAlias  := getNextAlias()
    local cQuery  := ""
    local nCOnt   := 0
    local cCod    := ""
    local cDesc   := ""
    local cQtd    := ""
    local cVlUnit := ""
    local cVlTot  := ""
    local cMsg    := ""


    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cQuery := "SELECT SC6990.C6_PRODUTO, SC6990.C6_DESCRI, SC6990.C6_QTDVEN, SC6990.C6_PRCVEN, SC6990.C6_VALOR FROM SC6990 WHERE SC6990.C6_NUM = 'PV0008'"

    TCQUERY cQuery ALIAS &(cAlias) NEW 

    while &(cAlias) -> (!EOF())
        cDesc := &(cAlias) -> (C6_DESCRI)
        cCod := &(cAlias) -> (C6_PRODUTO)
        cQtd := &(cAlias) -> (C6_QTDVEN)
        cVlUnit := &(cAlias) -> (C6_PRCVEN)
        cVlTot := &(cAlias) -> (C6_VALOR)
        
        cMsg += "Código: " + cValToChar(cCod) + CRLF + "Descrição: " + cValToChar(cDesc) + CRLF + "Quantidade: " + cValToChar(cQtd) + CRLF + "Valor Unitário: " + cValToChar(cVlUnit) + CRLF + "Valor Total: " + cValToChar(cVlTot) + CRLF + "-------------------------------------------------" + CRLF 

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Produtos')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Produtos')
    endif

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
