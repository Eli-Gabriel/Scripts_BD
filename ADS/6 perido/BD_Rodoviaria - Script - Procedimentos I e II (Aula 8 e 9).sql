#NOME COMPLETO:_________________________________________
drop database if EXISTS bd_Imperio_Rodoviaria;
create database bd_Imperio_Rodoviaria;
use bd_Imperio_Rodoviaria;

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
#exercício01
drop procedure if exists Inserir_Estado;
DELIMITER $$
CREATE PROCEDURE Inserir_Estado (nome varchar(200), sigla varchar(2))
BEGIN
DECLARE nomeD varchar(200);

select nome_est into nomeD from estado where nome_est = nome;

if (nomeD <> '') then
	select concat ('Estado já existente!') as Msg;
else
	insert into estado values (null, nome, sigla);
    select concat ('Estado cadastrado com sucesso!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Estado ('Rondônia', 'RO');
call Inserir_Estado ('Mato Grosso', 'MT');
call Inserir_Estado ('Acre', 'AC');
call Inserir_Estado ('Amazonas', 'AM');
call Inserir_Estado ('Mato Grosso do Sul', 'MS');
call Inserir_Estado ('Tocantins', 'TO');
call Inserir_Estado ('Bahia', 'BA');
call Inserir_Estado ('Paraná', 'PR');
call Inserir_Estado ('Minas Gerais', 'MG');
call Inserir_Estado ('Pernanbuco', 'PE');



#exercício02
drop procedure if exists Inserir_Cidade;
DELIMITER $$
CREATE PROCEDURE Inserir_Cidade (nome varchar(200), codigo int)
BEGIN
DECLARE nomeC varchar(200);
DECLARE cod int;

select nome_cid into nomeC from cidade where nome_cid = nome;
select cod_est into cod from estado where cod_est = codigo;

if (cod <> '') then
	if (nomeC <> '') then
		select concat ('Cidade já existente!') as Msg;
	else
		insert into cidade values (null, nome, codigo);
		select concat ('Cidade cadastrada com sucesso!') as Msg;
	end if;
else
	select concat ('Estado Inválido!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Cidade ('Ji-paraná', 1);
call Inserir_Cidade ('Presidente Médici', 1);
call Inserir_Cidade ('Ouro Preto do Oeste', 1);
call Inserir_Cidade ('Jaru', 1);
call Inserir_Cidade ('Porto Velho', 1);
call Inserir_Cidade ('Ariquemes', 1);
call Inserir_Cidade ('Candeias do Jamari', 1);
call Inserir_Cidade ('Vilhena', 1);
call Inserir_Cidade ('Cacoal', 1);
call Inserir_Cidade ('Costa Marques', 1);
call Inserir_Cidade ('Cuiabá', 2);
call Inserir_Cidade ('Várzea Grande', 2);
call Inserir_Cidade ('Rondonópolis', 2);
call Inserir_Cidade ('Rio Branco', 3);
call Inserir_Cidade ('Cruzeiro do Sul', 3);
call Inserir_Cidade ('Manaus', 4);
call Inserir_Cidade ('Parintins', 4);
call Inserir_Cidade ('Itacoatiara', 4);
call Inserir_Cidade ('Campo Grande', 5);
call Inserir_Cidade ('Dourados', 5);



#exercício03
drop procedure if exists Inserir_Endereco;
DELIMITER $$
CREATE PROCEDURE Inserir_Endereco (rua varchar(300), numero int, bairro varchar(100), cep varchar(100), codigo int)
BEGIN
declare cod_c int;

select cod_cid into cod_c from cidade where cod_cid = codigo;

if (cod_c <> '') then
	insert into endereço values (null, rua, numero, bairro, cep, codigo);
    select concat ('Endereço cadastrado com sucesso!') as Msg;
else
	select concat ('Cidade inválida!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Endereco('Av. Rio Branco', 6656, 'Centro', '71669000', 1);
call Inserir_Endereco('Rua dos Imigrantes', 4270, 'Ao Lado', '09852-210', 8);
call Inserir_Endereco('Rua Duque de Caxias',9190, 'Biquera', '69918-652', 4);
call Inserir_Endereco('Av. 7 de Setembro', 8402, 'Centro', '69919-614', 9);
call Inserir_Endereco('Av. Tatooine', 6996, 'Centro', '44050-428', 5);
call Inserir_Endereco('Av. Madeireira', 0900, 'Silva', '69316-692', 15);
call Inserir_Endereco('Rua Constelação', 0101, 'Centro', '09852-210', 8);
call Inserir_Endereco('Rua Costelão', 0001, 'Cunha', '69082-811', 3);
call Inserir_Endereco('Av. 15 de Novembro', 6302, 'Jardin dos Imigrantes', '71669000', 1);
call Inserir_Endereco('Rua José Vidal', 6969, 'Centro', '58091-200', 2);



#exercício04
drop procedure if exists Inserir_Sexo;
DELIMITER $$
CREATE PROCEDURE Inserir_Sexo (nome varchar(100))
BEGIN

declare s varchar(100);

select nome_sex into s from sexo where nome_sex = nome;

if (nome <> '') then
	if (s <> '') then
		select concat ('Sexo existente!') as Msg;
	else
        insert into sexo values (null, nome);
		select concat ('Sexo cadastrada com sucesso!') as Msg;
	end if;
else
	select concat ('Nome do sexo VAZIO!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Sexo('Masculino');
call Inserir_Sexo('Feminino');



#exercício05
drop procedure if exists Inserir_Telefone;
DELIMITER $$
CREATE PROCEDURE Inserir_Telefone (celular varchar(100), casa varchar(100),trabalho varchar(100))
BEGIN

if (celular <> '') then
	insert into telefone values(null, celular, casa, trabalho);
	select concat ('Número(s) de Telefone cadastrado(s) com sucesso!') as Msg;
else
	select concat ('Número de Celular NÃO pode ser vazio') as Msg;	
end if;

END;
$$ DELIMITER ;

call Inserir_Telefone('87236', '', '');
call Inserir_Telefone('083478', '', '3434534');
call Inserir_Telefone('324636', '2346345', '');
call Inserir_Telefone('3453453', '362362', '236365');
call Inserir_Telefone('234634', '3574624', '2369345');



#exercício06
drop procedure if exists Inserir_Cliente;
DELIMITER $$
CREATE PROCEDURE Inserir_Cliente (nome varchar(200), estadocivil varchar(50), cpf varchar(20), rg varchar(30), datanasc date, codsex int, codend int, codtel int)
BEGIN

declare endereco int;
declare sexo int;
declare telefone int;

select cod_end into endereco from endereço where cod_end = codend;
select cod_sex into sexo from sexo where cod_sex = codsex;
select cod_tel into telefone from telefone where cod_tel = codtel;

if (endereco <> '') then
	if (sexo <> '') then
		if (telefone <> '') then
			insert into cliente values (null, nome, estadocivil, cpf, rg, datanasc, codsex, codend, codtel);
			select concat ('Cliente cadastrado com sucesso!') as Msg;
		else
			select concat ('Telefone inexistente!') as Msg;
		end if;
	else
		select concat ('Sexo inexistente!') as Msg;
	end if;
else
	select concat ('Endereço inexistente!') as Msg;
end if;
END;
$$ DELIMITER ;

call Inserir_Cliente('Pedro Cunha da Silva', 'Viúvo', '12345678900', '12345670', '2000-12-25', 1, 4, 3);
call Inserir_Cliente('Maria Madalena de Oliveira', 'Solteira', '404.890.610-01', '(16) 98887-7442', '1985-08-27', 2, 3, 2);
call Inserir_Cliente('Jackson Henrique', 'Casado', '390.114.090-51', '(96) 99496-0807', '1992-10-11', 1, 7, 1);
call Inserir_Cliente('Jaime Carvalho', 'Casado', '430.539.000-09', '(84) 98294-8673', '1999-05-10', 1, 5, 4);
call Inserir_Cliente('Namaria', 'Casada', '249.735.550-96', '(86) 99334-5269', '1984-01-18', 2, 9, 5);



#exercício07
drop procedure if exists Inserir_Departamento;
DELIMITER $$
CREATE PROCEDURE Inserir_Departamento (nome varchar(100), descricao varchar(300))
BEGIN

if (nome <> '') then
	if	(descricao <> '') then
		insert into departamento values(null, nome, descricao);
		select concat ('Departamento cadastrado com sucesso!') as Msg;
	else 
		select concat ('Descrição do departamento NÃO pode ser vazio') as Msg;	
    end if;
else
	select concat ('Nome do departamento NÃO pode ser vazio') as Msg;	
end if;


END;
$$ DELIMITER ;

call Inserir_Departamento('Vendas de Passagens', 'Departamento responsavel pela venda de passagens');
call Inserir_Departamento('RH', 'Recursos Humanos');
call Inserir_Departamento('Contabilidade', 'Fazem contas');



#exercício08
#Outros funcionarios que não sejam vendedores podem ser cadastrados no departaemnto departamento de venda de passagens??
drop procedure if exists Inserir_Funcionario;
DELIMITER $$
CREATE PROCEDURE Inserir_Funcionario (nome varchar(200), cpf varchar(20), rg varchar(20), datanasc date, salario double, funcao varchar(50), sexo int, departament int, endereco int, telefone int)
BEGIN
declare sex int;
declare dep int;
declare ende int;
declare tel int;

select cod_sex into sex from sexo where cod_sex = sexo;
select cod_dep into dep from departamento where cod_dep = departament;
select cod_end into ende from endereço where cod_end = endereco;
select cod_tel into tel from telefone where cod_tel = telefone;

if (ende <> '') then
	if (sex <> '') then
		if (tel <> '') then
			if (dep <> '') then
				if (funcao = 'Vendedor' and departament <> 1) then
					select concat ('Vendedores DEVEM ser cadastrados no departamento de Vendas de Passagens') as Msg;
				else
					insert into funcionario values(null, nome, cpf, rg, datanasc, salario, funcao, sexo, departament, endereco, telefone);
					select concat ('Funcionario Inserdo com sucesso!') as Msg;
				end if;
			else select concat ('Departamento Inexistente!') as Msg;
			end if;
		else select concat ('Telefone Inexistente!') as Msg;
		end if;
    else select concat ('Sexo Inexistente!') as Msg;
	end if;
else select concat ('Endereço Inexistente!') as Msg;
end if;

END;
$$ DELIMITER ;

call Inserir_Funcionario('Pedro Carlos de Almeida', '327.290.139-62', '50.883.043-6', '1986-10-10', 2500.0, 'Vendedor', 1, 1, 3, 5);
call Inserir_Funcionario('Jaqueline Rebeca da Paz', '867.400.213-76', '32.251.856-8', '1990-03-15', 3750.0, 'Contador', 2, 3, 2, 3);
call Inserir_Funcionario('Nicolas Felipe Igor Baptista', '793.560.855-52', '27.913.286-4', '1994-09-10', 1500.0, 'Vendedor', 1, 1, 4, 1);
call Inserir_Funcionario('Silvana Priscila Galvão', '116.278.340-01', '48.608.546-6', '1997-05-07', 1500.0, 'Atendente', 2, 3, 10, 4);



#exercício09
drop procedure if exists Inserir_Onibus;
DELIMITER $$
CREATE PROCEDURE Inserir_Onibus (modelo varchar(100), marca varchar(100), placa varchar(50), tipo varchar(100))
BEGIN

if ((modelo='Amazon Bus Premium' and tipo ='Executive') or (modelo='Amazon Bus Leito' and tipo ='Confort')) then
	insert into onibus values(null, modelo, marca, placa, tipo);
    select concat ('Ônibus Cadastrado com sucesso!');
else select concat ('Tipo e/ou Modelo de ônibus inválido(s)!');
end if;

END;
$$ DELIMITER ;

select * from onibus;
call Inserir_Onibus('Amazon Bus Premium', 'Ford', 'qpa93', 'Executive');
call Inserir_Onibus('Amazon Bus Premium', 'Wolksvagen', 'kapa264', 'Executive');
call Inserir_Onibus('Amazon Bus Leito', 'Fiat', 'teh927', 'Confort');
call Inserir_Onibus('Amazon Bus Leito', 'Fait', 'agr290', 'Confort');



#exercício10
drop procedure if exists Inserir_Poltrona;
DELIMITER $$
CREATE PROCEDURE Inserir_Poltrona (onibus int)
BEGIN

declare tipo varchar(100);
declare qtd int;
declare qtd_max int;
set qtd = 1;

#pegar o tipo de onibus
select tipo_oni into tipo from onibus where cod_oni = onibus;

#verificar o tipo de onibus
if (tipo = 'Executive') then
	set qtd_max = 48;
else
	if(tipo = 'Confort') then
		set qtd_max = 58;		
    else
		select concat ('Ônibus inválido!') as Msg;
    end if;
end if;

while qtd <= qtd_max DO
	insert into poltrona values(null, qtd, 'Livre', onibus);
	set qtd = qtd + 1;
end while;
    
select concat (qtd, ' poltronas inseridas con sucesso!') as Msg;
END;
$$ DELIMITER ;

call Inserir_Poltrona(1);
call Inserir_Poltrona(2);
call Inserir_Poltrona(3);
call Inserir_Poltrona(4);

/*
drop procedure if exists Inserir_Poltrona;
DELIMITER $$
CREATE PROCEDURE Inserir_Poltrona (numero int, numero varchar(100), onibus int)
BEGIN

END;
$$ DELIMITER ;
*/