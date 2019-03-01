--1 
/*1 - Selecione o nome dos remédios e o nome dos seus respectivos laboratórios fabricntes:
select remedio.nome, laboratorio.nome from remedio, laboratorio 
where remedio.id_laboratorio = laboratorio.id_laboratorio;
--*/
--2 
/* 2 - Selecione o nome do paciente e do médico das consultas realizadas anteriormente a 1998;
select paciente.nome as "paciente", medico.nome as "medico", consulta.data 
from paciente 
inner join consulta on paciente.id_paciente = consulta.id_paciente
inner join medico on consulta.id_medico = medico.id_medico
where consulta.data < '01-01-1998' 
order by consulta.data 
--*/
--3
/*3 - Selecione o nome a formação de cada médico formados depois de 1970;
select medico.nome as "nome", especialidade.nome as "formação", formado.data_formacao
from medico inner join formado on medico.id_medico = formado.id_medico
inner join especialidade on formado.id_especialidade = especialidade.id_especialidade
where formado.data_formacao >= '01-01-1970' order by formado.data_formacao;
--*/
--4 
/*4 - Selecione as consultas que tiveram prescrição de remédios e o nome destes remédios que os mesmos não custem mais de 500;
select consulta.id_consulta, consulta.data, consulta.hora, consulta.laudo, consulta.peso, consulta.valor, remedio.nome, remedio.valor
from consulta
inner join prescreve on consulta.id_consulta = prescreve.id_consulta
inner join remedio on prescreve.id_remedio = remedio.id_remedio
where remedio.valor>'500' order by remedio.valor;
--*/
--5
/*5 - selecione o nome de todos os médicos formados em imunologia
select medico.nome from medico
inner join formado on medico.id_medico = formado.id_medico
inner join especialidade on formado.id_especialidade = especialidade.id_especialidade
where especialidade.nome = 'Imunologia';
--*/
--6
/*6 - descubra se há no sistema médicos que não tenham nenhuma formação cadastrada;
select medico.nome from medico
except
select medico.nome from medico
inner join formado on medico.id_medico = formado.id_medico;
--*/
--7
/*7 - selecione o nome dos pacientes que nunca participaram de uma consulta;
select paciente.nome from paciente
except
select paciente.nome from paciente 
inner join consulta on paciente.id_paciente = consulta.id_paciente;
--*/
--8 /*8 - selecione o nome de todos os remédios prescritos para um determinado paciente;
select remedio.nome from remedio
inner join prescreve on remedio.id_remedio = prescreve.id_remedio
inner join consulta on  prescreve.id_consulta = consulta.id_consulta
inner join paciente on consulta.id_paciente = paciente.id_paciente
group by remedio.nome
--*/