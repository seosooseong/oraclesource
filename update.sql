CREATE TABLE DEPT_TEMP2 AS SELECT*FROM DEPT;

SELECT * FROM DEPT_TEMP2;



-- DEPT_TEMP2�� �ִ� LOC��� ����

UPDATE dept_temp2 --���̺���
SET LOC ='SEOUL'; -- ������ ����                             



SELECT * FROM DEPT_TEMP2;


ROLLBACK; --�ǵ�����.

--  DEPT_TEMP2�� �ִ� LOC, Ư���Ͽ� ����
UPDATE dept_temp2 --���̺���
SET LOC ='SEOUL' -- ������ ����    
WHERE DEPTNO=10; -- ������Ʈ ���� DEPTNO 10����.



SELECT * FROM EMP_TEMP;
--EMP_TEMP ���̺��� ����� �߿��� �޿��� 3000������ ����� �߰������� 50���� ����
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 3000;



--�������� �̿��� ������ ����
--40�� �μ��� �μ���� ��������

SELECT * FROM dept_temp2;

UPDATE dept_temp2
SET (DNAME,LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO  =30)
WHERE DEPTNO=40;

UPDATE dept_temp2
SET LOC ='SEOUL'
WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME = 'OPERATIONS');

COMMIT;



