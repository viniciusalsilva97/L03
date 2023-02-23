#INCLUDE 'totvs.ch'

#DEFINE NMAX 5
User Function numerosInteiros()
    local nNum
    local aInt := { }
    local cMsg := 'Números selecionados:' + CRLF + CRLF
    local nCont

    for nCont := 1 to NMAX 
        nNum := Randomize(1, 80)
        AADD( aInt, nNum )
        cMsg += cValToChar(aInt[nCont]) + ", "
    next

    FwAlertSuccess(stuff(cMsg, len(cMsg) -1, 2, "."))

Return 
