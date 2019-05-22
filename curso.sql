create table curso
 (cod_curso number(3) constraint cursos_pk primary key,
  nome_curso varchar2(60) constraint cursos_nome_nu not null,
  carga_horaria number(3),
  preco number (7,2) default 0,
  pre_requisito number(3));

insert into curso (cod_curso,nome_curso,carga_horaria,preco)
values (1,'Introduçao à Lógica de Programação',32,800);

insert into curso (cod_curso,nome_curso,carga_horaria,preco)
values (2,'Fundamentos da Modelagem de Dados',40,950);

insert into curso (cod_curso,nome_curso)
values (3,'Redes I');

insert into curso (cod_curso,nome_curso)
values (4,'Introdução a Sistema Operacionais');

insert into curso (cod_curso,nome_curso)
values (5,'Análise Orientda por Objetos');

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (6,'Delphi: Recursos Básicos', 24, 400,1);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (7,'Delphi: Acesso a Banco de Dados', 24, 400,1);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (8,'Oracle: SQL*Plus e SQL',32,750,2);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (9,'Oracle: SQL/Plus e SQL', 24,750,8);

insert into curso (cod_curso,nome_curso,pre_requisito)
values (10,'Redes II',3);

create table curso_velho
 (cod_curso number(3) constraint cursos_pk_velho primary key,
  nome_curso varchar2(60) constraint cursos_nome_nu_velho not null,
  carga_horaria number(3),
  preco number (7,2) default 0,
  pre_requisito number(3));

insert into curso_velho (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (101,'Windowns 3.1: Recursos Básicos',80,1000,null);

insert into curso_velho (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (102,'Windows 3.1: Recursos Avançados',80,1000,null);

insert into curso_velho (cod_curso,nome_curso,pre_requisito)
values (103,'Delphi: Recursos Básicos',3);
commit;