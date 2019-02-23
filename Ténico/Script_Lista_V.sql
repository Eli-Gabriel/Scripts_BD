/*Analise a história de caso de uso a seguir:

“Na rodoviaria de Ji-Paraná um passageiro vai ao guiche da Eucatur comprar uma passagem. 
Chegando ao guiche, o passageiro solicita ao atendente uma passagem para Porto Velho. 
O atendente acessa o sistema para consultar as informações sobre trecho solicitado, qual o onibus previsto para o trecho e o local de assento do passageiro no onibus do trecho. 
Após o acesso as informações o atendente pergunta ao passageiro qual a melhor poltrona para o mesmo, e após o passageiro escolher a poltrona 20, 
	o atendente gera uma passagem no sistema, informando o valor de 98 reais a ser pago pelo passageiro. 
Por fim, o atendente pergunta a forma de pagamento e o passageiro responde dinheiro. 
Após isso o atendente recebe o valor da passagem e informa o recebimento da passagem ao sistema, que imprime a passagem a ser entregue ao passageiro. 
O passageiro pega sua passagem e embarca no ônibus.”

A partir dessa história modele um Diagrama ER para o sistema da história.

1. Crie uma view para armazenar uma consulta que busque todas informação de uma passagem, entre elas o nome do passageiro, nome do atendente, cidade de partida, cidade de destino, 
	o modelo do onibus e a poltrona escolhida. Não esqueça de substituir as chaves estrangeiras por uma informação do tipo varchar na consulta.

2. Crie um procedimento para atualizar o valor de uma passagem de acordo com uma porcentagem e o trecho definido pelo usuário do sistema.

3. Crie um procedimento para marcar a poltrona do onibus utilizado no trecho como “reservado”, de acordo com o código da passagem e o número da poltrona informado pelo usuário. 
Porém, deve ser verificado antes se a poltrona informada pelo usuário está com a situação “livre”, se sim marque como “reservada”. Senão, consulte e mostre uma poltrona vazia 
	para o usuario em uma mensagem de retorno. Informe o usuário através de uma mensagem de retorno caso a marcação seja realizada ou não realizada. 

Observações:
- A ordem das informações solicitadas em cada questão deve ser mantida no resultado da consulta.
- Envie o script para execução única, ou seja, organize a ordem de execução das instruções.
- Identifique cada questão no script, siga o exemplo: #Questao01 
- Pule 01 linha entre cada exercício.
- O banco de dados com todos os inserts deve estar incluso no mesmo script, no inicio dele e os seus exercícios no final do script.
- Deverá ser entregue além do script, o arquivo no MySQL Workbench com o Diagrama ER devidamente modelado. 
Você poderá utilizar engenharia reversa do seu script para o modelo, 
mas não do modelo para o script.
Peso: 20 pontos
*/


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
cod_cid_Origem int,
cod_cid_Destino int,
cod_oni int,
cod_func int,
foreign key (cod_cid_Origem) references cidade (cod_cid),
foreign key (cod_cid_Destino) references cidade (cod_cid),
foreign key (cod_oni) references onibus (cod_oni),
foreign key (cod_func) references funcionario (cod_func)
);

insert into trecho values (1, 'Ji-Parana X PortoVelho', 98, 1, 2, 1, 2);
insert into trecho values (2, 'Jaru X Vilhena', 94, 5, 3, 9, 2);
insert into trecho values (3, 'Guajará-Mirim X Pimenta Bueno', 65, 6, 9, 6, 2);
insert into trecho values (4, 'Ouro Preto do Oeste X Porto Velho', 65, 8, 2, 5, 2);
insert into trecho values (5, 'Jaru X Guajara-Mirim', 38, 5, 6, 2, 2);
insert into trecho values (6, 'Jaru X Pimenta Bueno', 95, 5, 9, 4, 2);
insert into trecho values (7, 'Vilhena X Ji-Parana', 65, 3, 1, 7, 2);
insert into trecho values (8, 'Colorado do Oeste X Guajara-Mirim',84, 7, 6, 3, 2);
insert into trecho values (9, 'Pimenta Bueno X Colorado do Oeste', 68, 9, 7, 8, 2);



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
cod_func integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_desp) references Despesas (cod_desp),
foreign key (cod_func) references Funcionario (cod_func)
);

insert into Pagamentos values (1, curdate(), 0, 'Dinheiro', 1, 1, 3);
insert into Pagamentos values (2, curdate(), 0, 'Dinheiro', 1, 1, 3);
insert into Pagamentos values (3, curdate(), 0, 'Débito Conta', 2, 2, 3);







#====================QUESTÕES====================
#==========QUESTÃO_1==========
/*
procedures para buscar o nome das cidades de acordo com o trecho.

drop procedure if exists mostra_nome_cidadeOrigem_trecho;
DELIMITER $$
CREATE PROCEDURE mostra_nome_cidadeOrigem_trecho (cod int, out cidadeOrigem varchar(50))
BEGIN
select cidade.nome_cid into cidadeOrigem
from cidade 
inner join trecho 
on cidade.cod_cid = trecho.cod_cid_Origem
where trecho.cod_trec = cod;
END;
$$ DELIMITER ;


drop procedure if exists mostra_nome_cidadeDestino_trecho;
DELIMITER $$
CREATE PROCEDURE mostra_nome_cidadeDestino_trecho (cod int, out cidadeDestino varchar(50))
BEGIN
select cidade.nome_cid into cidadeDestino
from cidade
inner join trecho 
on cidade.cod_cid = trecho.cod_cid_Destino
where trecho.cod_trec = cod;
END;
$$ DELIMITER ;


drop procedure if exists mostra_nome_cidades_trecho;
DELIMITER $$
CREATE PROCEDURE mostra_nome_cidades_trecho (cod int, out cidadeOrigem varchar(50),out cidadeDestino varchar(50))
BEGIN
call mostra_nome_cidadeOrigem_trecho(cod, @a);
call mostra_nome_cidadeDestino_trecho(cod, @b);
select @a, @b into cidadeOrigem, cidadeDestino;
END;
$$ DELIMITER ;

#call mostra_nome_cidades_trecho(5, @a, @b);
#select @a as 'Origem', @b as 'Destino';

1. Crie uma view para armazenar uma consulta que busque todas informação de uma passagem, 
	entre elas o nome do passageiro, nome do atendente, cidade de partida, cidade de destino, o modelo do onibus e a poltrona escolhida. 
	Não esqueça de substituir as chaves estrangeiras por uma informação do tipo varchar na consulta.
*/

drop view if exists info_passagem;
create view Info_passagem as
select 
passagem.cod_pas, # as 'Código da passagem', 
passagem.data_pas as 'Data de emissão', 
passagem.valortotal_pas as 'ValorTotal', 
passagem.desconto_pas as 'Desconto', 
passagem.formpag_pas as 'Forma de pagamento', 
cliente.nome_cli as 'Nome do cliente', 
funcionario.nome_func as 'Nome do funcionario', 
(select cidade.nome_cid from cidade where cidade.cod_cid = trecho.cod_cid_Origem) as 'Cidade de Origem',
(select cidade.nome_cid from cidade where cidade.cod_cid = trecho.cod_cid_Destino) as 'Cidade de Destino', 
onibus.modelo_oni as 'Modelo do onibus', 
poltrona.num_polt as 'Número da poltrona'
from passagem 
left join cliente on cliente.cod_cli = passagem.cod_cli
left join funcionario on passagem.cod_func = funcionario.cod_func
left join trecho on funcionario.cod_func = trecho.cod_func
inner join onibus on trecho.cod_oni = onibus.cod_oni
inner join poltrona on onibus.cod_oni = poltrona.cod_oni;


select * from info_passagem group by cod_pas;


#==========QUESTÃO_2==========
/*
2. Crie um procedimento para atualizar o valor de uma passagem de acordo com uma porcentagem e o trecho definido pelo usuário do sistema.
*/
DELIMITER $$
CREATE PROCEDURE Atualizar_Valor_Passagem (id int, desco double, trechoID int)
BEGIN
update passagem
set valortotal_pas = (valortotal_pas * (1 + desco)) + 
(select trecho.preco from trecho where trecho.cod_trec = trechoID)
where passagem.cod_pas = id;
END;
$$ DELIMITER ;

call Atualizar_Valor_Passagem(1, 2, 5);

#==========QUESTÃO_3==========
/*
3. Crie um procedimento para marcar a poltrona do onibus utilizado no trecho como “reservado”, de acordo com o código da passagem e o número da poltrona informado pelo usuário. 

Porém, deve ser verificado antes se a poltrona informada pelo usuário está com a situação “livre”, se sim marque como “reservada”. 

Senão, consulte e mostre uma poltrona vazia para o usuario em uma mensagem de retorno. 

Informe o usuário através de uma mensagem de retorno caso a marcação seja realizada ou não realizada. 
*/

#######ERRO#######

/*
drop procedure if exists Efetuar_Reserva;
DELIMITER $$
CREATE PROCEDURE Efetuar_Reserva (cod_pass int, num int)
BEGIN
declare polt boolean;
declare polt2 int;

select poltrona.ocup_polt, poltrona.num_polt into polt, polt2
from poltrona 
inner join onibus on poltrona.cod_oni = onibus.cod_oni
inner join passagem on onibus.cod_oni = passagem.cod_oni
where passagem.cod_pas = cod_pass;
if (polt = false) then
	update poltrona
	set ocup_polt = true
	where num_polt = num
    and (select poltrona.ocup_polt 
		from poltrona 
		inner join onibus on poltrona.cod_oni = onibus.cod_oni
		inner join passagem on onibus.ano_oni = passagem.cod_oni
		where passagem.cod_pas = cod_pass);
	
    select concat('Reserva efetuada com sucesso!') as Msg;
else 
    select concat('Essa poltrona não esta disponível!') as Msg;
end if;
END;
$$ DELIMITER ;

call Efetuar_Reserva (1, 2);

*/