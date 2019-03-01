
--1) --select nome from paciente where (data_nascimento<'14-02-1999') and (alcoolatra);

--2) --select * from consulta where id_paciente=30 and data > '14-02-2012' and data < '14-02-2019';

--3) --select * from medico where salario > '50000';

--4) --select * from paciente where (alcoolatra) and (sedentario);

--5) --select * from remedio where valor between '40' and '300' order by valor;

--6) --select * from paciente where peso > '90' and nome like '%o%' and data_nascimento < '01-01-1997' and tipo_sanguineo like 'A%';

--7) --select * from medico where not (salario between '5000' and '15000') order by salario;

--8) --select salario, salario*1.15 as "bonificacao" from medico;

--9) --select valor from consulta group by valor;
--select distinct valor from consulta order by valor;