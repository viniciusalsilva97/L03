#INCLUDE "totvs.ch"

User Function inverteNome()
    local cNome 
    local cNomeInvertido := ''
    local cAux
    local nCont

    cNome := FwInputBox("Digite o seu nome", cNome)

    for nCont := Len(cNome) to 1 step -1
        cAux := SubStr(cNome, nCont, 1)
        cNomeInvertido += cAux
    next

    FwAlertSuccess(Upper(cNomeInvertido))
    
Return 
