############Exemplos Slide1####################
delimiter $$
CREATE PROCEDURE produtos_quartos()
BEGIN
SELECT
quarto.número_qua 'Número do Quarto',
produto.descrição_prod 'Nome do Produto',
produtos_quarto.quantidade_pq 'Quantidade Disponível no Quarto'
FROM quarto 
INNER JOIN produtos_quarto on quarto.cod_qua = produtos_quarto.cod_qua
INNER JOIN produto on produtos_quarto.cod_prod = produto.cod_prod;
END $$ delimiter ;

call produtos_quartos();



select
cliente.cod_cli as 'Código do Cliente',
cliente.nome_cli as 'Nome do Cliente',
(select sum(valorProd_ph) from produtos_hospedagem
where produtos_hospedagem.cod_hosp = hospedagem.cod_hosp) as soma
from cliente inner join hospedagem on
cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = 1;


delimiter $$
CREATE PROCEDURE somaConsumo_cliente 
(codigo_cliente int)
BEGIN
select
cliente.cod_cli as 'Código do Cliente',
cliente.nome_cli as 'Nome do Cliente',
(select sum(valorProd_ph) from produtos_hospedagem
where produtos_hospedagem.cod_hosp = hospedagem.cod_hosp) as soma
from cliente inner join hospedagem on
cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = codigo_cliente;
END $$ delimiter ;


call produtosConsumidos_cliente(1);

select * from produtos_hospedagem;

delimiter $$
CREATE PROCEDURE somaProdutosConsumidos_cliente
(codigo_cliente int, out resultado double)
BEGIN
select
(select sum(valorProd_ph) from produtos_hospedagem where produtos_hospedagem.cod_hosp = hospedagem.cod_hosp) into resultado
from cliente inner join hospedagem on
cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = codigo_cliente;
END $$ delimiter ;


call somaProdutosConsumidos_cliente(1, @total);

select @total;

select * from produto;


delimiter $$
create procedure inserirProdutos (codigo int, descricao varchar(100), quant int, valor double, validade date)
begin
insert into produto values (codigo, descricao, quant, valor, validade);
end
$$ delimiter ;

call inserirProdutos(4, 'Vinho Tinto Borbom', 10, 48.55, '2030-01-01');


delimiter $$
CREATE PROCEDURE InsereCliente (codigo_cliente int, nome_cliente varchar(100), cpf_cliente varchar(20), 
telefone_cliente varchar(50), celular_cliente varchar(50), endereco_cliente int)
BEGIN IF ((nome_cliente != '') AND (cpf_cliente != '')) then
INSERT INTO cliente (cod_cli, nome_cli, cpf_cli, telefone_cli, celular_cli, cod_end) values 
(codigo_cliente, nome_cliente, cpf_cliente, telefone_cliente, celular_cliente, endereco_cliente);
SELECT 'Cliente inserido com sucesso!' AS Msg;
ELSE
SELECT 'NOME e CPF devem ser fornecidos para o cadastro!' AS Msg;
END IF;
END $$ delimiter ;

desc quarto;

call inserecliente(21, 'Mateus Sales', '111.222.111.15', '69 3421 1111', '69 8888 8888', 1);

delimiter $$
CREATE PROCEDURE ReajustePreco (preco_medio double, percentual int)
BEGIN
WHILE (SELECT AVG(valor_prod) FROM produto) < preco_medio DO
update produto set valor_prod = valor_prod + (valor_prod * (percentual/100));
END WHILE;
END;
$$ delimiter ;


select * from produto;

desc produto;

call ReajustePreco(20, 10);

delimiter $$
CREATE PROCEDURE aumentarProdutos (codigo_produto int, preco_maximo double, percentual int)
BEGIN
WHILE (select valor_prod from produto where cod_prod = codigo_produto) < preco_maximo do
update produto set valor_prod = valor_prod + (valor_prod * (percentual/100));
END WHILE;
END;
$$ delimiter ;

call aumentarProdutos(10, 10, 1);



/*
delimiter $$
CREATE PROCEDURE somaProdutosConsumidos_cliente
(codigo_cliente int, out resultado double)
BEGIN
select
(select sum(valorProd_ph) from produtos_hospedagem where produtos_hospedagem.cod_hosp = hospedagem.cod_hosp) into resultado
from cliente inner join hospedagem on
cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = codigo_cliente;
END $$ delimiter ;


call somaProdutosConsumidos_cliente(1, @total);

select @total;



/*
DELIMITER $$
CREATE PROCEDURE xxxxx ()
BEGIN

END;
$$ DELIMITER ;
*/



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
#pra facilitar
DELIMITER $$
CREATE PROCEDURE Valor_hosp(cod int, out qtd int, out nom varchar(40))
BEGIN
select (sum(hospedagem.valorTotal_hosp)), cliente.nome_cli into qtd, nom
from hospedagem 
inner join cliente on cliente.cod_cli = hospedagem.cod_cli
where cliente.cod_cli = cod;
END;
$$ DELIMITER ;
#pra facilitar

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
DELIMITER $$
CREATE PROCEDURE xxxxx ()
BEGIN

END;
$$ DELIMITER ;