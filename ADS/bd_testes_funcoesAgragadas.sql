--1 
/*- A média de peso dos pacientes do sexo masculino, alcoolatras;
select avg(peso) from paciente
where sexo = 'M' and alcoolatra;
--*/

--2 
/*- Quantidade de Consultas por paciente;
select paciente.nome, count(consulta.*) as contagem 
from paciente
join consulta on paciente.id_paciente = consulta.id_paciente
group by paciente.nome;
--*/

--3 
/*- Faça uma contagem de pacientes cadastrados e os agrupe por tipo_sanguíneo;
select count(*), tipo_sanguineo from paciente group by tipo_sanguineo order by tipo_sanguineo;
--*/

--4 
/*- selecionar soma dos salários dos pediatras;
select sum(medico.salario) from medico
join formado on medico.id_medico = formado.id_medico
join especialidade on formado.id_especialidade = especialidade.id_especialidade
where especialidade.nome = 'Homeopatia';
--*/

--5 
/*- Exiba a media de peso das consultas realizadas em um período de data;
select avg(peso) from consulta
where data between '01-01-1999' and '01-01-2015';
--*/

--6 
/*- Selecione os tipos sanguíneos no banco que contenham mais de 60 
--pacientes cadastrados.
select tipo_sanguineo, count(tipo_sanguineo) as qtd 
from paciente
group by tipo_sanguineo 
having count(tipo_sanguineo) > 60
--*/

--7 DPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPSDPS
/*- Selecione a média de peso dos pacientes que possuem entre 30 e 35 anos;
select avg(peso), (EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM data_nascimento)) AS idade
from paciente
having idade between 30 and 35
--*/

--8 
/*- selecione o nome e a quantidade de consultas realizadas por 
--cada paciente para pacientes que tenham mais de 4 consultas e sejam 
--do sexo feminino. Ordene seu select pelo número de consultas de forma crescente;
select paciente.nome, count(consulta.id_consulta) as qtd
from paciente
join consulta on paciente.id_paciente = consulta.id_paciente
where paciente.sexo = 'F'
group by paciente.nome
having count(consulta.id_consulta) > 4 
order by qtd
--*/

--9 
/*- faça uma consulta que mostre os pacientes que ganham próximo da média 
--de rendimento geral dos pacientes (um intervalo de 10% a mais e a menos);
select nome, rendimento
from paciente
where rendimento::numeric between 
(select avg(rendimento::numeric) from paciente)*0.9 and
(select avg(rendimento::numeric) from paciente)*1.1
--*/

--10 
/*- Selecione o nome do paciente que mais participou de consultas.
select paciente.nome, count(consulta.id_paciente)
from paciente 
join consulta on paciente.id_paciente = consulta.id_paciente

group by paciente.nome
--*/

--11 
/*- Selecione o mais novo dentre os pacientes consultados com o médico de id 6
select paciente.nome, max(paciente.data_nascimento)
from paciente
join consulta on paciente.id_paciente = consulta.id_paciente
where consulta.id_medico = 6
group by paciente.nome --limit 1
--*/
