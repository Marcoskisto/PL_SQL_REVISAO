

------------- SQLPROMPT SCRIPTS --------------------
TTITLE  LEFT 'Run date: ' _DATA CENTER 'Run by the ' SQL.USER ' user' RIGHT 'Page: ' FORMAT 180 SQL.PNO SKIP 2
TTITLE  LEFT 'Run date: ' _DATA CENTER 'Run by the ' SQL.USER RIGHT 'Page: ' FORMAT 180 SQL.PNO SKIP 2


------------- SETS --------------------
SET sqlprompt '&_user:&_connect_identifier>'
SET linesize 190
SET pagesize 50
SET serveroutput ON
SET VERIFY ON / OFF
SET DEFINE '#' / '&'

------------- Descriptions --------------------
desc v$datafile
desc v$instance
desc v$database

desc cat;
desc products;
desc coupons;
desc user_role_privs
desc role_sys_privs
desc user_tables
desc user

------------- CREATES --------------------
CREATE role nome_da_role;
CREATE role nome_da_role_2 IDENTIFIED by password;

------------- ALTERS --------------------

ALTER DATABASE OPEN;

ALTER TABLE NOME_TABELA RENAME COLUMN nome_coluna TO novo_nome_coluna;
ALTER TABLE NOME_TABELA ADD CONSTRAINT nome_da_constraint TIPO DA CONSTRAINT (nome_da_coluna);
-- Exemplo1: ALTER TABLE purchases ADD CONSTRAINT purchases_pk PRIMARY KEY (product_id);
-- Exemplo2: ALTER TABLE purchases ADD CONSTRAINT purchases_fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)


ALTER TABLE NOME_TABELA DROP CONSTRAINT CONSTRAINT_NAME;
ALTER TABLE NOME_TABELA ADD COLUMN TYPE CONSTRAINT;
ALTER TABLE NOME_TABELA DISABLE | ENABLE CONSTRAINT_NAME;

ALTER TABLE vendedor DISABLE CONSTRAINT SYS_C0010824 cascade;
ALTER TABLE vendedor ENABLE CONSTRAINT SYS_C0010824;

-- ALTER TRIGGER
ALTER TRIGGER "C##ROBSONCARTES"."T_EMP_TAB2" disable

------------- DROPS --------------------
drop table "C##ROBSONCARTES"."ITEM_EMPRESTIMO"
drop table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" cascade constraints
drop table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" cascade constraints PURGE
DROP PROCEDURE "SCHEMA.nome_procedure"
-- Exemplo: DROP PROCEDURE "C##ROBSONCARTES"."INCLUIR_DPT"
DROP VIEW nome_visão;
-- Exemplo: DROP VIEW funcionario_departamento_view1;
-- Exemplo2; drop view "C##ROBSONCARTES"."MEDICO_VIEW";

DROP PACKAGE "C##ROBSONCARTES"."EXEMPLO_PACKAGE"
DROP PACKAGE BODY "C##ROBSONCARTES"."EXEMPLO_PACKAGE"

------------- TRUNCATE --------------------
truncate table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" reuse storage
truncate table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" drop storage
------------- LOCK TABLE --------------------
-- Exemplos
lock table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" in ROW SHARE mode
lock table "C##ROBSONCARTES"."ITEM_EMPRESTIMO" in ROW SHARE mode nowait


------------- DELETES --------------------
DELETE VENDEDOR WHERE ven_codigo between 1 and 10;


------------- SELECTS --------------------
SELECT *from cat;
SELECT SYSDATE FROM dual;
SELECT MAX (func_sal) FROM funcionario;

SELECT *from role_sys_privs ORDER BY privilege;
SELECT *from user_role_privs;

SELECT *from user_tables;
SELECT table_name, tablespace_name, cluster_name from user_tables;
SELECT table_name, tablespace_name, status from user_tables;

SELECT file#, name FROM v$datafile WHERE con_id = 1 ORDER BY file#;
SELECT file#, name FROM v$datafile WHERE con_id IN (2, 3) ORDER BY file#;
SELECT *from v$datafile;

SELECT name FROM v$controlfile UNION SELECT name FROM v$tempfile UNION SELECT name FROM V$DBFILE UNION SELECT member FROM v$logfile;

select *from v$version;

select *from product_component_version;

SELECT FILE#, CREATION_CHANGE#, CREATION_TIME, AUX_NAME FROM v$datafile ORDER BY CREATION_TIME;
SELECT FILE#, NAME, PLUGIN_CHANGE#, CON_ID, CREATION_CHANGE#, CREATION_TIME FROM v$datafile ORDER BY CREATION_TIME;
SELECT *from v$instance;

SELECT *FROM product_changes;
SELECT *FROM product_component_version;
SELECT *FROM SYSTEM.product_privs;

SELECT 'alter table '|| table_name||' disable constraint '|| constraint_name || ';' from user_constraints;
SELECT 'status ' || status || 'last_change ' || last_change || 'view_related ' || view_related || 'CONSTRAINT_NAME ' || CONSTRAINT_NAME ||';' 
FROM dba_constraints WHERE owner = 'C##ROBSONCARTES';

SELECT CONSTRAINT NAME, CONSTRAINT TYPE, STATUS, SEARCH_CONDICTION;
SELECT constraint_name from user_constraints;
SELECT status, last_change, view_related, CONSTRAINT_NAME from user_constraints;
SELECT status, last_change, view_related, CONSTRAINT_NAME from dba_constraints;
SELECT table_name, status, generated, constraint_name CONSTRAINT from dba_constraints where owner = 'C##ROBSONCARTES';
SELECT object_name, aggregate, parallel FROM user_procedures;

SELECT to_date('AGO 26, 1979', 'MONTH DD, YYYY') from dual;
SELECT ADD_MONTHS('01-JAN-2007', 29) from dual;
SELECT TRUNC(TO_DATE('25-MAR-2008'), 'YYYY') from dual;
SELECT TRUNC(TO_DATE('25-MAR-2008'), 'MM') from dual;
SELECT MONTHS_BETWEEN('03-SET-2016', '03-SET-1979') from dual;

SELECT &column1, &column2, &column3 from &table1 WHERE &column2 = &column4;

SELECT trigger_name, trigger_type, triggering_event, table_owner, base_object_type, table_name, referencing_names, 
when_clause, status, description, action_type, trigger_body FROM user_triggers;

SELECT trigger_name from user_triggers where trigger_name = 'AUMENTO_SALARIAL';
SELECT trigger_type from user_triggers;
SELECT triggering_event from user_triggers;
SELECT table_owner from user_triggers;
SELECT base_object_type from user_triggers;
SELECT table_name from user_triggers;
SELECT referencing_names from user_triggers;
SELECT when_clause from user_triggers;
SELECT description from user_triggers;
SELECT status from user_triggers;
SELECT action_type from user_triggers;
SELECT trigger_body from user_triggers;

SELECT base_object_type, table_name, referencing_names, when_clause, status, 
description, action_type, trigger_body FROM user_triggers;

SELECT comments, table_name from all_tab_comments;
SELECT *FROM all_tab_comments where substr(table_name, 1, 4) != 'BIN$';

select *from funcionario_departamento_view1;

-- TCL (TRANSACTION CONTROL LANGUAGE) -----------
COMMIT;
ROLLBACK;
SAVEPOINT;

------------- BLOCO ANÔNIMOS --------------------

begin
for i in (SELECT constraint_name, table_name from user_constraints) LOOP
execute immediate 'alter table '||i.table_name||' disable constraint '||i.constraint_name||'';
end loop;
end;
/

or

UPDATE produto
SET pro_valor_unidade = 100
where pro_codigo = 1;

----------[ Alterando charset de um banco em execução de maneira “NÃO segura” ] -------------

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;
ALTER SYSTEM SET AQ_TM_PROCESSES=0;
ALTER DATABASE OPEN;
alter database character set AL32UTF8;
SHUTDOWN IMMEDIATE;
STARTUP;

----------[ Alterando charset de um banco em execução de maneira “segura” ] -------------

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;
ALTER SYSTEM SET AQ_TM_PROCESSES=0;
ALTER DATABASE OPEN;
ALTER DATABASE CHARACTER SET INTERNAL_USE AL32UTF8;
alter database character set AL32UTF8;
SHUTDOWN IMMEDIATE;
STARTUP;

----Alterando o charset e mudando a ordem.

alter system set nls_length_semantics=CHAR scope=both;
shutdown;
startup restrict;
alter database character set INTERNAL_USE WE8ISO8859P1;
shutdown;
startup;