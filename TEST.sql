--�������� (DDL �ۼ�)

--1. NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20));
    
INSERT INTO TABLE_NOTNULL values('seo1234','seo1234'); --���� ���� ������� �ʽ��ϴ�

--NULL�� ("TEST"."TABLE_NOTNULL"."LOGIN_PWD") �ȿ� ������ �� �����ϴ�
INSERT INTO TABLE_NOTNULL(login_id,login_pwd)
values('seo1',null);  


INSERT INTO TABLE_NOTNULL(login_id,login_pwd)
values('seo1234','seo1234');


--NULL�� ("TEST"."TABLE_NOTNULL"."LOGIN_PWD")�� ������ �� �����ϴ�
UPDATE table_notnull set login_pwd=null where login_id='seo1234';


SELECT * FROM table_notnull;



--�������� Ȯ���ϱ�
SELECT * FROM user_constraints;


--�������Ǹ� �����ϱ�
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR2(20) CONSTRAINT tbl_nn_lgin_nn NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT tbl_nn_lginpwd_nn NOT NULL,
    TEL VARCHAR2(20));

--�������� �߰�
alter table table_notnull2 MODIFY (tel not null);
alter table table_notnull2 MODIFY (tel CONSTRAINT tbl_nn_tel_nn not null);

ALTER table table_notnull2 rename constraint SYS_C0011111 to TBL_NN_TEL_NN;

--�������� ����
ALTER table table_notnull2 drop constraint tbl_nn_tel_nn;

update table_notnull set tel='010-1111-1111' where login_id='seo1234';
alter table table_notnull MODIFY (tel not null); --(TEST.) ������� ���� �Ұ� - �� ���� �߰ߵǾ����ϴ�.




--2. UNIQUE : �ߺ����� �ʴ� ��

create table table_unique(
            LOGIN_ID VARCHAR2(20) unique,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));

insert into table_unique(login_id, login_pwd, tel)
values ('TEST_ID02','PWD01','010-1234-1234');

SELECT*FROM TABLE_UNIQUE;



--�������� Ȯ���ϱ�--------------------------------------------------------
SELECT * FROM user_constraints;
--------------------------------------------------------------------------

create table table_unique2(
            LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ unique,
            LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPWD_UNN NOT NULL,
            TEL VARCHAR2(20));
            
            
            
--3. PRIMARY KEY (NOT NULL + UNIQUE): �⺻Ű
SELECT*FROM TABLE_PK;

create table TABLE_PK(
            LOGIN_ID VARCHAR2(20) PRIMARY KEY,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));
            
insert into TABLE_PK(login_id, login_pwd, tel)
values ('TEST_ID01','PWD01','010-1234-1234'); --�ߺ���, NULL X


create table TABLE_PK2(
            LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR2(20) NOT NULL,
            TEL VARCHAR2(20));
            
          
          
            
-- �������Ǹ� ��Ƽ� �ֱ� (�Ʒ��ʿ�...)
CREATE TABLE TABLE_CONSTRANT(
                            ID NUMBER (6),
                            NAME VARCHAR2(10),
                            ADDR VARCHAR2(20),
                            TEL VARCHAR2(20),
                            CONSTRAINT TBL_ID_PK PRIMARY KEY(ID),--�������Ǹ� ��Ƽ� �ֱ�
                            CONSTRAINT TBL_ID_UNQ UNIQUE(TEL));  --�������Ǹ� ��Ƽ� �ֱ�





--4. FOREIGN KEY (�ܷ�Ű) : ���� �ٸ� ���̺� �� ���� ����

CREATE TABLE DEPT_FK(
            deptno NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK prImary KEY, --�̸������ϸ鼭 �����̸Ӹ�
            dname varchAr2(14),
            loc VARCHAR2(13));

CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)); --����ɰ��� �����ϰ�..
           --�ܷ�Ű ����                 -- �����ð���        --�����ؼ�     
        

insert into dept_fk values (50, 'database', 'seoul');        
    
    
        
--�θ� Ű�� �����ϴ�
--�׷��� �θ����̺� ���� ���� �־�� �Ѵ�.     
INSERT INTO EMP_FK VALUES(1111,'ȫ�浿', 'clerk', '7777', '2019/02/13', 1200,null,50);

--�ڽ� ���ڵ尡 �߰ߵǾ����ϴ� // ���� �ȵ�.
delete from dept_fk where deptno=50;


drop table emp_fk; --���̺� ���� �Ʒ�





-----------------------------------------
-- on delete cascade : �θ�Ű�� ���ŵɶ� �ڽ�Ű�� ���� ����
CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
            REFERENCES DEPT_FK(DEPTNO) on delete cascade); 

--�׷��� �θ����̺� ���� ���� �־�� �Ѵ�.     
INSERT INTO EMP_FK VALUES(1111,'ȫ�浿', 'clerk', '7777', '2019/02/13', 1200,null,50);

--�ڽ� ���ڵ尡 �߰ߵǾ����ϴ� // ���� �ȵ�.
delete from dept_fk where deptno=50;                                       ----------------
               
               
               
               
               
-- on delete set null : �θ�Ű�� ���ŵɶ� �ڽ�Ű ���� null�� ����.     
CREATE TABLE EMP_FK(
            EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
            ENAME VARCHAR2(10),
            JOB VARCHAR2 (9),
            MGR NUMBER(4),
            HIREDATE DATE,
            SAL NUMBER(7,2),
            COMM NUMBER(7,2),
            DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK 
            REFERENCES DEPT_FK(DEPTNO) on delete set null);
                                        ----------------
--�׷��� �θ����̺� ���� ���� �־�� �Ѵ�.     
INSERT INTO EMP_FK VALUES(1111,'ȫ�浿', 'clerk', '7777', '2019/02/13', 1200,null,50);

--�ڽ� ���ڵ尡 �߰ߵǾ����ϴ� // ���� �ȵ�.
delete from dept_fk where deptno=50;  




rollback;
select * from emp_fk;

--5. CHECK : ���� ������ �� �ִ� ���� ���� �Ǵ� ���� ����.

CREATE TABLE TABLE_CHECK(
            LOGIN_ID VARCHAR(20) CONSTRAINT TBLCK_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR(20) CONSTRAINT TBLCK_LOGPD_PK CHECK (LENGTH(LOGIN_PWD)>3),
            TEL VARCHAR2(20));
            
INSERT INTO TABLE_CHECK VALUES ('TEST_ID','1234','010-8620-0439');
  
           
           
            
--6. DEFAULT : �⺻�� ���ϱ�

CREATE TABLE TABLE_DEFAULT(
            LOGIN_ID VARCHAR(20) CONSTRAINT TBLDF_LOGID_PK PRIMARY KEY,
            LOGIN_PWD VARCHAR(20) DEFAULT '1234', --�⺻�� 1234 �� ����.
            TEL VARCHAR2(20));
            
DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES('TEST_ID',NULL,'010-1111-1111');
INSERT INTO TABLE_DEFAULT VALUES('TEST_ID2', '5555','010-1111-2222');
INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL) VALUES('������','010-8620-2222');


SELECT * FROM TABLE_DEFAULT;

            