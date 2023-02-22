#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E10()
    local aArea  := getArea()
    local cAlias := GetNextAlias()
    local nMedia := ""
    local cCar   := ""
    local cMsg   := ""
    local cQuery := ""  

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cCar := Upper(FwInputBox("Digite um código e informaremos a media dos pedidos de venda", cCar))

    cQuery := "SELECT AVG(C6_QTDVEN) AS MEDIA FROM " + RetSqlName("SC6") + " SC6 WHERE C6_PRODUTO = '" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    nMedia := &(cALias) -> (MEDIA)

    if nMedia == 0
        cMsg := "Esse produto não foi cadastrado"
    else
        cMsg := cValToChar(Round(nMedia, 2))
    endif
   
    FwAlertInfo(cMsg, 'Média dos Pedidos de Venda')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
