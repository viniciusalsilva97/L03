#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E11()
    local aArea  := getArea()
    local cAlias := GetNextAlias()
    local cQuery := ""
    local cMsg   := ""
    local cCod   := ""
    local cEst   := ""  
    local nCont  := 0   

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := "SELECT A2_NOME, A2_EST FROM " + RetSqlName("SA2") + " SA2 WHERE A2_EST = 'SP'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
    
        cCod  := &(cAlias) -> (A2_NOME)
        cEst  := &(cAlias) -> (A2_EST)

        cMsg += "Fornecedor: " + cValToChar(cCod) + CRLF + "Estado: " + cValToChar(cEst) + CRLF +"---------------------------------------" + CRLF

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Pedidos do Fornecedor')
            nCont := 1
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Fornecedores de São Paulo')
    endif
    
    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
