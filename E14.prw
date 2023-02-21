#INCLUDE 'totvs.ch'

User Function numerosInteiros()
    local nNum
    local aInt := { }
    local cMsg := 'Números selecionados' + CRLF + CRLF
    local nCont

    for nCont := 1 to 5
        nNum := Randomize(1, 10)
        AADD( aInt, nNum )
        cMsg += cValToChar(aInt[nCont]) + ",  "
    next

    FwAlertSuccess(cMsg)

Return 
