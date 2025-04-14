Program Pzim;

const FILA_MONO = 1;
		  _FILA_MONO = 'Mono';
			FILA_COLOR = 2;
			_FILA_COLOR = 'Color';
			FILA_PLOTTER = 3;
			_FILA_PLOTTER = 'Plotter';

const MAX_QTD_MONO = 10;
			MAX_QTD_COLOR = 5;
			MAX_QTD_PLOTTER = 3; 
 
type tipoPessoa = record
		 								nome:string;
									end;				

type tipoArrayFila = array[1..10] of tipoPessoa;
		 
type tipoFila = record
		 							Fila:tipoArrayFila;
									quantidadeElementos:integer;
		 							quantidadeMaxima:integer;
									quantidadeEntrantes:integer;
									quantidadeAtendidas:integer;
									quantidadeRejeitadas:integer;
								end;
										
{
	Valida se uma fila está cheia
	@param tipoFila oFila
	@return boolean
}
function isCheia(oFila:tipoFila):boolean;
begin
	isCheia:=false;
	
	if oFila.quantidadeElementos = oFila.quantidadeMaxima then
	begin
 		isCheia:=true;
 	end;
end;

function isVazia(quantidadeElementos:integer):boolean;
begin
	isVazia:=false;
	if quantidadeElementos = 0 then
	begin
 		isVazia:=true;
 	end;
end;

{
	Questiona ao usuário qual fila ele desejar realizar um procedimento;
	@return int
}
function escolheFila(): integer; 
var iFila: integer;
begin;
	clrscr;
	
	while ((escolheFila <> FILA_MONO) AND (escolheFila <> FILA_COLOR) AND (escolheFila <> FILA_PLOTTER)) do
		begin;
			writeln('Escolha a fila desejada');
			writeln(FILA_MONO, ' - ', _FILA_MONO);
			writeln(FILA_COLOR, ' - ', _FILA_COLOR);
			writeln(FILA_PLOTTER, ' - ', _FILA_PLOTTER);
			readln(iFila);
			
			if ((escolheFila <> FILA_MONO) AND (escolheFila <> FILA_COLOR) AND (escolheFila <> FILA_PLOTTER)) then
				begin;
					clrscr;
					writeln('O valor informado é inválido');
				end;
		end;
		
	escolheFila := iFila;
end;

									
procedure inserir(var oFila:tipoFila);
	var nome:string;
	var oPessoa:tipoPessoa;
	var iFila: integer;
begin

if not isCheia(oFila) then
begin
	writeln ('Qual seu nome?');
	readln (nome);
		oPessoa.nome:=nome;
		oFila.quantidadeElementos:=oFila.quantidadeElementos + 1;
		oFila.fila[oFila.quantidadeElementos]:= oPessoa;
		oFila.quantidadeEntrantes:= oFila.quantidadeEntrantes + 1;
	end
else
	writeln('A Fila está cheia');
end;

{
	Realiza a remoção de um elemento da lista
	@param tipoFila
}
procedure remover(oFila: tipoFila);
var i: integer;
begin;
	for i := 1 to (oFila.quantidadeElementos - 1) do
		begin;
			oFila.Fila[i] := oFila.Fila[i + 1];
		end;
end;

{
	Carrega os dados iniciais das filas
}
procedure inicializa(var oFilaMono, oFilaColor, oFilaPlotter: tipoFila);
begin;
	oFilaMono.quantidadeMaxima := MAX_QTD_MONO;
	oFilaColor.quantidadeMaxima := MAX_QTD_COLOR;
	oFilaPlotter.quantidadeMaxima := MAX_QTD_PLOTTER;
end;

{
	Inicia o menu de controle das filas
}
procedure menu();
var opcao: integer;
var FilaMono, FilaColor, FilaPlotter: tipoFila;
begin;
	inicializa(FilaMono, FilaColor, FilaPlotter);
	while(opcao <> 5) do
		begin;
			clrscr;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln ('1 - Entrar em uma fila');
			writeln ('2 - Realizar o atendimento de uma fila');
			writeln ('3 - Sair de uma fila');
			writeln ('4 - Gerar relatório geral');
			writeln ('5 - Finalizar');
			readln(opcao);
		end;
end;   

Begin
	menu();	   
End.