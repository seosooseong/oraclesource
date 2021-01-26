--ȸ������, �Խñ� ���, �Ա�...

--������ dept���̺��� �����ؼ� dept_temp ���̺� ����

CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT * FROM dept_temp;

-- ������ �߰��ϱ�(���1) / �ʵ�� �ָ鼭..
insert into dept_temp(deptno, dname, loc)
values(50,'DATABASE','SEOUL');

-- ������ �߰��ϱ�(���2) / �ʵ���� ���ٸ� ��Ȯ�ϰ� ������� �Է�.
insert into dept_temp values(60,'NEWWORK','BUSAN');


--SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�
--00947. 00000 -  "not enough values"
insert into dept_temp(deptno, dname, loc) values(50,'DATABASE');

--�� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
insert into dept_temp(deptno, dname, loc) values(500,'DATABASE','SEOUL');



--NULL�����ϱ�
--��������� NULL���� (NULL, '')
insert into dept_temp(deptno, dname, loc) values(70,'DATABASE',NULL); --NULL
insert into dept_temp(deptno, dname, loc) values(80,'MOBILE',''); --''


--���������� NULL����
INSERT INTO dept_temp(deptno, loc) values (90,'INCHEON');



--EMP���̺��� �����Ͽ� EMP_TEMP���̺� ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;

--���̺� ����
DROP TABLE EMP_TEMP;

--EMP���̺��� �����Ͽ� EMP_TEMP���̺� ���� / ������ �����ϱ�
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_temp; 

DESC EMP_TEMP;
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(9999,'ȫ�浿','PRESIDENT','','2020-11-09',4000,NULL,10);

INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(8888,'������','MANAGER',NULL,'2020/10/09',3000,'',10);


--�����ݿ� "COMMIT" �ʼ� //Ŀ�� �Ϸ�.
COMMIT;







SELECT * FROM emp_temp;


-- ��¥ ������ ������ ���ʿ��� �����Ͱ� ���ԵǾ� �ֽ��ϴ�
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(7777,'����ȣ','MANAGER',NULL,'07/01/2010',4000,'',20);

--TO_DATE('07/01/2010','DD/MM/YYYY')  ��¥�����ͷ� ����.
INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values(7777,'����ȣ','MANAGER',NULL,TO_DATE('07/01/2010','DD/MM/YYYY'),4000,'',20);

INSERT INTO emp_temp(empno,ename,job,mgr, hiredate,sal, comm, deptno)
values (6666,'�̼���','MANAGER',NULL,SYSDATE,4000,NULL,20);





-- EMP���̺��� SALGRADE ���̺��� �����Ͽ� �޿� 1����� �����
-- EMP_TEMP���̺� �߰��ϰ� �ʹٸ�?????
-- ���������� �ۼ��ϱ� (�����Ͱ� �߰��Ǵ� ���̺��� �������� ���������� ������ ��ġ!)

INSERT into emp_temp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
select empno,ename,job,mgr,hiredate,sal,comm,deptno /* <-- */
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade =1;


--���� (�����Ͱ� �߰��Ǵ� ���̺��� �������� ���������� ������ ��ġ!)
INSERT into emp_temp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
select * /* <-- */
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade =1;

COMMIT;



--�ٽ� �ǵ����� "ROLLBACK"

