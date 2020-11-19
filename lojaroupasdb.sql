create database lojaroupasdb;
use lojaroupasdb;

create table usuarios (
	UID int auto_increment primary key,
	NOME varchar(40) not null,
	CPF varchar(11) not null,
	EMAIL varchar(40) not null,
	SENHA varchar(40) not null,
	TELEFONE char(12) not null);

create table enderecos (
	EID int auto_increment primary key,
	UID int not null,
	CEP varchar(8) not null,
	RUA varchar(100) not null,
	NUMERO int not null,
	COMPLEMENTO varchar(100),
	REFERENCIA varchar(100),
	foreign key (UID) references usuarios(UID));

create table tamanhos (
	TAMID int auto_increment primary key,
	TAMANHO varchar(2) not null);

create table tecidos (
	TECID int auto_increment primary key,
	TECIDO varchar(10) not null);

create table sexos (
	SID int auto_increment primary key,
	SEXO varchar(10) not null);

create table roupas (
	RID int auto_increment primary key,
	TAMID int not null,
	TECID int not null,
	SID int not null,
	QUANTIDADE int not null,
	MARCA varchar(20) not null,
	COR varchar(20) not null,
	DESCRICAO varchar(100) not null,
	VALOR decimal(6,2) not null,
	foreign key(TAMID) references tamanhos(TAMID),
	foreign key(TECID) references tecidos(TECID),
	foreign key(SID) references sexos(SID));

create table pagamentos (
	PID int auto_increment primary key,
	PAGAMENTO varchar(10) not null);

create table compras (
	CID int auto_increment primary key,
	UID int not null,
	RID int not null,
	PID int not null,
	QUANTIDADE int not null,
	foreign key(UID) references usuarios(UID),
	foreign key(PID) references pagamentos(PID),
	foreign key(RID) references roupas(RID));

create table recibos (
	RECID int auto_increment primary key,
	CID int,
	DATA date,
	foreign key(CID) references compras(CID));

insert into usuarios (NOME, CPF, EMAIL, SENHA, TELEFONE) values
('GABRIEL', '78912345610', 'gabriel@gmail.com', 'spfc', '11976887687'),
('KARINE', '85589345610', 'karine@gmail.com', 'nulo', '11996317687'),
('RODRIGO', '87742345610', 'rodrigo@gmail.com', 'flamengo', '11924117687');

insert into enderecos (UID, CEP, RUA, NUMERO, COMPLEMENTO, REFERENCIA) values
(1, '08948678', 'Grande Craque Neto', 10, 'Portao do curinthia', 'Proximo daquele lugar');

insert into tamanhos (TAMANHO) values
('PP'), ('P'), ('M'), ('G'), ('GG');

insert into tecidos (TECIDO) values
('Algod�o org�nico'), ('C�nhamo'), ('Fibra de bananeira'), ('Fibra de laranja'), ('Fibra de soja'), ('Lenpur'), ('Linho'), ('Liocel'), ('Modal'), ('Pi�atex'), ('Poliamida biodegrad�vel'), ('Qmilk');

insert into sexos (SEXO) values
('Masculino'), ('Feminino'), ('Unissex');

insert into roupas (TAMID, TECID, SID, QUANTIDADE, MARCA, COR, DESCRICAO, VALOR) values
(1, 1, 1, 60, 'Nike', 'Azul', 'Uma bela calca. Ecologica e agradavel de usar!', 99);

insert into pagamentos (PAGAMENTO) values
('Boleto'), ('Credito'), ('Debito');

insert into compras (UID, RID, PID, QUANTIDADE) values
(1, 1, 1, 30);

insert into recibos(CID, DATA) values
(1, '2020-11-19');

select * from usuarios;
select * from enderecos;
select * from tamanhos;
select * from tecidos;
select * from sexos;
select * from roupas;
select * from pagamentos;
select * from compras;
select * from recibos;