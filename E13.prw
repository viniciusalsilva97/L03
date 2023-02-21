#INCLUDE 'totvs.ch'

User Function diaSemana()
    local nNum 
    local lCont := .t.
    local aNomeDia := {'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'}

    while lCont
        nNum := Val(FwInputBox("Digite um número entre 1 e 7"))

        if nNum > 7 .or. nNum < 1
            MsgInfo("Você informou um número errado","Atenção")
        else
            lCont := .f.
        endif
    end

    FwAlertSuccess(cValToChar(nNum) + " - " + cValToChar(aNomeDia[nNum]),"Dia da Semana")
Return 
