drop database if exists rodoviaria;
create database rodoviaria;
use rodoviaria;



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
celular_cli varchar (50) not null
);

insert into cliente values (1, 'Jackson Henrique da Silva Bezerra', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 
10000.00, '69 84085712', '69 84111111');
insert into cliente values (2, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 
456454.45, '', '');
insert into cliente values (3, 'Capitão América', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 
0.00, '11 454546511', '');
insert into cliente values (4, 'José Pereira da Silva', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 
900.00, '69 88998899', '69 4444 4444');
insert into cliente values (5, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 
3000.00, '69 3421 5511', '69 99111111');
insert into cliente values (6, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 
5450.00, '69 3421 1122', '69 9999 7788');
insert into cliente values (7, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 
6845.00, '69 84085712', '69 84111111');
insert into cliente values (8, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 
4199.00, '69 3421 2211', '69 84118811');
insert into cliente values (9, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 
3250.00, '69 3421 9999', '69 84118811');
insert into cliente values (10, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 
9600.00, '69 3421 1123', '69 84118811');



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
função_func varchar (50) not null
);

insert into funcionario values (1, 'João Eujacio Teixeira', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 
5000.00, '', '69 84111155', 'Atendente');
insert into funcionario values (2, 'Paula Fernandes', '565.888.988-88', '64444 sesdec', 'Feminino', '1965-1-20', 
45000.00, '', '', 'Motorista');
insert into funcionario values (3, 'Roberto Carlos', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 
1500.00, '11 454546511', '', 'Gerente');



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



create table onibus(
cod_oni int not null primary key auto_increment,
modelo_oni varchar (50) not null,
placa_oni varchar (20) not null,
chassi_oni varchar (50),
ano_oni date
);

insert into onibus values (1, 'Padrao', 'Bilada', '3513', curdate());
insert into onibus values (2, '2 andares', 'Hari Pota', 'rg9hn', curdate());
insert into onibus values (3, 'Duplo', 'BC', '6th4n', curdate());
insert into onibus values (4, 'Triplo', 'Null', 'rt6hn1', curdate());
insert into onibus values (5, 'Executivo com ar-condicionado', 'Luxo', '65g1h5n3', curdate());
insert into onibus values (6, 'Normal sem ar-condicionado', 'Lixo', 'rg6', curdate());
insert into onibus values (7, 'Normal com ar-condicionado', 'Padrão', 'ghn6415', curdate());
insert into onibus values (8, 'Premium', '$$$Caro$$$', 'g64', curdate());
insert into onibus values (9, 'Ralé B', 'Povão', '6g15', curdate());



create table poltrona(
cod_polt int not null primary key auto_increment,
num_polt varchar(2),
ocup_polt bool,
cod_oni int,

foreign key (cod_oni) references onibus (cod_oni)
);

insert into poltrona values (1, '1', true, 3);
insert into poltrona values (2, '2',  false, 3);
insert into poltrona values (3, '3',  false, 3);
insert into poltrona values (4, '4',  true, 3);
insert into poltrona values (5, '5',  false, 3);
insert into poltrona values (6, '6',  true, 3);
insert into poltrona values (7, '7',  true, 3);
insert into poltrona values (8, '8',  false, 3);
insert into poltrona values (9, '9',  true, 3);
insert into poltrona values (10, '10',  false, 3);

insert into poltrona values (11, '1',  true, 2);
insert into poltrona values (12, '2',  true, 2);
insert into poltrona values (13, '3',  false, 2);
insert into poltrona values (14, '4',  false, 2);
insert into poltrona values (15, '5',  false, 2);
insert into poltrona values (16, '6',  true, 2);
insert into poltrona values (17, '7',  false, 2);
insert into poltrona values (18, '8',  true, 2);
insert into poltrona values (19, '9',  false, 2);
insert into poltrona values (20, '10',  true, 2);

insert into poltrona values (21, '1',  false, 1);
insert into poltrona values (22, '2',  true, 1);
insert into poltrona values (23, '3',  false, 1);
insert into poltrona values (24, '4',  true, 1);
insert into poltrona values (25, '5',  false, 1);
insert into poltrona values (26, '6',  true, 1);
insert into poltrona values (27, '7',  false, 1);
insert into poltrona values (28, '8',  false, 1);
insert into poltrona values (29, '9',  false, 1);
insert into poltrona values (30, '10',  true, 1);



create table trecho (
cod_trec int not null primary key auto_increment,
nome_trec varchar (200) not null,
preco double,
distancia double,
tarifa double,
horarioPartida time,
horarioChegada time,

cod_cid_Origem int,
cod_cid_Destino int,
cod_oni int,
cod_func int,
foreign key (cod_cid_Origem) references cidade (cod_cid),
foreign key (cod_cid_Destino) references cidade (cod_cid),
foreign key (cod_oni) references onibus (cod_oni),
foreign key (cod_func) references funcionario (cod_func)
);

insert into trecho values (1, 'Ji-Parana X PortoVelho', 98, 350, 13, '10:30:00', '22:30:00', 1, 2, 1, 2);
insert into trecho values (2, 'Jaru X Vilhena', 94, 500, 30, '07:45:00', '19:30:00', 5, 3, 9, 2);
insert into trecho values (3, 'Guajará-Mirim X Pimenta Bueno', 65, 350, 80, '09:35:00', '17:20:00', 6, 9, 6, 2);
insert into trecho values (4, 'Ouro Preto do Oeste X Porto Velho', 65, 350, 20, '12:00:00', '22:00:00', 8, 2, 5, 2);
insert into trecho values (5, 'Jaru X Guajara-Mirim', 38, 250, 20, '16:00:00', '23:30:00', 5, 6, 2, 2);
insert into trecho values (6, 'Jaru X Pimenta Bueno', 95, 500, 35, '08:50:00', '09:00:00', 5, 9, 4, 2);
insert into trecho values (7, 'Vilhena X Ji-Parana', 65, 450, 65, '11:30:00', '21:00:00', 3, 1, 7, 2);
insert into trecho values (8, 'Colorado do Oeste X Guajara-Mirim', 84, 503, 30, '06:45:00', '09:35:00', 7, 6, 3, 2);
insert into trecho values (9, 'Pimenta Bueno X Colorado do Oeste', 68, 435, 23, '19:30:00', '23:00:00', 9, 7, 8, 2);



create table Caixa (
cod_caixa integer not null primary key,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double,
cod_func int,

foreign key (cod_func) references Funcionario (cod_func)
);

insert into Caixa values (1, '2017-02-26', null, 100.00, 0, 0, 0, 2);
insert into Caixa values (2, '2017-02-27', null, 100.00, 0, 0, 0, 2);



create table Passagem (
cod_pas integer not null primary key,
data_pas date,
valortotal_pas double not null,
desconto_pas double,
formpag_pas varchar (50),

cod_func integer not null,
cod_cli integer not null,
cod_oni integer not null,
cod_trec integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_oni) references onibus (cod_oni),
foreign key (cod_trec) references trecho (cod_trec)
);

insert into Passagem values (1, '2017-01-25', 0, 0, 'Vista', 2, 1, 1, 8);
insert into Passagem values (2, '2017-02-25', 0, 10.50, 'Vista', 2, 2, 2, 6);
insert into Passagem values (3, '2017-03-25', 0, 0, 'Vista', 3, 8, 3, 3);



create table Recebimentos (
cod_receb integer not null primary key,
data_receb date,
valor_receb double,
cod_caixa integer not null,
cod_pas integer not null,

foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_pas) references Passagem (cod_pas)
);

insert into Recebimentos values (1, curdate(), 0, 1, 1);
insert into Recebimentos values (2, curdate(), 0, 1, 2);
insert into Recebimentos values (3, curdate(), 0, 2, 3);










DELIMITER $$
CREATE PROCEDURE verificar_trecho (cod_treco int)
BEGIN
declare valor int ;
select trecho.cod_trec from trecho where trecho.cod_trec = cod_treco into valor;
update poltrona set ocup_polt = false
;
#where poltrona.cod_oni = 
END;
$$ DELIMITER ;






