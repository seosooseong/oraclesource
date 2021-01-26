create table test(
    id NUMBER(4),
    name varchar2(3));

desc test;

INSERT into test values(1000, 'ȫ�浿'); --�ѱ��� �����ϳ��� 2BYTE
INSERT into test values(1000, 'ABC');    --����� �����ϳ��� 1BYTE�� ó��

--���� ���� �ٸ� BYTEó���� �����ϱ� ���� nchar, nvarchar2

-- DROP TABLE TEST2; --�����


--nchar, nvarchar2 ���� :������ ���̸� �׻� ������ �ִ��� �ƴϳ� ����.
--NCAHAR ��쿡�� ���ڰ� 1�� �Է��� �ǵ� 4�ڸ��� �׻� ����

create table test2(
    id NCHAR(4),
    name Nvarchar2(3));
    
INSERT INTO TEST2 VALUES('Ȳ������','ȫ�浿');


----------------------------------------------------------------------
SELECT*FROM TEST3;

CREATE TABLE TEST3(
        ID NVARCHAR2(4),
        NAME NVARCHAR2(4),
        REG_DATE DATE);
        
INSERT INTO TEST3 VALUES ('Ȳ������','ȫ�浿', SYSDATE);
INSERT INTO TEST3 VALUES ('Ȳ������','ȫ�浿', '2020-11-09');


----------------------------------------------------------------------
--���̺� �����ϴ� �����.
--CREATE TABLE ���̺��( ���̸� Ÿ��,-----)
--CREATE TABLE ���̺�� AS SELECT*FROM EMP;
--CREATE TABLE ���̺�� AS SELECT*FROM EMP WHERE DEPTNO =20;
--������ ����.
--CREATE TABLE ���̺�� AS SELECT*FROM EMP WHERE 1<>1;

DESC EMP;


CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VACHAR2(10),
    JOB VACHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), --��ü �ڸ����� 7�ڸ� (�Ҽ��� 2�ڸ��� ������ �� ����)
    COMM NUMBER(7,2), --12345.67
    DEPTNO NUMBER(2));

CREATE TABLE EMP_DDL(
                    EMPNO  NUMBER(4),    
                    ENAME  VARCHAR2(10),
                    JOB    VARCHAR2(9), 
                    MGR    NUMBER(4),    
                    HIREDATE DATE,      
                    SAL NUMBER(7,2), 
                    COMM NUMBER(7,2), 
                    DEPTNO NUMBER(2));  

--�÷� �߰�
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

--�÷��� ����
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL;

--���� Ÿ�Ժ���

ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

--����Ư���� ����
ALTER TABLE EMP_DDL DROP COLUMN TEL;


--���̺�� ����
RENAME EMP_DDL TO EMP_RENAME;


DESC EMP_DDL;


--ppt�ǽ�1.
CREATE TABLE MEMBER(
                    ID char (8), --������
                    NAME nvarchar2 (10), --������ ���ڿ�(�ѱ�)
                    ADDR nvarchar2(50), --������ ���ڿ�(�ѱ�,����)
                    NATION nchar(4), --������ ����(�ѱ�)
                    EMAIL varchar2(50), -- ������ ����
                    AGE number(7,2)); --�Ҽ� ��°�ڸ����� ǥ��
                    
--member ���̺� BIGO�� �߰�
--������ ���ڿ� ���̴� 20
ALTER TABLE MEMBER ADD BIGO NVARCHAR2(20); 

--BIGO �� ũ�� 30���� ����
ALTER TABLE member MODIFY bigo NVARCHAR2(30);

--bigo�� �̸� REMARK�� ����
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK; 

DROP TABLE MEMBER; -- ���̺� ����
DESC MEMBER;
