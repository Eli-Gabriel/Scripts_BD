-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema gamebook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gamebook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamebook` DEFAULT CHARACTER SET utf8 ;
USE `gamebook` ;

-- -----------------------------------------------------
-- Table `gamebook`.`jogador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamebook`.`jogador` (
  `idjogador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `energia_inicial` INT NULL,
  `energia_atual` INT NULL,
  `habilidade_inicial` INT NULL,
  `habilidade_atual` INT NULL,
  `sorte_inicial` INT NULL,
  `sorte_atual` INT NULL,
  `magia_inicial` INT NULL,
  `magia_atual` INT NULL,
  `pag_atual` INT NULL,
  PRIMARY KEY (`idjogador`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



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