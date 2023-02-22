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

    cCar := Upper(FwInputBox("Digite um c�digo e informaremos se ele existe", cCar))

    cQuery := "SELECT B1_COD, B1_DESC, B1_PRV1 FROM " + retSqlName("SB1") + " SB1 WHERE B1_COD ='" + cCar + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cCod := &(cAlias) -> (B1_COD)
        cDes := &(cAlias) -> (B1_DESC)
        cPrv := &(cAlias) -> (B1_PRV1)

        cMsg += "C�digo: " + cValToChar(cCod) + CRLF + "Descri��o: " + cValToChar(cDes) + CRLF + "Pre�o de Venda: " + cValToChar(cPrv) + CRLF + "--------------------------------------------" + CRLF

        &(cAlias) -> (DbSkip())
    end

    if cMsg == ""
        cMsg := "Esse c�digo n�o foi cadastrado!"
    endif  
    
    FwAlertInfo(cMsg, 'Confere C�digo')

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
