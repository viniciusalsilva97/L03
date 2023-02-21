#INCLUDE 'totvs.ch'

#DEFINE NULTIMOMES 12

User Function tempMedia()
    local aTemperatura := { }
    local nTempMes 
    local nSomaMedia := 0
    local nCalcMedia
    local nCont 
    local cMsg := ''

    for nCont := 1 to NULTIMOMES
        nTempMes := Val(FwInputBox("Qual é a temperatura desse mês"))
        nSomaMedia += nTempMes
        AADD( aTemperatura, nTempMes )
    next

    nCalcMedia := nSomaMedia / NULTIMOMES
    cMsg += "Média Anual: " + cValToChar(Round(nCalcMedia,2)) + " Graus" + CRLF + CRLF

    for nCont := 1 to NULTIMOMES
        if aTemperatura[nCont] > nCalcMedia
            if nCont == 1
                cMsg += "Janeiro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF 
            elseif nCont == 2
                cMsg += "Fevereiro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 3
                cMsg += "Março: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 4
                cMsg += "Abril: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 5
                cMsg += "Maio: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 6
                cMsg += "Junho: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 7
                cMsg += "Julho: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 8
                cMsg += "Agosto: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 9
                cMsg += "Setembro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 10
                cMsg += "Outubro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 11
                cMsg += "Novembro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            elseif nCont == 12
                cMsg += "Dezembro: " + cValToChar(aTemperatura[nCont]) + " Graus" + CRLF + CRLF
            endif 
        endif 
    next

    FwAlertInfo(cMsg)
Return 
