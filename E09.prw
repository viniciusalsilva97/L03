#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E09()
    local aArea           := getArea()
    local cAlias          := GetNextAlias()
    local cCar            := ""
    local cMsg            := ""
    local cCod            := ""
    local cPed            := ""
    local cQuery          := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cCar := Upper(FwInputBox("Digite um código e informaremos os seus pedidos de vendas", cCar))

    cQuery := "SELECT C6_PRODUTO, C6_NUM FROM " + RetSqlName("SC6") + " SC6 WHERE C6_PRODUTO ='" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cCod := &(cAlias) -> (C6_PRODUTO)
        cPed := &(cAlias) -> (C6_NUM)

        cMsg += "Código: " + cValToChar(cCod) + CRLF + "Pedido de Venda: " + cValToChar(cPed) + CRLF + "--------------------------------------------" + CRLF

        &(cAlias) -> (DbSkip())
    end
    
    FwAlertInfo(cMsg, 'Pedido de Venda do Código Selecionado')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
