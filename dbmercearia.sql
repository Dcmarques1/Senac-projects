drop database dbmercearia;

create database dbmercearia;

use dbmercearia;

-- criando tabelas
--Tabela Funcionários
create table tbfuncionarios(
codfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telefone char(10),
cpf char(14) not null unique,
sexo char(1) default 'f' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >= 0),
primary key(codfunc)
);

-- Tabela de Fornecedores
create table tbfornecedores(
codforn int not null auto_increment,
nome varchar(100),
cnpj char(18) not null unique,
ie char(12) not null unique,
logradouro varchar(100),
numero char(5),
cep char(9),
bairro varchar(100),
cidade varchar(50),
estado varchar(50),
telefone varchar(10),
primary key(codforn)
);

-- Tabela de Clientes
create table tbClientes(
codcli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codcli)
);

-- Tabela de Usuários
create table tbUsuarios(
codusu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu), 
foreign key(codfunc) references tbfuncionarios(codfunc)
);

--tabela de produtos

create table tbProdutos(
codprod int not null auto_increment,
descricao varchar(100),
quantidade int default 0 check(quantidade >=0),
valor decimal(9,2) default 0 check(valor >=0),
dataEntrada date,
horaEntrada time,
codforn int not null,
primary key(codprod),
foreign key(codforn) references tbfornecedores(codforn)
);

--tabela de vendas/caixa
create table tbVendas(
codvend int not null auto_increment,
codcli int not null,
codprod int not null,
codusu int not null,
datavenda date,
horavenda time,
quantidade int default 0 check (quantidade >=0),
primary key(codvend),
foreign key(codcli) references tbClientes(codcli),
foreign key(codprod) references tbProdutos(codprod),
foreign key(codusu) references tbUsuarios(codusu)
);

-- visualizar a estrutura da tabela
desc tbfuncionarios;
desc tbfornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros
-- registros funcionarios

insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
	values('Roberta da Silva','roberta_silva@gmail.com','98765-1234','132.456.729-55','F', 1500.00);

insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
	values('Roberto da Silva','roberto_silva@gmail.com','98765-1235','132.456.729-56','M',1500.00);

-- registros usuários

insert into tbUsuarios(nome,senha,codfunc)
	values ('robta.silva','123456',1);

insert into tbUsuarios(nome,senha,codfunc)
	values ('robto.silva','123457',2);	


-- visualizar os registros da tabelas
select * from tbfuncionarios;

select * from tbUsuarios;

select * from tbfornecedores;

select * from tbvendas;