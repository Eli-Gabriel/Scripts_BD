drop database if exists gamebook;
create database gamebook;
use gamebook ;
####################TABELAS####################
create table jogador(
idjogador int not null primary key auto_increment,
nome VARCHAR(45),
energia_inicial INT NULL,
energia_atual INT NULL,
habilidade_inicial INT NULL,
habilidade_atual INT NULL,
sorte_inicial INT NULL,
sorte_atual INT NULL,
magia_inicial INT NULL,
pag_atual INT NULL,
ouro int
);

create table itens (
item_id int not null primary key auto_increment,
item_nome varchar(50),
item_desc varchar(100),
id_player int not null,
Foreign Key (id_player) REFERENCES jogador(idjogador)
);

create table magias (
id_magia int not null primary key auto_increment,
magia_nome varchar(50),
magia_desc varchar(750)
);

create table magia_has_jogador(
id int not null primary key auto_increment,
id_player int not null,
id_magia int not null,
Foreign Key (id_player) REFERENCES jogador(idjogador),
Foreign Key (id_magia) REFERENCES magias(id_magia)
);

select * from jogador;
select * from itens;
select * from magias;
select * from magia_has_jogador;


####################INSERTS#########################
INSERT INTO `gamebook`.`jogador` (`nome`, `energia_inicial`, `energia_atual`, `habilidade_inicial`, `habilidade_atual`, `sorte_inicial`, `sorte_atual`, `magia_inicial`) VALUES ('srtg', '52', '52', '15', '15', '89', '89', '99999');
INSERT INTO `gamebook`.`jogador` (`nome`, `energia_inicial`, `energia_atual`, `habilidade_inicial`, `habilidade_atual`, `sorte_inicial`, `sorte_atual`, `magia_inicial`) VALUES ('cxv', '45', '45', '32', '32', '48', '48', '52');

INSERT INTO magias (magia_nome, magia_desc) VALUES ("Cópia de Criatura", "Este encanto permitirá que você faça aparecer uma réplica perfeita de qualquer criatura contra a qual você esteja lutando. A réplica terá os mesmos índices de HABILIDADE e ENERGIA e os mesmos poderes do original. Mas a réplica estará sob seu controle, e você poderá, por exemplo, instruí-la para que ataque a criatura original e ficar assistindo a batalha de camarote!");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Percepção Extra-Sensorial", "Com este encanto, você poderá sintonizar comprimentos de ondas psíquicas. Isso poderá ajudá-lo a ler a mente de uma criatura ou descobrir o que está por trás de uma porta trancada. Porém, às vezes, este encanto pode dar informações equivocadas, se houver mais de uma fonte psíquica perto de uma outra.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Fogo", "Todas as criaturas têm medo do fogo, e este encanto dá o poder de fazer aparecer fogo segundo a sua vontade. Você poderá causar uma pequena explosão no chão que queimará por vários segundos ou criar uma barreira de fogo para manter criaturas à distância.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Ouro dos Tolos", "Este encanto transformará pedra comum em uma pilha do que parece ser ouro. Contudo, o encanto é apenas uma forma de encanto da ilusão - embora mais confiável do que o Encanto da ilusão abaixo - e a pilha de ouro logo voltará a ser pedra.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Ilusão", "Este é um encanto poderoso, mas que não é muito confiável. Através deste encanto, você poderá criar uma ilusão convincente (por exemplo, que você se transformou em serpente, ou que o chão está coberto de carvão em brasa) para enganar uma criatura. O encanto ficará imediatamente sem efeito se acontecer qualquer coisa que desfaça a ilusão (por exemplo, você convence uma criatura que se transformou em uma serpente e então imediatamente atinge sua cabeça com um golpe de espada!). É eficiente sobre tudo com criaturas inteligentes.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Levitação", "Você pode lançar este encanto sobre objetos, adversários ou até sobre você mesmo. Livra quem o recebe dos efeitos da gravidade e assim fará com que tudo que esteja sob a sua influência flutue livremente no ar, sob o seu controle.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Sorte", "Este encanto, juntamente com os encantos de Habilidade e Energia, é especial porque pode ser lançado a qualquer momento durante a sua aventura, a não ser durante uma batalha. Você não precisa esperar que apareça a opção em uma página. Uma vez lançado, recuperará o seu índice de SORTE em metade de seu índice de SORTE Inicial (se a sua SORTE inicial for um número ímpar, subtraia o 1⁄2 de sobra). Este encanto nunca levará o seu índice de SORTE a um número superior a seu nível Inicial Portanto, se você lançar dois encantos da SORTE juntos, o seu índice de SORTE voltará apenas a ser igual a seu nível Inicial.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Escudo", "Ao lançar este encanto, você cria um escudo invisível à sua frente que o protegerá de objetos físicos, por exemplo flechas, espadas ou criaturas. O escudo não tem efeito contra a magia e, evidentemente, se nada fora dele pode tocar em você, você também não poderá tocar em nada fora dele.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Habilidade", "Este encanto restabelecerá o seu índice de HABILIDADE, aumentando-o em metade de seu valor Inicial, e pode ser lançado a qualquer momento durante a sua aventura, a não ser em uma batalha. Para conhecer todas as regras, veja o Encanto da Sorte acima. O Encanto da Habilidade funciona exatamente da mesma maneira.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Energia", "Este encanto recuperará o seu índice de Energia, aumentando-o em metade de seu valor Inicial, e pode ser lançado a qualquer momento durante a sua aventura. Veja o Encanto da Sorte para conhecer as regras completas.");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Força", "Este encanto tem o efeito de aumentar muito a sua força, e é muito útil quando se luta contra criaturas fortes. Porem, deve ser utilizado com cautela, já que é difícil controlar a sua própria força quando ela aumenta demais!");
INSERT INTO magias (magia_nome, magia_desc) VALUES ("Fraqueza", "Criaturas fortes são reduzidas por este encanto a miseráveis fracotes. Não tem efeito contra todas as criaturas, mas, quando tem efeito, a criatura se torna frágil e muito menos perigosa em uma batalha.");

INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '3');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '7');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '7');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '8');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('1', '10');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('2', '4');
INSERT INTO `magia_has_jogador` (`id_player`, `id_magia`) VALUES ('2', '7');

INSERT INTO `gamebook`.`itens` (`item_nome`, `item_desc`, `id_player`) VALUES ('lanterna', 'ilumina', '1');
INSERT INTO `gamebook`.`itens` (`item_nome`, `item_desc`, `id_player`) VALUES ('lanterna', 'illumina', '2');
INSERT INTO `gamebook`.`itens` (`item_nome`, `item_desc`, `id_player`) VALUES ('armadura de couro', 'protege', '1');
INSERT INTO `gamebook`.`itens` (`item_nome`, `item_desc`, `id_player`) VALUES ('armadura de couro', 'protege', '2');

####################PROCEDURES####################
#verifica se o joador tem a magia e a exclui de positivo
DROP PROCEDURE IF EXISTS VerificarMagia;
DELIMITER $$
CREATE PROCEDURE VerificarMagia (id_JOG INT, id_SPEEL INT)
BEGIN

declare contagem INT;

select  count(magia_has_jogador.id_magia) INTO contagem from magia_has_jogador
where magia_has_jogador.id_magia = id_SPEEL AND magia_has_jogador.id_player = id_JOG;

if(contagem >0) then
	delete from magia_has_jogador where magia_has_jogador.id_magia = id_SPEEL AND magia_has_jogador.id_player = id_JOG LIMIT 1;
else select 'Jogador não possui a magia.' as Msg;
end if;

END;
$$ DELIMITER ;

call VerificarMagia(2,4);
select * from magia_has_jogador;

/*
select  jogador.nome, magias.magia_nome, magias.id_magia from jogador 
inner join magia_has_jogador on jogador.idjogador = magia_has_jogador.id_player
inner join magias on magia_has_jogador.id_magia = magias.id_magia;
*/

#####verifica se o joador tem o iten e o exclui de positivo
DROP PROCEDURE IF EXISTS VerificarIten;
DELIMITER $$
CREATE PROCEDURE VerificarIten (in id_JOG INT, in itenDC VARCHAR(45))
BEGIN

declare contagem INT;

select  count(itens.item_nome) INTO contagem from itens
where itens.item_nome = itenDC AND itens.id_player = id_JOG;

if(contagem >0) then
	delete from itens where itens.item_nome = itenDC AND itens.id_player = id_JOG LIMIT 1;
    select 'Excluido com sucesso' as Msg;
else select 'Impossivel excluir' as Msg;
end if;

END;
$$ DELIMITER ;

call VerificarIten(1, 'lanterna');

select * from itens;


####################
DROP PROCEDURE IF EXISTS RestaurarStatus;
DELIMITER $$
CREATE PROCEDURE RestaurarStatus (id_JOG INT)
BEGIN

 update jogador set energia_atual = energia_inicial, habilidade_atual = habilidade_inicial, sorte_atual = sorte_inicial where jogador.idjogador = id_JOG; 

END;
$$ DELIMITER ;

call RestaurarStatus(1);

select  * from jogador where jogador.idjogador = 1;


####################
####################
####################
DROP PROCEDURE IF EXISTS AlterarVitalidade;
DELIMITER $$
CREATE PROCEDURE AlterarVitalidade (id_JOG INT, qtd int)
BEGIN

declare hp_inicial INT;
declare hp INT;

select  jogador.energia_inicial, jogador.energia_atual INTO hp_inicial, hp from jogador
where jogador.idjogador = id_JOG;

if (hp+qtd < hp_inicial ) then
 update jogador set jogador.energia_atual = jogador.energia_atual + qtd;
else update jogador set jogador.energia_atual = jogador.energia_inicial;
end if; 

END;
$$ DELIMITER ;

DROP PROCEDURE IF EXISTS AlterarHabilidade;
DELIMITER $$
CREATE PROCEDURE AlterarHabilidade (id_JOG INT, qtd int)
BEGIN

declare hab_inicial int;
declare hab int;

select  jogador.habilidade_inicial, jogador.habilidade_atual INTO hab_inicial, hab from jogador
where jogador.idjogador = id_JOG;

if (hp+qtd < hab_inicial ) then
 update jogador set jogador.habilidade_atual = jogador.habilidade_atual + qtd;
else update jogador set jogador.habilidade_atual = jogador.habilidade_inicial;
end if; 

END;
$$ DELIMITER ;

DROP PROCEDURE IF EXISTS AlterarSorte;
DELIMITER $$
CREATE PROCEDURE AlterarSorte (id_JOG INT, qtd int)
BEGIN

declare sorte_inicial int;
declare sorte int;

select  jogador.sorte_inicial, jogador.sorte_atual INTO sorte_inicial, sorte from jogador
where jogador.idjogador = id_JOG;

if (sorte+qtd < sorte_inicial ) then
 update jogador set jogador.sorte_atual = jogador.sorte_atual + qtd;
else update jogador set jogador.sorte_atual = jogador.sorte_inicial;
end if; 

END;
$$ DELIMITER ;


DROP PROCEDURE IF EXISTS AlterarPagina;
DELIMITER $$
CREATE PROCEDURE AlterarPagina (id_JOG INT, qtd int)
BEGIN

update jogador set jogador.pag_atual = qtd where jogador.idjogador = id_JOG;

END;
$$ DELIMITER ;

call AlterarPagina(1, 87);
select * from jogador;
####################
####################
####################


####################FUNÇÕES####################
#vertifica a vitalidade do jogador
drop function if exists VerificarHP;
DELIMITER $$
CREATE FUNCTION VerificarHP (cod_jog int)
RETURNS integer
BEGIN

DECLARE hp integer;

select jogador.energia_atual into hp from jogador where jogador.idjogador = cod_jog;

return hp;
END;
$$ DELIMITER ;

select VerificarHP(1);

select * from jogador;

drop function if exists BuscarHabilidade;
DELIMITER $$
CREATE FUNCTION BuscarHabilidade (cod_jog int)
RETURNS integer
BEGIN

DECLARE hb integer;

select jogador.habilidade_atual into hb from jogador where jogador.idjogador = cod_jog;

return hb;
END;
$$ DELIMITER ;

select BuscarHabilidade(1);

select * from jogador;


drop function if exists BuscarSorte;
DELIMITER $$
CREATE FUNCTION BuscarSorte (cod_jog int)
RETURNS integer
BEGIN

DECLARE st integer;

select jogador.sorte_atual into st from jogador where jogador.idjogador = cod_jog;

return st;
END;
$$ DELIMITER ;

select BuscarSorte(1);

select * from jogador;


drop function if exists BuscarPagina;
DELIMITER $$
CREATE FUNCTION BuscarPagina (cod_jog int)
RETURNS integer
BEGIN

DECLARE pg integer;

select jogador.pag_atual into pg from jogador where jogador.idjogador = cod_jog;

return pg;
END;
$$ DELIMITER ;

select BuscarPagina(1);

select * from jogador;



drop function if exists BuscarNome;
DELIMITER $$
CREATE FUNCTION BuscarNome (cod_jog int)
RETURNS VARCHAR(45)
BEGIN

DECLARE nm VARCHAR(45);

select jogador.nome into nm from jogador where jogador.idjogador = cod_jog;

return nm;
END;
$$ DELIMITER ;

select BuscarNome(1);

select * from jogador;
####################
#verifica se o jogador possui tal iten
drop function if exists VerificarIten;
DELIMITER $$
CREATE FUNCTION VerificarIten (cod_jog int, itenDC varchar(50))
RETURNS boolean
BEGIN
declare verifica boolean;
declare contagem int;

select  count(itens.item_nome) INTO contagem from itens
where itens.item_nome = itenDC AND itens.id_player = cod_jog;

if(contagem >0) then
	set verifica = true;
else 
	set verifica = false; 
end if;

return verifica;

END;
$$ DELIMITER ;

select VerificarIten (2, 'lanterna');
select * from itens;









#verifica se o jogador possui tal magia
drop function if exists VerificarMagia
DELIMITER $$
CREATE FUNCTION VerificarMagia (cod_jog int, magiaCOD int)
RETURNS boolean
BEGIN

declare contagem int;

select  count(magia_has_jogador.id_magia) INTO contagem from magia_has_jogador
where magia_has_jogador.id_magia = magiaCOD AND magia_has_jogador.id_player = cod_jog;

if(contagem >0) then
	return true;
else return false;
end if;

END;
$$ DELIMITER ;

select * from magia_has_jogador;

select VerificarMagia(1, 3);


####################TRIGGERS####################
drop trigger if exists itenInsert;
DELIMITER $$ 
CREATE TRIGGER itenInsert AFTER insert
ON jogador FOR EACH ROW
BEGIN

insert into itens (item_nome, id_player) values('Lanterna', new.idjogador);
insert into itens (item_nome, id_player) values('Espada', new.idjogador);

END; 
$$ DELIMITER ;

####################VIEWS####################
drop view if exists Jogador__Magia;
create view Jogador__Magia as 
select  jogador.idjogador, jogador.nome, magias.magia_nome, magias.id_magia from jogador 
inner join magia_has_jogador on jogador.idjogador = magia_has_jogador.id_player
inner join magias on magia_has_jogador.id_magia = magias.id_magia
where jogador.idjogador = magia_has_jogador.id_player
and magia_has_jogador.id_magia = magias.id_magia
order by jogador.nome, magias.magia_nome;

select * from jogador__magia;
select * from magia_has_jogador;

###################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################