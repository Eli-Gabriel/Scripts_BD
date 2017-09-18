delimiter $$
create procedure deletar1 (codigo varchar (10000))
begin

if (select codigo rlike '([0-9])' = 1) then
	delete from estado where cod_est = codigo;
    select 'Codigo deletado com sucesso!' as Msg;
else
	select 'Insira um código valido!' as Msg;
end if;
end;
$$ delimiter ;

call deletar1 ('d');


select * from estado;
