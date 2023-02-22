#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function pedidosFornecedor()
    local aArea           := getArea()
    local cMsg            := ""
    local cPedidoDeCompra := ""
    local cCodiFornecedor := "F00004"
    local cAlias          := GetNextAlias()
    local cQuery          := ""
    local nCont           := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    cQuery := "SELECT C7_NUM FROM " + RetSqlName("SC7") + " SC7 WHERE C7_FORNECE ='" + cCodiFornecedor + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF()) 
        cPedidoDeCompra := &(cAlias) -> (C7_NUM)

        cMsg += "Pedido " + cValToChar(nCont) + ": " + cPedidoDeCompra + CRLF + "------------------------------" + CRLF

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Pedidos do Fornecedor')
            nCont := 1
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Pedidos do Fornecedor')
    endif

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
