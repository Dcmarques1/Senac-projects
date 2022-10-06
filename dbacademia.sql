-- apagando bando de dados se existir
drop database dbacademia;

-- criar o banco de dados
 create database bdacademia;

-- acessando banco de dados
use bdacademia;

-- criando as tabelas do banco de dados
create table tbfuncionarios(
codigo int,
nome varchar(100),
email varchar(100),
idade int,
rg char(12),
cpf char(14),
logradouro varchar(100),
numero char(10),
bairro varchar(100),
cidade varchar(50),
estado varchar(100));

--criando usuarios
create table tbusuarios(
codigo int,
nome varchar(20),
senha varchar(10));

-- visualizando as tabelas criadas
show tables;

--visualizando a estrutura das tabelas
desc tbfuncionarios;
desc tbusuarios;
