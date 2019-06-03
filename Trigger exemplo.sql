/*criando o banco de dados*/
create database Recurso_humano

use Recurso_humano
/*criando a tabela funcionario*/
create table funcionario
(codigo_func int primary key not null,
nome_func varchar (30) not null,
email_func varchar(40) not null,
telefone_func numeric (9) not null);


create table funcionario_backup_insert
(codigo_func int primary key not null,
nome_func varchar (30) not null,
email_func varchar(40) not null,
telefone_func numeric (9) not null);

go
create table funcionario_backup_delete
(codigo_func int primary key not null,
nome_func varchar (30) not null,
email_func varchar(40) not null,
telefone_func numeric (9) not null);
go

/*select da tabela funcionario*/
select * from funcionario
go
/*select da tabela funcionario_backup_insert*/
select * from funcionario_backup_insert
go
/*select da tabela funcionario_backup_delete*/
select * from funcionario_backup_delete
go
/* fazendo a trigger para o insert*/
create trigger trg_insertfuncionario on funcionario
after insert
as begin
insert into funcionario_backup_insert
select * from inserted
end
go


/* fazendo a trigger para o delete*/

create trigger trg_deletefuncionario on funcionario
after insert
as begin
insert into funcionario_backup_delete
select *from deleted
end 
go

/*insert na tabela funcionarios */

insert into funcionario (codigo_func,nome_func,email_func,telefone_func)
values (5, 'Edson Dionisio','edson.dionisio@gmail.com',997402801),
       (8, 'Maite silva' , 'maite.silva@gmail.com',997402801),
	   (12, 'Marilia Kessia', 'testekessia@gmail.com',997402801);



/*select da tabela funcionario*/
select * from funcionario
go
/*select da tabela funcionario_backup_insert*/
select * from funcionario_backup_insert
go
/*select da tabela funcionario_backup_delete*/
select * from funcionario_backup_delete
go	   

/* fazendo delete de dados na tabela funcionario */
delete from funcionario
where codigo_func=8;
go


/*select da tabela funcionario*/
select * from funcionario
go
/*select da tabela funcionario_backup_insert*/
select * from funcionario_backup_insert
go
/*select da tabela funcionario_backup_delete*/
select * from funcionario_backup_delete
go	   


/* trigger de */
select * from sysobjects where type = 'TR';



drop database Recurso_humano
go
drop table funcionario
go

drop table funcionario_backup_insert
go
drop table funcionario_backup_delete

drop trigger trg_deletefuncionario
go

drop trigger trg_insertfuncionario
go

