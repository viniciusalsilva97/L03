#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E09()
    local aArea           := getArea()
    local cAlias          := GetNextAlias()
    local cCar            := ""
    local cMsg            := ""
    local cPed            := ""
    local cQuery          := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cCar := Upper(FwInputBox("Digite um código e informaremos os seus pedidos de vendas", cCar))

    cQuery := "SELECT C6_PRODUTO, C6_NUM FROM " + RetSqlName("SC6") + " SC6 WHERE C6_PRODUTO ='" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cPed := &(cAlias) -> (C6_NUM)

        cMsg += cValToChar(cPed) + ", " 

        &(cAlias) -> (DbSkip())
    end
    
    FwAlertInfo(stuff(cMsg, len(cMsg) -1, 2, "."), 'Pedido de Venda do Código Selecionado')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
