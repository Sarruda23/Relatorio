create database AgregClie
go 
use AgregClie

Create Table cliente
(
	codigo int  not null PRIMARY KEY,
	nome varchar(200) not null,
	endereco varchar(100) not null,
	telefone nchar(8) not null,
	nascimento varchar(200) not null
)

select *from cliente

CREATE TABLE fornecedor
(
	codigo int  not null PRIMARY KEY,
	nome varchar(200) not null,
	atividade varchar(30) not null,
	telefone nchar(8) not null
)
select *from fornecedor

CREATE TABLE produto
(
	codigo int not null PRIMARY KEY,
	nome varchar(200) not null,
	valor_uni decimal(7,2) not null,
	qntd int not null,
	descricao varchar(100) not null,
	cod_forne  int not null,
	FOREIGN KEY (cod_forne) references fornecedor (codigo)
)

CREATE  TABLE pedido
(
	codigo int not null,
	cod_cli int not null,
	cod_prod int not null,
	quantd int not null,
	d_entrega datetime,
	PRIMARY KEY (codigo,cod_cli,cod_prod),
	FOREIGN KEY (cod_cli) references cliente (codigo),
	FOREIGN KEY (cod_prod) references produto (codigo)
)

select *from pedido

Select p.codigo , c.codigo as Clientecod,c.nome as ClienteNome, p.d_entrega ,c.endereco as Endereco,c.telefone as telefone,
pro.nome,pro.codigo as ProdCod,pro.qntd as ProdutQntd,pro.valor_uni, 
SUM(pro.qntd * pro.qntd) as ValorTotal from pedido p
 INNER JOIN cliente c on c.codigo  = p.cod_cli 
 INNER JOIN produto pro on  p.cod_prod =pro.codigo
  where p.codigo = 99001
 group by p.codigo,c.codigo,c.nome, p.d_entrega,pro.codigo,pro.nome,pro.qntd,pro.valor_uni,c.telefone,c.endereco
