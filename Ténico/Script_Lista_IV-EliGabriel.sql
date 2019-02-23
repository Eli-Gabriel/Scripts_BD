create database bd_hotel;
use bd_hotel;


create table Endereco (
cod_end integer not null primary key,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cidade_end varchar (100),
estado_end varchar (100)
); 

insert into Endereco values (1, 'Av. Brasil', 111, 'Nova Brasília', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (2, 'Av. Marechal Rondon', 1245, 'Centro', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (3, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (4, 'Av. Aracaju', 911, 'BNH', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (5, 'Rua 07 de Setembro', 121, 'Dom Bosco', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (6, 'Rua Mato Grosso', 887, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (7, 'Av. Jorge Teixeira', 1589, 'Centro', 'Porto Velho', 'Rondônia');
insert into Endereco values (8, 'Av. Paulista', 989, 'Centro', 'São Paulo', 'São Paulo');
insert into Endereco values (9, 'Travessa dos Mineiros', 456, 'Centro', 'Ariquemes', 'Rondônia');
insert into Endereco values (10, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');


create table Cliente (
cod_cli integer not null primary key,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
sexo_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli double,
telefone_cli varchar (50) not null,
celular_cli varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into cliente values (1, 'Jackson Henrique da Silva Bezerra', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 
10000.00, '69 84085712', '69 84111111', 3);
insert into cliente values (2, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 
456454.45, '', '', 8);
insert into cliente values (3, 'Capitão América', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 
0.00, '11 454546511', '', 1);
insert into cliente values (4, 'José Pereira da Silva', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 
900.00, '69 88998899', '69 4444 4444', 4);
insert into cliente values (5, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 
3000.00, '69 3421 5511', '69 99111111', 3);
insert into cliente values (6, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 
5450.00, '69 3421 1122', '69 9999 7788', 10);
insert into cliente values (7, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 
6845.00, '69 84085712', '69 84111111', 9);
insert into cliente values (8, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 
4199.00, '69 3421 2211', '69 84118811', 2);
insert into cliente values (9, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 
3250.00, '69 3421 9999', '69 84118811', 5);
insert into cliente values (10, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 
9600.00, '69 3421 1123', '69 84118811', 3);


create table Funcionario (
cod_func integer not null primary key,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
sexo_func varchar (30),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into funcionario values (1, 'João Eujacio Teixeira', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 
5000.00, '', '69 84111155', 'Atendente', 2);
insert into funcionario values (2, 'Paula Fernandes', '565.888.988-88', '64444 sesdec', 'Feminino', '1965-1-20', 
45000.00, '', '', 'Atendente', 1);
insert into funcionario values (3, 'Roberto Carlos', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 
1500.00, '11 454546511', '', 'Gerente', 5);


create table Produto (
cod_prod int primary key not null,
descrição_prod varchar (200) not null,
quantidade_prod int,
valor_prod float,
dataValidade_prod date
);

insert into produto values (1, 'Agua Mineral Sem Gás 500ml', 50, 3.50, '2020-01-01');
insert into produto values (2, 'Chocolate em Barra 200gr', 30, 4.80, '2018-06-30');
insert into produto values (3, 'Cerveja Skol 350ml', 10, 4.50, '2019-01-01');

create table Quarto (
cod_qua int primary key not null,
descrição_qua varchar (200) not null,
número_qua int not null,
tipo_qua varchar (100) not null,
valor_qua float
);

insert into quarto values (1, 'Apartamento Duplo', 100, 'Luxo', 200.00);
insert into quarto values (2, 'Apartamento Duplo', 101, 'Simples', 100.00);
insert into quarto values (3, 'Apartamento Individual', 201, 'Simples', 50.00);
insert into quarto values (4, 'Apartamento Tripo', 202, 'Simples', 150.00);


create table Produtos_quarto (
cod_pq int primary key not null,
quantidade_pq int,
dataRecarga_pq date,
cod_qua int not null,
cod_prod int not null,
foreign key (cod_qua) references quarto (cod_qua),
foreign key (cod_prod) references produto (cod_prod)
);


insert into produtos_quarto values (1, 2, '2017-03-29', 1, 1);
insert into produtos_quarto values (2, 5, '2017-03-29', 1, 2);
insert into produtos_quarto values (3, 2, '2017-03-29', 1, 3);

insert into produtos_quarto values (4, 2, '2017-03-30', 2, 1);
insert into produtos_quarto values (5, 1, '2017-03-30', 2, 3);

insert into produtos_quarto values (6, 5, '2017-03-29', 3, 1);
insert into produtos_quarto values (7, 5, '2017-03-29', 3, 2);

create table Hospedagem (
cod_hosp int primary key not null,
dataCheckin_hosp date,
dataCheckout_hosp date,
valorConsumo_hosp float,
valorDiárias_hosp float,
valorTotal_hosp float,
cod_cli int not null,
cod_func int not null,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func)
);


insert into hospedagem values (1, '2017-03-29', '2017-03-31', 0.00, 0.00, 0.00, 1, 1);
insert into hospedagem values (2, '2017-03-29', '2017-04-01', 0.00, 0.00, 0.00, 2, 1);
insert into hospedagem values (3, '2017-03-31', '2017-04-05', 0.00, 0.00, 0.00, 10, 1);


create table produtos_hospedagem (
cod_ph int primary key not null,
cod_hosp int not null,
cod_prod int not null,
quant_ph int,
valorProd_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_prod) references Produto (Cod_prod)
);

insert into produtos_hospedagem values (1, 1, 1, 3, 0.00);
insert into produtos_hospedagem values (2, 1, 2, 1, 0.00);

insert into produtos_hospedagem values (3, 2, 1, 3, 0.00);
insert into produtos_hospedagem values (4, 2, 3, 3, 0.50);

insert into produtos_hospedagem values (5, 3, 2, 1, 0.00);
insert into produtos_hospedagem values (6, 3, 3, 3, 0.00);
insert into produtos_hospedagem values (7, 3, 1, 10, 0.00);



create table quartos_hospedagem (
cod_qh int primary key not null,
cod_hosp int not null,
cod_qua int not null,
quantDiárias_ph int,
valorQuarto_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_qua) references Quarto (Cod_qua)
);

insert into quartos_hospedagem values (1, 1, 2, 2, 0.00);
insert into quartos_hospedagem values (2, 2, 3, 3, 0.00);
insert into quartos_hospedagem values (3, 3, 1, 10, 0.00);
insert into quartos_hospedagem values (4, 3, 2, 5, 0.00);





















create table Fornecedor (
cod_forn integer not null primary key,
razãosocial_forn varchar (200),
nomefantasial_forn varchar (100),
representante_forn varchar (100),
cod_end integer not null
);


insert into Fornecedor values (1, 'GM Motors LTDA', 'Chevrolet GM', 'Tony', 5);
insert into Fornecedor values (2, 'Fiat LTDA', 'Fiat', 'Fabio', 1);
insert into Fornecedor values (3, 'Toyota LTDA', 'Toyota', 'Marcos', 2);
insert into Fornecedor values (4, 'Volkswagen LTDA', 'Volkswagem', 'Nilson', 3);
insert into Fornecedor values (5, 'Hunday LTDA', 'Hynday', 'Marcos', 3);
insert into Fornecedor values (6, 'Eletrobrás Brasil', 'Ceron', 'Governo', 10);
insert into Fornecedor values (7, 'Companhia de Agua e Esgoto de Rondonia', 'Caerd', 'Maria', 11);


create table Compra_Produto (
cod_comp integer not null primary key,
data_comp date,
valortotal_comp double,
formpag_comp varchar (100),
cod_func integer not null,
cod_forn integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Compra_Produto values (1, '2016-09-01', 0, '30 dias', 1, 1);
insert into Compra_Produto values (2, '2017-02-01', 0, '30 dias', 1, 2);
insert into Compra_Produto values (3, '2017-03-01', 0, 'Vista', 1, 3);
insert into Compra_Produto values (4, '2017-04-01', 0, '60 dias', 1, 4);





create table Itens_Compra (
cod_itenscomp integer not null primary key,
quant_itenscomp integer not null,
valor_itenscomp float not null,
cod_prod integer not null,
cod_comp integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_comp) references Compra_Produto (cod_comp)
);

insert into Itens_Compra values (1, 5, 5.55, 1, 1);
insert into Itens_Compra values (2, 12, 10.80, 2, 1);
insert into Itens_Compra values (3, 9, 19.99, 3, 1);
insert into Itens_Compra values (4, 2, 6.55, 3, 1);
insert into Itens_Compra values (5, 10, 10.00, 1, 1);

insert into Itens_Compra values (6, 5, 5.00, 2, 2);
insert into Itens_Compra values (7, 20, 20.50, 2, 2);
insert into Itens_Compra values (8, 15, 18.90, 3, 2);
insert into Itens_Compra values (9, 5, 30.60, 1, 2);
insert into Itens_Compra values (10, 30, 7.99, 2, 2);

insert into Itens_Compra values (11, 10, 12.90, 1, 3);
insert into Itens_Compra values (12, 20, 18.90, 2, 3);
insert into Itens_Compra values (13, 5, 120.00, 3, 3);
insert into Itens_Compra values (14, 2, 220.80, 1, 3);
insert into Itens_Compra values (15, 8, 127.70, 2, 3);

insert into Itens_Compra values (16, 10, 11.80, 3, 4);
insert into Itens_Compra values (17, 5, 124.90, 1, 4);
insert into Itens_Compra values (18, 22, 12.90, 2, 4);
insert into Itens_Compra values (19, 15, 34.80, 3, 4);
insert into Itens_Compra values (20, 12, 48.00, 1, 4);




create table Caixa (
cod_caixa integer not null primary key,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double
);

insert into Caixa values (1, '2017-02-26', null, 100.00, 0, 0, 0);
insert into Caixa values (2, '2017-02-27', null, 100.00, 0, 0, 0);


create table Venda (
cod_vend integer not null primary key,
data_vend date,
valortotal_vend double not null,
desconto_vend double,
formpag_vend varchar (50),
cod_func integer not null,
cod_cli integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_cli) references Cliente (cod_cli)
);

insert into Venda values (1, '2017-01-25', 0, 0, 'Vista', 2, 1);
insert into Venda values (2, '2017-02-25', 0, 10.50, 'Vista', 2, 2);
insert into Venda values (3, '2017-03-25', 0, 0, 'Vista', 3, 8);


create table Itens_Venda (
cod_itensvend integer not null primary key,
quant_itensvend integer not null,
valor_itensvend integer not null,
cod_prod integer not null,
cod_vend integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_vend) references Venda (cod_vend)
);

insert into Itens_Venda values (1, 2, 0, 1, 1);
insert into Itens_Venda values (2, 1, 0, 3, 1);
insert into Itens_Venda values (3, 1, 0, 1, 1);
insert into Itens_Venda values (4, 3, 0, 2, 1);

insert into Itens_Venda values (5, 1, 0, 3, 2);
insert into Itens_Venda values (6, 4, 0, 1, 2);
insert into Itens_Venda values (7, 3, 0, 2, 2);
insert into Itens_Venda values (8, 9, 0, 3, 2);

insert into Itens_Venda values (9, 10, 0, 1, 3);
insert into Itens_Venda values (10, 2, 0, 2, 3);
insert into Itens_Venda values (11, 3, 0, 3, 3);
insert into Itens_Venda values (12, 1, 0, 1, 3);


create table Recebimentos (
cod_receb integer not null primary key,
data_receb date,
valor_receb double,
cod_caixa integer not null,
cod_vend integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_vend) references Venda (cod_vend)
);

insert into Recebimentos values (1, curdate(), 0, 1, 1);
insert into Recebimentos values (2, curdate(), 0, 1, 2);
insert into Recebimentos values (3, curdate(), 0, 2, 3);


create table Despesas (
cod_desp integer not null primary key,
descrição_desp varchar (200),
valor_desp double,
datavencimento_desp date,
númerodoc_desp integer,
cod_forn int,
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Despesas values (1, 'Conta de Agua de Janeiro/2017', 150.50, '2017-01-31', 21311, 7);
insert into Despesas values (2, 'Conta de Luz de Janeiro/2017', 550.90, '2017-02-25', 48777, 6);

create table Pagamentos (
cod_pag integer not null primary key,
data_pag date,
valor_pag float,
formapagamento_pag varchar (100),
cod_caixa integer not null,
cod_desp integer,
cod_comp integer,
cod_func integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_desp) references Despesas (cod_desp),
foreign key (cod_comp) references Compra_produto (cod_comp),
foreign key (cod_func) references Funcionario (cod_func)
);

insert into Pagamentos values (1, curdate(), 0, 'Dinheiro', 1, null, 1, 3);
insert into Pagamentos values (2, curdate(), 0, 'Dinheiro', 1, 1, null, 3);
insert into Pagamentos values (3, curdate(), 0, 'Débito Conta', 2, 2, null, 3);






################LISTA################
################11111################
DELIMITER $$
CREATE PROCEDURE mostrar_cidade (cod_cli int, out cidade varchar(50))
BEGIN
select endereco.cidade_end into cidade
from endereco  
inner join cliente on endereco.cod_end = cliente.cod_end
where cliente.cod_cli = cod_cli;
END;
$$ DELIMITER ;

call mostrar_cidade(7, @test);

select @test as 'Cidade';

select * from cliente;
select *from endereco;

################22222################
DELIMITER $$
CREATE PROCEDURE mostrar_clientes_cidade (cidade varchar(50))
BEGIN
select count(cliente.cod_cli)
from cliente 
inner join endereco on cliente.cod_end = endereco.cod_end
where endereco.cidade_end = cidade;
END;
$$ DELIMITER ;

call mostrar_clientes_cidade("ji-parana");



################33333################
DELIMITER $$
CREATE PROCEDURE Funcionario_Desconto (cod int, desconto double)
BEGIN
select funcionario.nome_func, funcionario.salário_func as 'Salário', 
(select ((funcionario.salário_func)-(funcionario.salário_func*(desconto/100))) from funcionario where funcionario.cod_func = cod) as 'Salario com Desconto'
from funcionario
where funcionario.cod_func = cod;
END;
$$ DELIMITER ;

call Funcionario_Desconto(3, 20);

select * from funcionario;

################44444################
DELIMITER $$
CREATE PROCEDURE mostra_nome_cidade_Func (cod int, out nome varchar(50), out cidade varchar(50))
BEGIN
select funcionario.nome_func, endereco.cidade_end into nome, cidade
from funcionario
inner join endereco on
funcionario.cod_end = endereco.cod_end
where funcionario.cod_end = endereco.cod_end
and funcionario.cod_func = cod;
END;
$$ DELIMITER ;

call mostra_nome_cidade_Func(2, @a, @b);
select @a as 'Nome', @b as 'Cidade';

################55555################
DELIMITER $$
CREATE PROCEDURE Qtd_hosp(cod int, out qtd int)
BEGIN
select count(hospedagem.cod_hosp) into qtd
from hospedagem 
inner join cliente on cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = cod;
END;
$$ DELIMITER ;

call Qtd_hsop(1, @qtd);
select @qtd as 'Quantidade';

################66666################
DELIMITER $$
CREATE PROCEDURE Valor_hosp(cod int, out qtd int, out nom varchar(40))
BEGIN
select (sum(hospedagem.valorTotal_hosp)), cliente.nome_cli into qtd, nom
from hospedagem 
inner join cliente on cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = cod;
END;
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Classifca_Cliente (cod int)
BEGIN
call Valor_hosp(cod, @qtd, @nom);
if (@qtd > 1000) then
	select concat(@nom,": Cliente Vip") as msg;
elseif (@qtd > 500) then
	select concat(@nom,": Cliente Normal") as msg;
else
	select concat(@nom,": Cliente Popular") as msg;
end if;
END;
$$ DELIMITER ;

call Classifca_Cliente(1);

################88888################
#####classifica o funcionario de acordo com as hospedagens feitas pelo mesmo#####
DELIMITER $$
CREATE PROCEDURE Qtd_hosp_Func(cod int, out qtd int)
BEGIN
select count(hospedagem.cod_hosp) into qtd
from hospedagem 
inner join cliente on cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = cod;
END;
$$ DELIMITER ;


DELIMITER $$
CREATE PROCEDURE xxxxx ()
BEGIN

END;
$$ DELIMITER ;

################99999################