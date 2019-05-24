--1 REVERREVERREVERREVERREVERREVERREVERREVERREVERREVERREVERREVERREVERREVER
/*-utilizando views e subconsultas selecione os nomes e os valores dos 
--remédios que custem menos que R$:500,00;
create view nomevalor as 
select nome, valor from remedio 
where valor::numeric < 500
order by valor
--*/
--select * from  nomevalor

--2 
/*- utilizando views e subconsultas selecione o nome do remédio mais barato
--cadastrado no sistema
create view remediobarato as
select nome, valor from remedio
where valor = (select min(valor) from remedio)
--*/
--select * from remediobarato

--4a_sub-consulta /*- Selecione o nome dos pacientes que nunca participaram 
--de nenhuma consulta, faça um exemplo utilizando subconsulta, um utilizando 
--views e um utilizando join.
select paciente.nome from paciente 
where id_paciente not in
	(select id_paciente from consulta)
order by paciente.nome
--*/

--4b_view    mesma coisa da anterior?/*--*/
--4c_join /*

--*/