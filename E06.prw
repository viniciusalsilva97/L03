#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E06()
    local aArea           := getArea()
    local cAlias          := GetNextAlias()
    local cCar            := ""
    local cMsg            := ""
    local cCod            := ""
    local cDes            := ""
    local cPrv            := ""
    local cQuery          := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    cCar := Upper(FwInputBox("Digite um código e informaremos se ele existe", cCar))

    cQuery := "SELECT SB1990.B1_COD, SB1990.B1_DESC, SB1990.B1_PRV1 FROM SB1990 WHERE SB1990.B1_COD ='" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cCod := &(cAlias) -> (B1_COD)
        cDes := &(cAlias) -> (B1_DESC)
        cPrv := &(cAlias) -> (B1_PRV1)

        cMsg += "Código: " + cValToChar(cCod) + CRLF + "Descrição: " + cValToChar(cDes) + CRLF + "Preço de Venda: " + cValToChar(cPrv) + CRLF + "--------------------------------------------" + CRLF

        &(cAlias) -> (DbSkip())
    end

    if cMsg == ""
        cMsg := "Esse código não foi cadastrado!"
    endif  
    
    FwAlertInfo(cMsg, 'Confere Código')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
