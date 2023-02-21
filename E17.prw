#INCLUDE 'totvs.ch'

User Function nomeVertical()
    local cNome 
    local cNomeVertical := ''
    local cAux
    local nCont

    cNome := FwInputBox("Digite o seu nome", cNome)

    for nCont := 1 to Len(cNome) 
        cAux := SubStr(cNome, nCont, 1)
        cNomeVertical += cAux + CRLF
    next

     FwAlertSuccess(Upper(cNomeVertical))

Return 
