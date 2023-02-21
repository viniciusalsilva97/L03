#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E10()
    local aArea           := getArea()
    local cAlias          := GetNextAlias()
    local nMedia          := 0
    local nSomaQtd        := 0
    local nSomaPv         := 0
    local nCod            := 0
    local cCar            := ""
    local cMsg            := ""
    local cQuery          := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cCar := Upper(FwInputBox("Digite um código e informaremos a media dos pedidos de venda", cCar))

    cQuery := "SELECT C6_PRODUTO, C6_NUM, C6_QTDVEN FROM " + RetSqlName("SC6") + " SC6 WHERE C6_PRODUTO = '" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())

        nSomaQtd += &(cAlias) -> (C6_QTDVEN)
        
        nSomaPv++
        nCod++

        &(cAlias) -> (DbSkip())
    end

    nMedia := nSomaQtd / nSomaPv 
   
   if nCod == 0
        cMsg := "Esse código não está cadastrado"
    elseif nSomaQtd == 0
        cMsg := "Esse produto não foi vendido"
    else
        cMsg += cValToChar(nSomaPv) + " / " + cValToChar(nSomaQtd) + " =  " + cValToChar(Round(nMedia, 2))
   endif 
   
    FwAlertInfo(cMsg, 'Média dos Pedidos de Venda para esse Produto')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
