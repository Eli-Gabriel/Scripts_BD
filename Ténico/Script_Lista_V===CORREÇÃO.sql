create database bd_Eucatur;
use bd_Eucatur;


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



create table Departamento (
cod_dep integer not null primary key,
nome_dep varchar (100),
descrição_dep varchar (300)
);

insert into Departamento values (1, 'Vendas', 'Venda de passagens');
insert into Departamento values (2, 'Financeiro', 'Controle Financeiro e Caixa');
insert into Departamento values (3, 'Marketing', 'Promoter');
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




create table onibus (
cod_oni integer not null primary key,
modelo_oni varchar (100) not null,
marca_oni varchar (100),
placa_oni varchar (50),
tipo_oni varchar (100)
);

insert into onibus values (1, 'Amazon Bus', 'Mercedes', 'NDD 2511', 'Executivo');
insert into onibus values (2, 'Amazon Bus', 'Mercedes', 'NDD 9898', 'Imigrante');


create table Poltrona(
cod_pol integer not null primary key auto_increment,
número_pol integer not null,
situação_pol varchar (100) not null,
cod_oni integer not null,
foreign key (cod_oni) references Onibus (cod_oni)
);

insert into poltrona values (null, 1, 'livre',  1);
insert into poltrona values (null, 2, 'livre',  1);
insert into poltrona values (null, 3, 'livre',  1);
insert into poltrona values (null, 4, 'livre',  1);
insert into poltrona values (null, 5, 'livre',  1);
insert into poltrona values (null, 6, 'livre',  1);
insert into poltrona values (null, 7, 'livre',  1);
insert into poltrona values (null, 8, 'livre',  1);
insert into poltrona values (null, 9, 'livre',  1);
insert into poltrona values (null, 10, 'livre',  1);
insert into poltrona values (null, 11, 'livre',  1);
insert into poltrona values (null, 12, 'livre',  1);
insert into poltrona values (null, 13, 'livre',  1);
insert into poltrona values (null, 14, 'livre',  1);
insert into poltrona values (null, 15, 'livre',  1);

insert into poltrona values (null, 1, 'livre',  2);
insert into poltrona values (null, 2, 'livre',  2);
insert into poltrona values (null, 3, 'livre',  2);
insert into poltrona values (null, 4, 'livre',  2);
insert into poltrona values (null, 5, 'livre',  2);
insert into poltrona values (null, 6, 'livre',  2);
insert into poltrona values (null, 7, 'livre',  2);
insert into poltrona values (null, 8, 'livre',  2);
insert into poltrona values (null, 9, 'livre',  2);
insert into poltrona values (null, 10, 'livre', 2);
insert into poltrona values (null, 11, 'livre', 2);
insert into poltrona values (null, 12, 'livre', 2);
insert into poltrona values (null, 13, 'livre', 2);
insert into poltrona values (null, 14, 'livre', 2);
insert into poltrona values (null, 15, 'livre', 2);


create table Trecho (
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

insert into trecho values (null,  '2017-09-01', '2017-09-01', '08:00', '16:00', 365, 0.35, 1, 2, 1);
insert into trecho values (null,  '2017-09-01', '2017-09-01', '13:00', '18:00', 200, 0.35, 1, 4, 2);


create table Passagem (
cod_pas integer not null primary key auto_increment,
cod_cli integer not null,
cod_func integer not null,
cod_tre integer not null,
cod_pol integer,
data_pas date,
valor_pas float,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_tre) references Trecho (cod_tre),
foreign key (cod_pol) references Poltrona (cod_pol)
);

insert into passagem values (null, 1, 2, 1, null, '2017-08-11', null);
insert into passagem values (null, 2, 2, 2, null, '2017-08-11', null);


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


/*1. Crie uma view para armazenar uma consulta que busque todas informação de uma passagem, 
entre elas o nome do passageiro, nome do atendente, cidade de partida, cidade de destino, o 
modelo do onibus e a poltrona escolhida. Não esqueça de substituir as chaves estrangeiras por 
uma informação do tipo varchar na consulta.*/

create view ListarInformaçõesPassagem as
select
passagem.cod_pas,
cliente.nome_cli,
funcionario.nome_func,
(select nome_cid from cidade where trecho.cod_cid_origem = cidade.cod_cid) as 'Cidade de Origem',
(select nome_cid from cidade where trecho.cod_cid_destino = cidade.cod_cid) as 'Cidade de Destino',
trecho.data_part_tre,
trecho.data_cheg_tre,
trecho.horário_cheg_tre,
trecho.horário_part_tre,
onibus.modelo_oni,
onibus.tipo_oni,
passagem.cod_pol
from passagem 
inner join cliente on
passagem.cod_cli = cliente.cod_cli
inner join funcionario on
passagem.cod_func = funcionario.cod_func
inner join trecho on
passagem.cod_tre = trecho.cod_tre 
inner join onibus on
trecho.cod_oni = onibus.cod_oni 
inner join poltrona on
onibus.cod_oni = poltrona.cod_oni
where poltrona.cod_pol = passagem.cod_pol;

select * from listarinformaçõespassagem;

 
/*
2. Crie um procedimento para atualizar o valor de uma passagem de acordo com uma porcentagem 
e o trecho definido pelo usuário do sistema.*/

delimiter $$
create procedure atualizarValorTrecho (trecho int, porcentagem float) 
	begin
		if ((trecho <> 0) and (porcentagem <> 0)) then
			if (porcentagem < 20) then
				update trecho set tarifa_tre = tarifa_tre + (tarifa_tre * porcentagem/100) where cod_tre = trecho;
                update passagem set valor_pas = (select (tarifa_tre * distancia_tre) from trecho where cod_tre = trecho) where data_pas > curdate();
                select 'Valor atualizado com sucesso!' as Msg;
				
            else
				select 'Só é permitido reajuste até o limite de 20%! Acima dissoa Gerencia deve ser consultada' as Msg;
			end if;
		
        else
			select 'Digite um valor para atualizar o trecho' as Msg;
		end if;
        end;
        
        
$$ delimiter ;


call AtualizarValorTrecho (1, 10);        

select * from passagem;
select * from trecho;    
 

/*
3. Crie um procedimento para marcar a poltrona do onibus utilizado no trecho como “reservado”, 
de acordo com o código da passagem e o número da poltrona informado pelo usuário. 
Porém, deve ser verificado antes se a poltrona informada pelo usuário está com a situação “livre”, 
se sim marque como “reservada”. Senão, consulte e mostre uma poltrona vazia para o usuario em uma mensagem de retorno.
 Informe o usuário através de uma mensagem de retorno caso a marcação seja realizada ou não realizada. */

delimiter $$
create procedure marcarPoltrona (passagem int, poltrona int)
	begin
		declare onibus int;
		select cod_oni into onibus from onibus where cod_oni = 
		(select cod_oni from trecho inner join passagem on passagem.cod_tre = trecho.cod_tre where cod_pas = passagem);

		if ((passagem <> 0) and (poltrona <> 0)) then
			if (((select situação_pol from poltrona where número_pol = poltrona and cod_oni = onibus) = 'livre')) then
				
                update poltrona set situação_pol = 'ocupado' where número_pol = poltrona and cod_oni = onibus;
                update passagem set cod_pol = 
                (select cod_pol from poltrona where número_pol = poltrona and cod_oni = onibus) where cod_pas = passagem;
			                         
                select concat('A poltrona: ', poltrona, ' foi marcada com sucesso!') as Msg;
				
            else
				select concat('A poltrona: ', poltrona, ' está ocupada! Marque outra por gentileza!') as Msg;
			end if;
		
        else
			select 'Digite um valor para atualizar o trecho' as Msg;
		end if;
        end;
        
        
$$ delimiter ;


call marcarPoltrona (3, 11);



select * from onibus;

select * from poltrona;

select * from passagem;


#Exemplo de utilização de PROCEDIMENTO DENTRO DE OUTRO PROCEDIMENTO - INSERIR PASSAGEM PERSONALIZADO
delimiter $$
create procedure venderPassagem (cliente int, funcionario int, trecho int, poltrona int, datap date)
	begin
		declare passagem int;
		if (cliente <> 0 and funcionario <> 0 and trecho <> 0 and datap <> '') then
			
            insert into passagem (cod_pas, cod_cli, cod_func, cod_tre, data_pas) values (null, cliente, funcionario, trecho, datap);
	        
         
            update passagem set valor_pas = (select (tarifa_tre * distancia_tre) from trecho 
				where cod_tre = trecho) where cod_pas = (SELECT LAST_INSERT_ID());
            
            select 'Passagem vendida com sucesso!' as Msg;
            
            select last_insert_id() into passagem;
            
            #um procedimento sendo chamado dentro de outro procedimento
            call marcarPoltrona (passagem, poltrona);
            
		else
			select 'Os dados do cliente, funcionario, trecho e data são obrigatários!' as Msg;
		end if;
	end;
$$ delimiter ;

call venderPassagem (1, 2, 2, 5, '2017-08-11');






















delimiter $$
CREATE FUNCTION QuantidadePoltronasLivres (onibus int) returns integer 
begin
declare quantidade int;
select count(cod_pol) into quantidade 
from poltrona where situação_pol = 'livre' and cod_oni = onibus;

return quantidade;
end;
$$ delimiter ;


select QuantidadePoltronasLivres(4);





SELECT
trecho.cod_tre as 'Código do Trecho',
cidade.nome_cid as 'Cidade de Destino',
trecho.data_part_tre as 'Data de Partida',
trecho.horário_part_tre as 'Horario de Partida',
onibus.modelo_oni as 'Onibus Previsto',
QuantidadePoltronasLivres(onibus.cod_oni) as
'Poltronas Disponíveis'
FROM
trecho INNER JOIN cidade ON trecho.cod_cid_destino =
cidade.cod_cid
INNER JOIN onibus ON trecho.cod_oni = onibus.cod_oni;











            