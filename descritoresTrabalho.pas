Program Pzim;

const FILA_MONO     = 1;
		  _FILA_MONO    = 'Mono';
			FILA_COLOR    = 2;
			_FILA_COLOR   = 'Color';
			FILA_PLOTTER  = 3;
			_FILA_PLOTTER = 'Plotter';

      MAX_QTD_MONO    = 10;
			MAX_QTD_COLOR   = 5;
			MAX_QTD_PLOTTER = 3;
			
			OPCAO_MENU_ATUALIZAR_FILA  = 1;
			OPCAO_MENU_GERAR_RELATORIO = 2;
			
	    ACAO_FILA_ENTRAR     				 = 1; 
	  	ACAO_FILA_ATENDER    			   = 2;
	  	ACAO_LISTAR_CLIENTES 				 = 3;
	  	ACAO_LISTAR_INFORMACOES_FILA = 4;
 
type tipoPessoa = record
		 								nome:string;
									end;				

 		 tipoArrayFila = array[1..11] of tipoPessoa;
		 
 		 tipoFila = record
		 							Fila                : tipoArrayFila;
		 							id 									: integer;
		 							descricao 				  : string;
									quantidadeElementos : integer;
		 							quantidadeMaxima    : integer;
									quantidadeEntrantes : integer;
									quantidadeAtendidas : integer;
									quantidadeRejeitadas: integer;
								end;
										
{
	Valida se uma fila est� cheia
	@param tipoFila oFila
	@return boolean
}
function isCheia(oFila:tipoFila):boolean;
begin
	isCheia := false;
	
	if oFila.quantidadeElementos = oFila.quantidadeMaxima then
	begin
 		isCheia := true;
 	end;
end;

{
	Valida se uma fila est� vazia
	@param tipoFila oFila
	@return boolean
}
function isVazia(oFila:tipoFila):boolean;
begin
	isVazia := false;
	
	if oFila.quantidadeElementos = 0 then
		begin;
 			isVazia := true;
 		end;
end;

{
	Cria um novo cliente para a fila
	@return tipoPessoa
}
function criaNovoCliente(): tipoPessoa;
var sNome: string;
var oPessoa: tipoPessoa;
begin;
	clrscr;
	writeln('Qual o nome do cliente?');
	readln(sNome);
	oPessoa.nome    := sNome;
	criaNovoCliente := oPessoa;	
end;

{
	Insere um novo cliente em determinada fila
	@param tipoFila oFila
}									
procedure adicionaCliente(var oFila:tipoFila);
var oPessoa:tipoPessoa;
begin;
	if isCheia(oFila) <> true then
		begin
			oPessoa := criaNovoCliente();
			clrscr;
			oFila.quantidadeElementos						 := oFila.quantidadeElementos + 1;
			oFila.fila[oFila.quantidadeElementos]:= oPessoa;
			oFila.quantidadeEntrantes						 := oFila.quantidadeEntrantes + 1;
			writeln('O cliente ', oPessoa.nome, ' foi adicionado com sucesso na fila ', oFila.descricao, '! Posi��o: ', oFila.quantidadeElementos);
		end
	else
		begin;
			clrscr;
			writeln('A Fila est� cheia!');
			oFila.quantidadeRejeitadas := oFila.quantidadeRejeitadas + 1;
		end;
end;

{
	Realiza o atendimento de determinada fila
	@param tipoFila oFila
}
procedure atenderFila(var oFila: tipoFila);
var i: integer;
begin;
	clrscr;
	if isVazia(oFila) <> true then
		begin;
			writeln('Realizado o atendimento do cliente ', oFila.Fila[1].nome, ', que estava presente na fila ', oFila.descricao);
			
			for i := 1 to (oFila.quantidadeElementos) do
				begin;
					oFila.Fila[i] := oFila.Fila[i + 1];
				end;
				
			oFila.quantidadeElementos := oFila.quantidadeElementos - 1;
			oFila.quantidadeAtendidas := oFila.quantidadeAtendidas + 1;
		end
	else 
		begin;
			writeln('A fila est� vazia!');
		end;
end;

{
	Lista os clientes de uma fila
	@param tipoFila oFila
}
procedure listarClientes(oFila: tipoFila);
var i: integer;
begin;
  clrscr;
	writeln('Clientes da Fila ', oFila.descricao);
	
	for i := 1 to oFila.quantidadeElementos	do
		begin;
			writeln(i, ' - ', oFila.Fila[i].nome);
		end;
		
	writeln();
end;

{
	Lista as informa��es de uma fila espec�fica
	@param tipoFila oFila
}
procedure listarInformacoesFila(oFila: tipoFila);
begin;
	clrscr;
	writeln('Informa��es da Fila');
	writeln('-------------------');
	writeln('ID: '										, oFila.id);
	writeln('Descri��o: '							, oFila.descricao);
	writeln('Quantidade de Clientes: ', oFila.quantidadeElementos);
	writeln('Quantidade M�xima: '			, oFila.quantidadeMaxima);
	writeln('Quantidade Entrantes: '	, oFila.quantidadeEntrantes);
	writeln('Quantidade Atendidos: '  , oFila.quantidadeAtendidas);
	writeln('Quantidade Rejeitados: ' , oFila.quantidadeRejeitadas);
	writeln('-------------------');
	writeln('');
end;

{
	Questiona ao usu�rio qual fila ele desejar realizar um procedimento
	@param tipoFila oFilaMono
	@param tipoFila oFilaColor
	@param tipoFila oFilaPlotter
	@return tipoFila
}
function escolheFila(oFilaMono, oFilaColor, oFilaPlotter: tipoFila): tipoFila; 
var iFila: integer;
begin;
	clrscr;
	
	while ((iFila <> FILA_MONO) AND (iFila <> FILA_COLOR) AND (iFila <> FILA_PLOTTER)) do
		begin;
			clrscr;
			writeln('Escolha a fila que deseja gerenciar');
			writeln(FILA_MONO   , ' - ', _FILA_MONO);
			writeln(FILA_COLOR  , ' - ', _FILA_COLOR);
			writeln(FILA_PLOTTER, ' - ', _FILA_PLOTTER);
			readln(iFila);
			
			if (iFila = 1) then 
				begin;
					escolheFila := oFilaMono; 	
				end
			else if (iFila = 2) then
				begin;
					escolheFila := oFilaColor;
				end
			else if (iFila = 3) then
				begin;
					escolheFila := oFilaPlotter;
				end;
		end;
end;

{
	Realiza o gerenciamento de determinada fila
	@param tipoFila oFilaMono
	@param tipoFila oFilaColor
	@param tipoFila oFilaPlotter
}
procedure gerenciaFila(var oFilaMono, oFilaColor, oFilaPlotter: tipoFila);
var oFila: tipoFila;
var iAcao: integer;
begin;
	oFila := escolheFila(oFilaMono, oFilaColor, oFilaPlotter);
	clrscr;
	
	while (iAcao <> 5) do
		begin;
			writeln('Qual atualiza��o voc� deseja fazer na fila?');
			writeln('1 - Inserir Novo Cliente');
			writeln('2 - Realizar Atendimento');
			writeln('3 - Listar clientes');
			writeln('4 - Listar Informa��es Fila');
			writeln('5 - Voltar');
			readln(iAcao);
			
			{Executa determinada a��o}
			if (iAcao = ACAO_FILA_ENTRAR) then
				begin;
					adicionaCliente(oFila);
				end
			else if (iAcao = ACAO_FILA_ATENDER) then
				begin;
					atenderFila(oFila);	
				end
			else if (iAcao = ACAO_LISTAR_CLIENTES) then
				begin;
					listarClientes(oFila);
				end
			else if (iAcao = ACAO_LISTAR_INFORMACOES_FILA) then
				begin;
					listarInformacoesFila(oFila);
				end;
			
			{Atualiza o par�metro de refer�ncia com o clone que tem as altera��es}	
			if (oFila.id = oFilaMono.id) then 
				begin;
					oFilaMono := oFila; 	
				end
			else if (oFila.id = oFilaColor.id) then
				begin;
					oFilaColor := oFila;
				end
			else if (oFila.id = oFilaPlotter.id) then
				begin;
					oFilaPlotter := oFila;
				end;	
		end;
end;

{
	Gera o relat�rio geral das filas
	@param tipoFila oFilaMono
	@param tipoFila oFilaColor
	@param tipoFila oFilaPlotter
}
procedure geraRelatorioFilas(oFilaMono, oFilaColor, oFilaPlotter: tipoFila);
begin;
	clrscr;
	writeln ('    RELAT�RIO    ');
  writeln ('-----------------');
  writeln (oFilaMono.id   , ' - ', oFilaMono.descricao   , ' | Qtd. Entrantes: ', oFilaMono.quantidadeEntrantes   , ' | Qtd. Atendidas: ', oFilaMono.quantidadeAtendidas   , ' | Qtd. Rejeitadas: ', oFilaMono.quantidadeRejeitadas);
  writeln (oFilaColor.id  , ' - ', oFilaColor.descricao  , ' | Qtd. Entrantes: ', oFilaColor.quantidadeEntrantes  , ' | Qtd. Atendidas: ', oFilaColor.quantidadeAtendidas  , ' | Qtd. Rejeitadas: ', oFilaColor.quantidadeRejeitadas);
  writeln (oFilaPlotter.id, ' - ', oFilaPlotter.descricao, ' | Qtd. Entrantes: ', oFilaPlotter.quantidadeEntrantes, ' | Qtd. Atendidas: ', oFilaPlotter.quantidadeAtendidas, ' | Qtd. Rejeitadas: ', oFilaPlotter.quantidadeRejeitadas);
	writeln ('-----------------');	
end;

{
	Carrega os dados iniciais das filas
	@param tipoFila oFilaMono
	@param tipoFila oFilaColor
	@param tipoFila oFilaPlotter
}
procedure inicializa(var oFilaMono, oFilaColor, oFilaPlotter: tipoFila);
begin;
	oFilaMono.id    							:= FILA_MONO;
	oFilaMono.quantidadeMaxima    := MAX_QTD_MONO;
	oFilaMono.descricao 				  := _FILA_MONO;
	
	oFilaColor.id    							:= FILA_COLOR;
	oFilaColor.quantidadeMaxima   := MAX_QTD_COLOR;
	oFilaColor.descricao 				  := _FILA_COLOR;
	
	oFilaPlotter.id    							:= FILA_PLOTTER;
	oFilaPlotter.quantidadeMaxima := MAX_QTD_PLOTTER;
	oFilaPlotter.descricao 				:= _FILA_PLOTTER;
end;

{
	Inicia o menu de controle das filas
}
procedure menu();
var opcao: integer;
var FilaMono, FilaColor, FilaPlotter: tipoFila;
begin;
	inicializa(FilaMono, FilaColor, FilaPlotter);
	
	while(opcao <> 3) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln ('1 - Gerenciar fila');
			writeln ('2 - Gerar relat�rio geral');
			writeln ('3 - Finalizar');
			readln(opcao);
			clrscr;
			
			if (opcao = OPCAO_MENU_ATUALIZAR_FILA) then
				begin; 
					gerenciaFila(FilaMono, FilaColor, FilaPlotter);
					clrscr;	
				end
			else if (opcao = OPCAO_MENU_GERAR_RELATORIO) then
				begin;
					geraRelatorioFilas(FilaMono, FilaColor, FilaPlotter);
				end;
		end;
end;   

Begin
	menu();	   
End.