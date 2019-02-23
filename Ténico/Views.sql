create database banco;
use banco;

create table endereço (
cod_end int primary key not null,
rua_end varchar(300),
bairro_end varchar(100),
cidade_end varchar(100),
estado_end varchar(100)
);

create table cliente (
cod_cli int primary key not null,
nome_cli varchar(200) not null,
estadocivil_cli varchar(50),
cpf_cli varchar(20),
rg_cli varchar(30),
sexo_cli varchar(30),
datanasc_cli date,
randafamiliar_cli double,
telefone_cli varchar(50) not null,
celular_cli varchar(50) not null,
cod_end int not null,
foreign key (cod_end) references endereço (cod_end)
);

create table funcionario (
cod_func int primary key not null,
nome_func varchar(200) not null,
cpf_func varchar(20) not null,
rg_func varchar(30),
sexo_func varchar(30),
datanasc_func date,
salario_func double,
telefone_cli varchar(50) not null,
celular_cli varchar(50) not null,
função_func varchar(50) not null,
cod_end int not null,
foreign key (cod_end) references endereço (cod_end)
);

create table hospedagem (
cod_hosp int primary key not null,
dataCheckin_hosp date,
dataCheckout_hosp date,
valorConsumo_hosp float,
valorDiárias_hosp float,
valorTotal_hosp float,
cod_cli int not null,
foreign key (cod_cli) references cliente (cod_cli),
cod_func int not null,
foreign key (cod_func) references funcionario (cod_func)
);

create table produto (
cod_prod int primary key not null,
descrição_prod varchar(200) not null,
quantidade_prod int,
valor_prod float,
dataValidade_prod date
);

create table quarto (
cod_qua int primary key not null,
descrição_qua varchar(200) not null,
número_qua int not null,
tipo_qua varchar(100) not null,
valor_qua float
);

create table produtos_hospedagem (
cod_ph int primary key not null,
cod_hosp int not null,
cod_prod int not null,
foreign key (cod_hosp) references hospedagem (cod_hosp),
foreign key (cod_prod) references produto (cod_prod),
quant_ph int,
valorProd_ph float
);

create table produtos_quarto (
cod_pq int primary key not null,
quant_pq int,
dataRecarga_pq date,
cod_qua int not null,
cod_prod int not null,
foreign key (cod_qua) references quarto (cod_qua),
foreign key (cod_prod) references produto (cod_prod)
);

create table quarto_hospedagem (
cod_qh int primary key not null,
cod_hosp int not null,
cod_qua int not null,
foreign key (cod_hosp) references hospedagem (cod_hosp),
foreign key (cod_qua) references quarto (cod_qua),
quantDiárias_qh int,
valorQuartos_qh float
);

create table fornecedor(
cod_forn int primary key not null,
nomef_forn varchar(200) not null,
cnpj_forn varchar(200) not null,
ende_forn varchar(100),
tel_forn varchar(20) not null
);

create table compra (
cod_comp int primary key not null,
datacompra_comp date not null,
valor_comp float not null,
cod_func int not null,
foreign key (cod_func) references funcionario (cod_func),
cod_forn int not null,
foreign key (cod_forn) references fornecedor (cod_forn)
);

create table compra_produto(
cod_cp int primary key not null,
quantidade_cp int not null,
valor_cp float not null,
cod_prod int not null,
foreign key (cod_prod) references produto (cod_prod),
cod_comp int not null,
foreign key (cod_comp) references compra (cod_comp)
);

create table caixa (
cod_caixa int primary key not null,
dataAbertura_caixa date not null,
dataFechamento_caixa date not null,
valorInicial float not null,
valorFinal float not null,
cod_func int not null,
foreign key (cod_func) references funcionario (cod_func)
);

create table despesa (
cod_desp int primary key not null,
dataVencimento date not null,
valor_Desp float not null,
cod_forn int not null,
foreign key (cod_forn) references fornecedor (cod_forn)
);

create table pagamento (
cod_pag int primary key not null,
data_pag date not null,
valor_pag float not null,
tipo_pag enum ('À vista', 'Parcelado'),
cod_desp int not null,
foreign key (cod_desp) references despesa (cod_desp),
cod_caixa int not null,
foreign key (cod_caixa) references caixa (cod_caixa),
cod_comp int not null,
foreign key (cod_comp) references compra (cod_comp)
);
create table recebimento (
cod_receb int primary key not null,
data_receb date not null,
valor_receb float not null,
tipo_receb enum ('À vista', 'Parcelado'),
cod_hosp int not null,
foreign key (cod_hosp) references hospedagem (cod_hosp),
cod_caixa int not null,
foreign key (cod_caixa) references caixa (cod_caixa)
);

insert into endereço values (1, 'Rua A12', 'Azulejo', 'Ji-Paraná', 'Rondônia'),
(2, 'Rua Almir Alcantara', 'Casa Preta', 'Ji-Paraná', 'Rondônia'),
(3, 'Monte Negro', 'Rio Verde', 'Ji-Paraná', 'Rondônia'),
(4, 'Belo Monte', 'Adrade Mecenas', 'Ji-Paraná', 'Rondônia'),
(5, 'Jardins Belos', '3 corações', 'Ji-Paraná', 'Rondônia');

insert into produto values (1, 'Refrigerante Coca-Cola 350ml', 20, 4.50, '2017/08-19'),
(2, 'Refrigerante Sprite 350ml', 13, 4.50, '2017/08-19'),
(3, 'Refrigerante Fanta 350ml', 9, 4.50, '2017/08-19'),
(4, 'Salgado Yokitos', 3, 2.50, '2017/06-12'),
(5, 'Chocolate Diamante Negro', 15, 4.00, '2017/05-19'),
(6, 'Heineken Long Neck', 12, 5.70, '2017/08-21'),
(7, 'Amendoim sabor pimenta', 9, 4.50, '2017/05/12'),
(8, 'Amendoim sabor natural', 6, 4.50, '2017/05/12'),
(9, 'Itaipava Long Neck', 20, 5.20, '2017/08-21'),
(10, 'Chocolate Lacta', 20, 3.25, '2017/11-15');

insert into quarto values (1, 'Casal', 11, 'Normal', 89.00),
(2, 'Casal', 12, 'Executivo', 180.00),
(3, 'Casal', 21, 'Normal', 89.00),
(4, 'Casal', 22, 'Executivo', 180.00),
(5, 'Casal', 31, 'Executivo', 180.00),
(6, 'Casal', 32, 'Luxo', 275.00),
(7, 'Casal', 41, 'Normal', 89.00),
(8, 'Casal', 42, 'Normal', 89.00),
(9, 'Casal', 51, 'Executivo', 180.00),
(10, 'Casal', 52, 'Luxo', 275.00);

create view hospede as
select cliente.nome_cli, hospedagem.dataCheckin_hosp, hospedagem.dataCheckout_hosp
from cliente left join hospedagem on cliente.cod_cli = hospedagem.cod_cli;

create view consumo as
select produto.descrição_prod from produto 
left join produtos_hospedagem on produto.cod_prod = produtos_hospedagem.cod_prod 
left join hospedagem on hospedagem.cod_hosp = produtos_hospedagem.cod_hosp;

create view hospedado as
select quarto.cod_qua, quarto.descrição_qua, cliente.nome_cli from cliente 
left join hospedagem on cliente.cod_cli = hospedagem.cod_cli 
left join quarto_hospedagem on quarto_hospedagem.cod_hosp = hospedagem.cod_hosp 
left join quarto on quarto.cod_qua = quarto_hospedagem.cod_qua order by cliente.nome_cli;

create view aluguel as
select (select count(cod_qh) from quarto_hospedagem where quarto_hospedagem.cod_hosp = hospedagem.cod_hosp) from quarto_hospedagem left join hospedagem on quarto_hospedagem.cod_hosp = hospedagem.cod_hosp;

create view estoque as
select descrição_prod, quantidade_prod from produto;

create view historicoh_hospede as
select cliente.nome_cli, hospedagem.cod_hosp, hospedagem.dataCheckin_hosp, hospedagem.dataCheckout_hosp 
from cliente left join hospedagem on cliente.cod_cli = hospedagem.cod_cli;

create view historicoh_fun as
select funcionario.nome_func, hospedagem.cod_hosp, hospedagem.dataCheckin_hosp, hospedagem.dataCheckout_hosp 
from funcionario left join hospedagem on funcionario.cod_func = hospedagem.cod_func;
