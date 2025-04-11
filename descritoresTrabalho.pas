Program Pzim ;

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
									quantidadeEntrantes:integer;
									quantidadeAtendidas:integer;
									quantidadeRejeitadas:integer;
								end;
										

function isCheia(quantidadeElementos:integer; quantidadeMaxFila:integer):boolean;
begin
	isCheia:=false;
	if isCheia = quantidadeMaxFila then
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

									
procedure inserir(var oFila:tipoFila);
	var nome:string;
	var oPessoa:tipoPessoa;
begin

if not isCheia(quantidadeElementos) then
begin
	writeln ('Qual seu nome?');
	readln (nome);
		oPessoa.nome:=nome;
		oFila.quantidadeElementos:=oFila.quantidadeElementos + 1;
		oFila.fila[oFila.quantidadeElementos]:= oPessoa;
		oFila.quantidadeEntrantes:= oFila.quantidadeEntrantes + 1;
	end;
end else
	writeln('A Fila está cheia');

procedure remover

procedure   

Begin
	   
End.