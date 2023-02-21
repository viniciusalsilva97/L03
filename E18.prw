#INCLUDE 'totvs.ch'

User Function nomeEscada()
    local cNome 
    local cAux
    local cMsg := " "
    local nCont

    cNome := FwInputBox("Digite o seu nome", cNome)

    for nCont := 1 to Len(cNome) 
        cAux := SubStr(cNome, 1, nCont)
        cMsg += cAux + CRLF
    next

    FwAlertSuccess(Upper(cMsg))
Return 
