-- ������ ���� : �����ͺ��̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ
-- ��� �ʿ��� �߿��� �����Ͱ� ������ ���

-- scott �������� ��� ������ ������ ����
SELECT * FROM dict;

SELECT * FROM user_tables;

SELECT * FROM all_tables;

-- �� : ���� ���̺�

CREATE view vm_emp20 as (select empno, ename, job, deptno 
                         from emp 
                         where deptno=20);

SELECT * FROM vm_emp20;

-- �� Ȯ��
SELECT * FROM USER_VIEWS;

CREATE VIEW vm_emp30all as SELECT * FROM EMP;

-- ������ �並 ���ؼ� INSERT �۾�

INSERT INTO vm_emp30all 
VALUES(7777,'KIM','JUNKI',NULL,'20/10/19',2650,NULL,20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

-- ��� SELECT�� �����ϵ��� ����
CREATE VIEW VM_EMP_READ AS 
    SELECT EMPNO, ENAME, JOB FROM EMP WITH READ ONLY;



-- ������ �信 ������ �����Ѱ�?
SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP30ALL';

SELECT * FROM user_updatable_columns WHERE table_name='VM_EMP_READ';

-- �並 ����ϴ� ����
-- ����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
SELECT * FROM EMP; -- SAL,COMM
-- ��������, ���ΰ� ���� ������ ���� ����� �����ؼ� ���

-- �ε��� - �����̱� ������ select ���� ȿ���� ����

-- scott ������ ������ �ε��� ���� ����
SELECT * FROM user_indexes;

-- �⺻Ű ���� => �ڵ� �ε����� ��

-- �ε��� ����(emp ���̺��� sal ���� �ε��� ����)
CREATE INDEX idx_emp_sql on emp(sal);

select * from emp WHERE sal=1250;

-- �⺻Ű�� ������ ���̺� �ε��� Ȯ��
create table userTBL(
    userID char(8) NOT NULL PRIMARY KEY,
    userName nvarchar2(10) NOT NULL,
    birthYear number(4) NOT NULL,
    mobile char(3));

SELECT index_name,uniqueness,index_type FROM user_indexes;

SELECT * FROM user_indexes;

-- ������ : Ư�� ��Ģ�� �´� ���� ���� ����
--        : �Խñ� ��ȣ, ��ǰ ��ȣ, �ֹ���ȣ....

CREATE SEQUENCE DEPT_SEQ 
INCREMENT BY 10 -- 10�� ����
START WITH 10  -- ó�� ���� ����
MAXVALUE 90    -- ������ ����
MINVALUE 0     -- START ������ �۰� ����
NOCYCLE CACHE 2; -- �ݺ����� ����, �̸� ������ ������ ����

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- �������� �̿��ؼ� ����
SELECT * FROM dept_seq_tbl;
INSERT INTO DEPT_SEQ_TBL VALUES(DEPT_SEQ.nextval,'DATABASE','SEOUL');

-- ������ ����
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- ������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.currval FROM DUAL;


-- SYNONYM(���Ǿ�) : ���� ��Ī
-- ���̺�, ��, ������ �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�

CREATE SYNONYM E FOR EMP;

SELECT * FROM E;  

DROP SYNONYM E;


-- ��������
-- 
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;

CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES;

CREATE VIEW EMPIDX_OVER15K AS SELECT * FROM EMPIDX WHERE SAL > 1500;


CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;

DROP SEQUENCE DEPTSEQ;

CREATE SEQUENCE DEPTSEQ
INCREMENT BY 1 
START WITH 1  
MAXVALUE 99 
MINVALUE 1 
NOCYCLE NOCACHE;

SELECT * FROM USER_SEQUENCES;

INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ.nextval, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;




