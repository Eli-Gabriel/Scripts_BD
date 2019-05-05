--1 
/*- A média de peso dos pacientes do sexo masculino, alcoolatras;
select avg(peso) from paciente
where sexo = 'M' and alcoolatra;
--*/

--2 
/*- Quantidade de Consultas por paciente;
select count(*) from consulta group by id_paciente;
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

--6 DPSDPSDPSDPSDPSDPSDPSDPSDPS
/*- Selecione os tipos sanguíneos no banco que contenham mais de 60 
--pacientes cadastrados.
select count(*) as qtd, tipo_sanguineo from paciente 
where qtd > 60
group by tipo_sanguineo order by tipo_sanguineo; 
--*/

--7 
/*- Selecione a média de peso dos pacientes que possuem entre 30 e 35 anos;
select avg(peso) from paciente 
where  data_nascimento between '01-01-1984' and '01-01-1989';
--*/

--8 DPSDPSDPSDPSDPSDPSDPSDPSDPS
/*- selecione o nome e a quantidade de consultas realizadas por 
--cada paciente para pacientes que tenham mais de 4 consultas e sejam 
--do sexo feminino. Ordene seu select pelo número de consultas de forma crescente;
select paciente.nome, count(consulta.id_consulta) as qtd
from paciente
join consulta on paciente.id_paciente = consulta.id_paciente
where paciente.sexo = 'F' 
group by paciente.nome 
--*/

--9 DPSDPSDPSDPSDPSDPSDPSDPSDPS
/*- faça uma consulta que mostre os pacientes que ganham próximo da média 
--de rendimento geral dos pacientes (um intervalo de 10% a mais e a menos);
select nome,  avg(rendimento) as media
from paciente where rendimento between (media*1.1) and (media*0.9)

--*/

--10 /*- Selecione o nome do paciente que mais participou de consultas.
select paciente.nome, max((select count(consulta.id_paciente from consulta)))
from paciente 
join consulta on paciente.id_paciente = consulta.id_paciente

--*/

--11 /*- Selecione o mais novo dentre os pacientes consultados com o médico de id 6;
--*/