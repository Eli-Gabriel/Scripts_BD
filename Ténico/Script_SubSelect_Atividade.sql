#parte 1
#1
select cliente.nome_cli as nome, conta_corrente.número_cc as 'conta corrente', date_format(conta_corrente.dataabertura_cc, '%D/%M/%Y') as 'data de abertura'
from cliente, conta_corrente
where cliente.cod_cli = conta_corrente.cod_cli;

#2
select banco.nome_ban as 'Banco', agência.número_ag as 'Número da Agência', conta_corrente.número_cc as 'Número da Conta Corrente', cliente.nome_cli as 'Noeme do Cliente', 
(select round(sum(pagamento.valor_pag), 2) from pagamento inner join conta_corrente on conta_corrente.cod_cc = pagamento.cod_cc)
from banco 
inner join agência on banco.cod_ban = agência.cod_ban 
inner join conta_corrente on agência.cod_ag = conta_corrente.cod_ag
inner join cliente on conta_corrente.cod_cli = cliente.cod_cli
group by 'Banco';

#3
select cliente.nome_cli as'Cliente', 
(select round(sum(depósito.valor_dep)) as 'Total Depósito' from depósito, conta_corrente where depósito.cod_cc = conta_corrente.cod_cc),
(select round(sum(saque.valor_saq)) as 'Total Saque' from saque, conta_corrente where saque.cod_cc = conta_corrente.cod_cc)
from cliente, conta_corrente
where cliente.cod_cli = conta_corrente.cod_cli;

#4
select banco.nome_ban as'banco', agência.número_ag as'Agência', conta_corrente.número_cc as'Conta Corrente', cliente.nome_cli as'Cliente',
(select count(depósito.cod_dep), sum(depósito.valor_dep) from depósito inner join conta_corrente on depósito.cod_cc = conta_corrente.cod_cc),
(select count(saque.cod_saq), sum(saque.valor_saq) from saque inner join conta_corrente on saque.cod_cc = conta_corrente.cod_cc),
(select count(pagamento.cod_pag), sum(pagamento.valor_pag) from pagamento inner join conta_corrente on pagamento.cod_cc = conta_corrente.cod_cc)
from banco 
inner join agência on banco.cod_ban = agência.cod_ban
inner join conta_corrente on agência.cod_ag = conta_corrente.cod_ag
inner join cliente on conta_corrente.cod_cli = cliente.cod_cli;




#parte2
#1
update conta_corrente set saldo_cc = 0;

#2
