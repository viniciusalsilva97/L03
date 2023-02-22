#INCLUDE 'totvs.ch'
#INCLUDE 'topconn.ch'
#INCLUDE 'tbiconn.ch'

User Function pedidoVendas()
   local aArea              := getArea() 
   local cAlias             := getNextAlias()
   local cPedidoDeVendas    := ""
   local cCodigoCliente     := ""
   local cNomeCLiente       := ""
   local cQuery             := ""
   local cMsg               := ""
   local cNota              := ""

   PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

   cQuery := "SELECT C5_NUM, C5_CLIENTE, A1_NOME FROM " + retSqlName("SC5") + " SC5 JOIN " + retSqlName("SA1") + " SA1 ON A1_COD = C5_CLIENTE WHERE C5_NOTA = '" + cNota + "'"

   TCQUERY cQuery ALIAS &(cAlias) NEW 

   while &(cAlias) -> (!EOF())
      cPedidoDeVendas := &(cAlias) -> (C5_NUM)
      cCodigoCliente  := &(cAlias) -> (C5_CLIENTE)
      cNomeCliente    := &(cAlias) -> (A1_NOME)

      cMsg += "Número do pedido: " + cPedidoDeVendas + CRLF + "Nome do Cliente: " + cNomeCLiente + CRLF + "-------------------------------------------------" + CRLF

      &(cAlias) -> (DbSkip())
   end
   
   if cMsg == ""
      cMsg += "Todos os números de notas foram preenchidos!"
   endif

   FwAlertInfo(cMsg, 'Informações sobre a Nota Fiscal')

   &(cAlias) -> (DbCloseArea())
   restArea(aArea)
Return 
