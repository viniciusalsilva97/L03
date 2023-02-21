#INCLUDE 'totvs.ch'

User Function frase()
    local cFrase 
    local nEspBranco := 0
    local nVoaglA := 0
    local nVoaglE := 0
    local nVoaglI := 0
    local nVoaglO := 0
    local nVoaglU := 0
    local nCont 
    local nAux

    cFrase := FwInputBox("Escreva uma frase qualquer", cFrase)

    for nCont := 1 to Len(cFrase)
        nAux := SubStr(cFrase, nCont, 1)

        if Upper(nAux) == Chr(65)
            nVoaglA++
        elseif Upper(nAux) == Chr(69)
            nVoaglE++
        elseif Upper(nAux) == Chr(73)
            nVoaglI++
        elseif Upper(nAux) == Chr(79)
            nVoaglO++
        elseif Upper(nAux) == Chr(85)
            nVoaglU++
        elseif nAux == " "
            nEspBranco++
        endif 
    next

    FwAlertInfo("Espaços em Branco: " + cValToChar(nEspBranco) + CRLF + "A: " + cValToChar(nVoaglA) + CRLF + "E: " + cValToChar(nVoaglE) + CRLF + "I: " + cValToChar(nVoaglI) + CRLF + "O: " + cValToChar(nVoaglO) + CRLF + "U: " + cValToChar(nVoaglU) + CRLF,"Quantidade")
Return 
