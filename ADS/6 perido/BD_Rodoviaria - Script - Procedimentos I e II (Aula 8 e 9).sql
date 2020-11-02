#NOME COMPLETO:_________________________________________

create database bd_Imperio_Professor;
use bd_Imperio_Professor;

create table Estado (
cod_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2)
);

create table Cidade (
cod_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
cod_est int,
foreign key (cod_est) references Estado (cod_est)
);

create table Endereço (
cod_end integer not null primary key auto_increment,
rua_end varchar (300) not null,
numero_end integer,
bairro_end varchar (100),
cep_end varchar (100),
cod_cid int not null,
foreign key (cod_cid) references Cidade (cod_cid)
); 

create table Sexo (
cod_sex int not null primary key auto_increment,
nome_sex varchar (100) not null
);

create table Telefone (
cod_tel int not null primary key auto_increment,
celular_tel varchar (100),
casa_tel varchar (100),
trabalho_tel varchar (100)
);

create table Cliente (
cod_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
datanasc_cli date,
cod_sex integer not null,
cod_end integer not null,
cod_tel integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_end) references Endereço (cod_end),
foreign key (cod_tel) references Telefone (cod_tel)
);

create table Departamento (
cod_dep integer not null primary key auto_increment,
nome_dep varchar (100),
descrição_dep varchar (300)
);

create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
datanasc_func date,
salário_func double not null,
função_func varchar (50) not null,
cod_sex integer not null,
cod_dep integer not null,
cod_end integer not null,
cod_tel integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_dep) references Departamento (cod_dep),
foreign key (cod_end) references Endereço (cod_end),
foreign key (cod_tel) references Telefone (cod_tel)
);

create table onibus (
cod_oni integer not null primary key auto_increment,
modelo_oni varchar (100) not null,
marca_oni varchar (100),
placa_oni varchar (50),
tipo_oni varchar (100)
);

create table Poltrona(
cod_pol integer not null primary key auto_increment,
número_pol integer not null,
situação_pol varchar (100) not null,
cod_oni integer not null,
foreign key (cod_oni) references Onibus (cod_oni)
);

create table Trecho_Viagem (
cod_tre integer not null primary key auto_increment,
data_part_tre date not null,
data_cheg_tre date not null,
horário_part_tre time not null,
horário_cheg_tre time not null,
distancia_tre float,
tarifa_tre float,
cod_cid_origem int not null,
cod_cid_destino int not null,
cod_oni int not null,
foreign key (cod_cid_origem) references Cidade (cod_cid),
foreign key (cod_cid_destino) references Cidade (cod_cid),
foreign key (cod_oni) references Onibus (cod_oni)
);

create table Passagem (
cod_pas integer not null primary key auto_increment,
data_pas date,
valor_pas float,
cod_cli integer not null,
cod_func integer not null,
cod_tre integer not null,
poltrona_pas integer,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_tre) references Trecho_Viagem (cod_tre)
);

create table Caixa (
cod_caixa integer not null primary key auto_increment,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double,
cod_func int not null,
foreign key (cod_func) references Funcionario (cod_func)
);

create table Recebimentos (
cod_receb integer not null primary key auto_increment,
data_receb date,
valor_receb double,
formapag_receb varchar (100),
cod_caixa integer not null,
cod_pas integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_pas) references Passagem (cod_pas)
);

#INICIE A PARTIR DAQUI SUA LISTA DE EXERCÍCIOS


