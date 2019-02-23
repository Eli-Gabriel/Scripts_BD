--1 
/*
select remedio.nome, laboratorio.nome from remedio, laboratorio 
where remedio.id_laboratorio = laboratorio.id_laboratorio;
--*/
--2 
/* 
select paciente.nome as "paciente", medico.nome as "medico", consulta.data 
from paciente inner join consulta on paciente.id_paciente = consulta.id_paciente
inner join medico on consulta.id_medico = medico.id_medico
where consulta.data < '01-01-1998' 
order by consulta.data 
--*/
--3
/*
select medico.nome as "nome", especialidade.nome as "formação", formado.data_formacao
from medico inner join formado on medico.id_medico = formado.id_medico
inner join especialidade on formado.id_especialidade = especialidade.id_especialidade
where formado.data_formacao >= '01-01-1970' order by formado.data_formacao;
--*/
--4 /*
select consulta.id_consulta, consulta.data, consulta.hora, consulta.laudo, consulta.peso, consulta.valor, remedio.nome
from consulta
inner join prescreve on consulta.id_consulta = prescreve.id_consulta
inner join remedio on prescreve.id_remedio = remedio.id_remedio
where remedio.valor>'500' order by remedio.valor;
--*/
--5
--6
--7
--8