#INCLUDE 'totvs.ch'

User Function diaSemana()
    local nNum 
    local lCont := .t.
    local aNomeDia := {'Domingo', 'Segunda', 'Ter�a', 'Quarta', 'Quinta', 'Sexta', 'S�bado'}

    while lCont
        nNum := Val(FwInputBox("Digite um n�mero entre 1 e 7"))

        if nNum > 7 .or. nNum < 1
            MsgInfo("Voc� informou um n�mero errado","Aten��o")
        else
            lCont := .f.
        endif
    end

    FwAlertSuccess(cValToChar(nNum) + " - " + cValToChar(aNomeDia[nNum]),"Dia da Semana")
Return 
