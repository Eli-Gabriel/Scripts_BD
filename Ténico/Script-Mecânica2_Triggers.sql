#BD Mecanica 2.0
create database bd_mecanica;
use bd_mecanica;


create table Estado (
cod_est int not null primary key,
nome_est varchar (200) not null,
sigla_est varchar (2)
);

insert into Estado values (1, 'Acre', 'AC');
insert into Estado values (2, 'Alagoas', 'AL');
insert into Estado values (3, 'Amapá','AP');
insert into Estado values (4, 'Amazonas','AM');
insert into Estado values (5, 'Bahia','BA');
insert into Estado values (6, 'Ceara','CE');
insert into Estado values (7, 'Distrito Federal','DF');
insert into Estado values (8, 'Espírito Santo','ES');
insert into Estado values (9, 'Goiás','GO');
insert into Estado values (10, 'Maranhão','MA');
insert into Estado values (11, 'Mato Grosso','MT');
insert into Estado values (12, 'Mato Grosso do Sul','MS');
insert into Estado values (13, 'Minas Gerais','MG');
insert into Estado values (14, 'Pará','PA');
insert into Estado values (15, 'Paraíba','PB');
insert into Estado values (16, 'Paraná','PR');
insert into Estado values (17, 'Pernambuco','PE');
insert into Estado values (18, 'Piauí','PI');
insert into Estado values (19, 'Rio de Janeiro','RJ');
insert into Estado values (20, 'Rio Grande do Norte','RN');
insert into Estado values (21, 'Rio Grande do Sul','RS');
insert into Estado values (22, 'Rondônia','RO');
insert into Estado values (23, 'Roraima','RR');
insert into Estado values (24, 'Santa Catarina','SC');
insert into Estado values (25, 'São Paulo','SP');
insert into Estado values (26, 'Sergipe','SE');
insert into Estado values (27, 'Tocantins','TO');


create table cidade (
cod_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
cod_est int,
foreign key (cod_est) references Estado (cod_est)
);

insert into cidade values (1, 'Ji-Paraná', 22);
insert into cidade values (2, 'Porto Velho', 22);
insert into cidade values (3, 'Vilhena', 22);
insert into cidade values (4, 'Ariquemes', 22);
insert into cidade values (5, 'Jaru', 22);
insert into cidade values (6, 'Guajará-Mirim ', 22);
insert into cidade values (7, 'Colorado do Oeste', 22);
insert into cidade values (8, 'Ouro Preto do Oeste', 22);
insert into cidade values (9, 'Pimenta Bueno', 22);
insert into cidade values (10, 'Rio Branco', 1);
insert into cidade values (11, 'São Paulo', 25);
insert into cidade values (12, 'Manaus', 4);


create table Endereco (
cod_end integer not null primary key,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cod_cid int not null,
foreign key (cod_cid) references Cidade (cod_cid)
); 

insert into Endereco values (1, 'Av. Brasil', 111, 'Nova Brasília', 1);
insert into Endereco values (2, 'Av. Marechal Rondon', 1245, 'Centro', 1);
insert into Endereco values (3, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 1);
insert into Endereco values (4, 'Av. Aracaju', 911, 'BNH', 1);
insert into Endereco values (5, 'Rua 07 de Setembro', 121,'Centro',  1);
insert into Endereco values (6, 'Rua Mato Grosso', 887, 'Dom Bosco', 1);
insert into Endereco values (7, 'Av. Jorge Teixeira', 1589, 'Centro', 2);
insert into Endereco values (8, 'Av. Paulista', 989, 'Centro', 11);
insert into Endereco values (9, 'Travessa dos Mineiros', 456, 'Centro', 4);
insert into Endereco values (10, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 1);
insert into Endereco values (11, 'Av. Aracaju', 5111, 'Nova Brasilia', 1);
insert into Endereco values (12, 'Av. Monte Castelo', 9999, 'Jardim dos Migrantes', 1);
insert into Endereco values (13, 'Rua X', 12, 'Jardim dos Migrantes', 1);
insert into Endereco values (14, 'K-0', 522, 'São Francisco', 1);
insert into Endereco values (15, 'Av. Monte Castelo', 11229, 'Jardim dos Migrantes', 1);


create table Sexo (
cod_sex int not null primary key,
nome_sex varchar (100) not null
);

insert into Sexo values (1, 'Masculino');
insert into Sexo values (2, 'Feminino');


create table Cliente (
cod_cli integer not null primary key,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli float,
telefone_cli varchar (50),
celular_cli varchar (50) not null,
cod_sex integer not null,
cod_end integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_end) references Endereco (cod_end)
);

insert into cliente values (1, 'Rodrigo Hilbert', 'Casado', '111.111.111-11', '54654 sesdec', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 1, 3);
insert into cliente values (2, 'Tiago Lacerda', 'Casado', '111.111.111-22', '54654 sesdec',  '1965-1-1', 456454.45, '', '', 1, 8);
insert into cliente values (3, 'Tom Cruise', 'Solteiro', '111.111.111-33', '48877 sesdec',  '1950-05-30', 0.00, '11 454546511', '', 1, 1);
insert into cliente values (4, 'José Pereiro da Silva', 'Casado', '222.222.222-88', '8888888 spp',  '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 1, 4);
insert into cliente values (5, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec',  '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 2, 3);
insert into cliente values (6, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec',  '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 2, 10);
insert into cliente values (7, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec',  '1970-01-01', 6845.00, '69 84085712', '69 84111111', 1, 9);
insert into cliente values (8, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec',  '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 1, 2);
insert into cliente values (9, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec',  '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 2, 5);
insert into cliente values (10, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec',  '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 1, 11);
insert into cliente values (11, 'Jackson Henrique da Silva Bezerra', 'Casado', '529.562.612-15', '880075 sesdec',  '1987-06-30', 11000.00, '', '69 84085712', 1, 3);
insert into cliente values (12, 'Jaqueline Leão Pereira', 'Casada', '522.222.153-15', '12315 sesdec', '1993-06-21', 11000.00, null, '69 984210921', 2, 3);
insert into cliente values (13, 'Gleicy Borgio', 'Casada', '126.777.888-99', null, null, 5000.00, null, '69 84888899', 2, 11);
insert into cliente values (14, 'Diego da Silva Bezerra', 'Solteiro', '111.987.123-55', null, null, 3999.99, null, '69 88997722', 1, 15);
insert into cliente values (15, 'Murilo Benicio', 'Casado', '321.123.321-55', null, null, 2450.80, null, '11 2121 1111', 1, 8);


create table Carro (
cod_car int primary key not null auto_increment,
modelo_car varchar (100) not null,
cor_car varchar (50) not null,
portas_car varchar (50),
placa_car varchar (50) not null,
marcar_car varchar (50) not null,
cod_cli int not null,
foreign key (cod_cli) references Cliente (cod_cli)
);

insert into carro values (1, 'Gol 1.0', 'preto', '4 portas', 'ndr 2815', 'Volkswagen', 1);
insert into carro values (2, 'Palio 1.0', 'branco', '4 portas', 'nea 1231', 'Fiat', 2);
insert into carro values (3, 'Gol 1.0', 'preto', '4 portas', 'wat 1254', 'Volkswagen', 3);
insert into carro values (4, 'S-10', 'prata', '2 portas', 'eae 2815', 'GM', 4);
insert into carro values (5, 'Celta Spirit 1.0', 'branco', '4 portas', 'ndd 2815', 'GM', 5);
insert into carro values (6, 'Celta Life 1.0', 'vermelho', '2 portas', 'mra 1288', 'GM', 6);
insert into carro values (7, 'Hilux 2.4', 'prata', '4 portas', 'rtu 3498', 'Toyota', 7);
insert into carro values (8, 'Prisma LTZ', 'branco', '4 portas', 'oip 1231', 'GM', 8);
insert into carro values (9, 'Hilux 2.4', 'branco', '4 portas', 'asd 1234', 'Toyota', 9);
insert into carro values (10, 'HB-20', 'preto', '4 portas', 'ndt 1155', 'Hunday', 10);
insert into carro values (11, 'Hilux 2.4', 'prata', '4 portas', 'noo 2010', 'Toyota', 1);
insert into carro values (12, 'Gol 1.6', 'branco', '4 portas', 'nnd 2066', 'Volkswagen', 7);
insert into carro values (13, 'Cruze LTZ 1.8', 'preto', '4 portas', 'ndm 2819', 'GM', 11);
insert into carro values (14, 'Cruze LTZ 1.8', 'branco', '4 portas', 'nra 2233', 'GM', 5);
insert into carro values (15, 'Celta Spirit 1.0', 'branco', '4 portas', 'ndr 2233', 'GM', 12);


create table Departamento (
cod_dep integer not null primary key,
nome_dep varchar (100),
descrição_dep varchar (300)
);

insert into Departamento values (1, 'Vendas', 'Venda de peças e serviços');
insert into Departamento values (2, 'Financeiro', 'Controle Financeiro e Caixa');
insert into Departamento values (3, 'Entrega', 'Entregar peças');
insert into Departamento values (4, 'Mecânica', 'Realizar manutenção em veículos');
insert into Departamento values (5, 'Administração', 'Gestão da Empresa');


create table Funcionario (
cod_func integer not null primary key,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_sex integer not null,
cod_dep integer not null,
cod_end integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_dep) references Departamento (cod_dep),
foreign key (cod_end) references Endereco (cod_end)
);

insert into funcionario values (1, 'João Batista', '123.544.311-99', '22222 sesdec', '1988-10-30', 5000.00, '', '69 84111155', 'Gerente', 1, 5, 3);
insert into funcionario values (2, 'Marcos Garcia Souza', '565.888.988-88', '64444 sesdec', '1965-1-20', 45000.00, '', '', 'Vendedor', 1, 1, 8);
insert into funcionario values (3, 'Leticia de Jesus', '998.999.789-55', '46666 sesdec', '1990-05-23', 1500.00, '11 454546511', '', 'Vendedora', 2, 1, 10);
insert into funcionario values (4, 'Mateus Solano ', '522.222.232-08', '65655 spp', '1990-11-30', 900.00, '69 8855 5544', '69 5555 4444', 'Mecanico', 1, 4, 4);
insert into funcionario values (5, 'Roger da Silva', '123.589.978-77', null, '1987-11-11', 1100.00, null, '69 9988 7788', 'Mecanico', 1, 4, 11);
insert into funcionario values (6, 'Karina Quadros', '987.987.788-88', null, '1985-11-22', 1000.50, null, '69 8888 7777', 'Caixa', 2, 2, 1);
insert into funcionario values (7, 'Isaias Queiroz', '123.121.321-88', '87788 sesdec', '1980-11-30', 2000.00, null, '69 8877 88881', 'Entregador', 1, 3, 7);


create table Fornecedor (
cod_forn integer not null primary key,
razãosocial_forn varchar (200),
nomefantasial_forn varchar (100),
representante_forn varchar (100),
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);


insert into Fornecedor values (1, 'GM Motors LTDA', 'Chevrolet GM', 'Tony', 5);
insert into Fornecedor values (2, 'Fiat LTDA', 'Fiat', 'Fabio', 1);
insert into Fornecedor values (3, 'Toyota LTDA', 'Toyota', 'Marcos', 2);
insert into Fornecedor values (4, 'Volkswagen LTDA', 'Volkswagem', 'Nilson', 3);
insert into Fornecedor values (5, 'Hunday LTDA', 'Hynday', 'Marcos', 3);
insert into Fornecedor values (6, 'Eletrobrás Brasil', 'Ceron', 'Governo', 10);
insert into Fornecedor values (7, 'Companhia de Agua e Esgoto de Rondonia', 'Caerd', 'Maria', 11);


create table Produto (
cod_prod int primary key not null,
descrição_prod varchar (50) not null,
marca_prod varchar (50),
quant_prod int,
valor_prod double,
tamanho_prod varchar (50),
tipo_prod varchar (50)
);


insert into produto values (1, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (2, 'Peneus', 'Pirelli', 0, 0, 'Médio', 'Borracha');
insert into produto values (3, 'Pistão', 'volkswagen', 0, 0, 'Pequeno', 'Metal');
insert into produto values (4, 'Porta', 'Ford', 0, 0, 'Médio', 'Metal');
insert into produto values (5, 'Capô', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (6, 'Volante', 'Chevrolet', 0, 0, 'Médio', 'Metal');
insert into produto values (7, 'Volante', 'Chevrolet', 0, 0, 'Médio', 'Hidráulico');
insert into produto values (8, 'Para-choque', 'Chevrolet', 0, 0, 'Médio', 'Hidráulico');
insert into produto values (9, 'Peças do motor', 'Chevrolet', 0, 0, 'Médio', 'Metal');
insert into produto values (10, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (11, 'Porta', 'volkswagen', 0, 0, 'Médio', 'Metal');
insert into produto values (12, 'Escape', 'volkswagen', 0, 0, 'Médio', 'Metal');
insert into produto values (13, 'Peças do motor', 'FIAT', 0, 0, 'Médio', 'Metal');
insert into produto values (14, 'Para-choque', 'Toyota', 0, 0, 'Médio', 'Metal');
insert into produto values (15, 'Peças do motor', 'hyundai', 0, 0, 'Médio', 'Metal');
insert into produto values (16, 'Escape', 'Toyota', 0, 0, 'Médio', 'Metal');
insert into produto values (17, 'Para-choque', 'Honda', 0, 0, 'Médio', 'Metal');
insert into produto values (18, 'Porta', 'Honda', 0, 0, 'Médio', 'Metal');
insert into produto values (19, 'Peças do motor', 'hyundai', 0, 0, 'Médio', 'Metal');
insert into produto values (20, 'Escape', 'hyundai', 0, 0, 'Médio', 'Metal');


create table Servico (
cod_serv int not null primary key,
descricao_serv varchar(300),
tipo_serv varchar (100),
valor_serv float not null,
tempo_serv time
);

insert into servico values (1, 'Consertar o parachoque', 'Conserto', 75.99, '00:15:00');
insert into servico values (2, 'Rebaixar o carro', 'Estética', 121.50, '01:10:00');
insert into servico values (3, 'Envelopar com preto fosco', 'Pintura', 100.00, '02:06:00');
insert into servico values (4, 'Trocar o volante', 'Conserto', 49.99, '00:10:00');
insert into servico values (5, 'Colocar capa de couro', 'Estética', 49.99, '00:26:00');
insert into servico values (6, 'Trocar o pneu traseiro', 'Conserto', 30.80, '00:07:00');
insert into servico values (7, 'Colocar um jogo de rodas novas', 'Conserto',55.00, '00:59:00');
insert into servico values (8, 'Trocar a pintura por azul marinho', 'Pintura', 500.50, '01:03:00');
insert into servico values (9, 'Trocar as molas', 'Conserto', 299.90, '00:47:00');
insert into servico values (10, 'Consertar a porta traseira esquerda', 'Conserto', 350.00, '00:22:00'); 


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
insert into Itens_Compra values (4, 2, 6.55, 4, 1);
insert into Itens_Compra values (5, 10, 10.00, 5, 1);

insert into Itens_Compra values (6, 5, 5.00, 6, 2);
insert into Itens_Compra values (7, 20, 20.50, 7, 2);
insert into Itens_Compra values (8, 15, 18.90, 8, 2);
insert into Itens_Compra values (9, 5, 30.60, 9, 2);
insert into Itens_Compra values (10, 30, 7.99, 10, 2);

insert into Itens_Compra values (11, 10, 12.90, 11, 3);
insert into Itens_Compra values (12, 20, 18.90, 12, 3);
insert into Itens_Compra values (13, 5, 120.00, 13, 3);
insert into Itens_Compra values (14, 2, 220.80, 14, 3);
insert into Itens_Compra values (15, 8, 127.70, 15, 3);

insert into Itens_Compra values (16, 10, 11.80, 16, 4);
insert into Itens_Compra values (17, 5, 124.90, 17, 4);
insert into Itens_Compra values (18, 22, 12.90, 18, 4);
insert into Itens_Compra values (19, 15, 34.80, 19, 4);
insert into Itens_Compra values (20, 12, 48.00, 20, 4);


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
insert into Itens_Venda values (3, 1, 0, 5, 1);
insert into Itens_Venda values (4, 3, 0, 4, 1);

insert into Itens_Venda values (5, 1, 0, 10, 2);
insert into Itens_Venda values (6, 4, 0, 4, 2);
insert into Itens_Venda values (7, 3, 0, 7, 2);
insert into Itens_Venda values (8, 9, 0, 1, 2);

insert into Itens_Venda values (9, 10, 0, 9, 3);
insert into Itens_Venda values (10, 2, 0, 2, 3);
insert into Itens_Venda values (11, 3, 0, 8, 3);
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

insert into Pagamentos values (1, curdate(), 0, 'Dinheiro', 1, null, 1, 6);
insert into Pagamentos values (2, curdate(), 0, 'Dinheiro', 1, 1, null, 6);
insert into Pagamentos values (3, curdate(), 0, 'Débito Conta', 2, 2, null, 6);








####################exemplos####################
drop trigger if exists baixar_estoque;
delimiter $$ 
CREATE TRIGGER baixar_estoque AFTER INSERT ON itens_venda FOR EACH ROW
BEGIN 
UPDATE produto
SET quant_prod = quant_prod - NEW.quant_itensvend 
WHERE cod_prod = NEW.cod_prod;
END;
$$ delimiter ;


drop trigger if exists CancelarBaixaEstoque;
delimiter $$ 
CREATE TRIGGER CancelarBaixaEstoque AFTER DELETE ON itens_venda FOR EACH ROW
BEGIN 
UPDATE produto
SET quant_prod = quant_prod + OLD.quant_itensvend 
WHERE cod_prod = OLD.cod_prod;
END;
$$ delimiter ;

####################exercicios####################
/*
Crie uma trigger para positivar o estoque do
produto após ele ser incluído em itens da
compra

Crie uma trigger para cancelar a positivação
caso o item seja removido de itens da compra

Refaça a trigger baixarEstoque adicionando
uma verificação no estoque do produto que
será inserido, caso tenho o estoque, execute o
insert e de uma mensagem de confirmação,
caso não tenho o estoque, não permita o insert
e avise o usuario
*/

#####1
delimiter $$ 
CREATE TRIGGER PositivarProduto AFTER INSERT ON itens_compra FOR EACH ROW
BEGIN 
UPDATE produto
SET quant_prod = quant_prod + NEW.quant_itenscomp 
WHERE cod_prod = NEW.cod_prod;
END;
$$ delimiter ;

#####2
delimiter $$ 
CREATE TRIGGER baixar_estoque AFTER DELETE ON itens_compra FOR EACH ROW
BEGIN 
UPDATE produto
SET quant_prod = quant_prod - OLD.quant_itenscomp 
WHERE cod_prod = OLD.cod_prod;
END;
$$ delimiter ;

####3
drop trigger if exists baixar_estoque;


/*
Refaça a trigger baixarEstoque adicionando
uma verificação no estoque do produto que
será inserido, caso tenho o estoque, execute o
insert e de uma mensagem de confirmação,
caso não tenho o estoque, não permita o insert
e avise o usuario
*/


DELIMITER |
CREATE TRIGGER baixarEstoque AFTER INSERT ON itens_venda FOR EACH ROW
BEGIN

declare qtd integer;
declare cprod integer;
declare msg varchar(255);

select cod_prod into cprod from itens_venda  where NEW.cod_itensvend = NEW.cod_itensvend;
select quant_prod into qtd from produto where cod_prod = cprod;

if (NEW.quant_itensvend >= qtd) then
UPDATE produto SET quant_prod = quant_prod - NEW.quant_itensvend WHERE cod_prod = NEW.cod_prod;
ELSE

SET msg = 'Não foi possível dar baixa no estoque';

SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;
END;
| DELIMITER ;



