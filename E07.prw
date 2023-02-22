#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function L03E07()
    local aArea              := getArea()
    local cAlias             := GetNextAlias()
    local nCont              := 0
    local dDatIni            := ""
    local dDatFim            := ""
    local cQuery             := ""
    local cMsg               := ""
    local cPedidoDeVenda     := ""

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    dDatIni := DTOS(CTOD(FwInputBox("Digite a data inicial")))
    dDatFim := DTOS(CTOD(FwInputBox("Digite a data final")))

    cQuery := "SELECT C5_NUM FROM " + RetSqlName("SC5") + " SC5 WHERE C5_EMISSAO BETWEEN " + dDatIni + " AND " + dDatFim 

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias) -> (!EOF())
        cPedidoDeVenda := &(cAlias) -> (C5_NUM)

        cMsg += "Pedidos de Venda: " + cValToChar(cPedidoDeVenda) + CRLF + "---------------------------------------" + CRLF

        nCont++
        if nCont == 10
            FwAlertInfo(cMsg, 'Pedidos do Periódo Escolhido')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias) -> (DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Pedidos do Periódo Escolhido')
    endif

    &(cAlias) -> (DbCloseArea())
    restArea(aArea)
Return 
