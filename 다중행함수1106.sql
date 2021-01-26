SELECT*FROM emp;

--�ȵ� X
SELECT ename, sum(sal) from emp;

--�ϳ��� �ุ ����ϱ⶧�� o
SELECT sum(sal) from emp;

-- SUM : �հ�
SELECT sum(sal),sum(DISTINCT sal),sum(ALL sal) from emp;

-- COUNT : ����
SELECT count(*) FROM emp;
--14���� �����͸� ������ ����.

 --�μ���ȣ�� 30���� ������ 
 select count(*) from emp where deptno = 30;

 SELECT count(sal),count(DISTINCT sal),count(ALL sal) from emp;
 
 
 --MAX �ִ밪 / MIN �ּҰ�

--����(sal) �ִ� �ּ�
 SELECT max(sal), min(sal) from emp; 
 
 
 --�μ���ȣ�� 20�� ����� �Ի��� �� ���� �ֱ�(max) �Ի��� ���ϱ�
 select max(hiredate) from emp where deptno =20;
 
 
 -- AVG : ���(AVERAGE)
select avg(sal) from emp;
 
 select avg(sal) from emp where deptno=30;
 
 --�ߺ��� ����....
select avg(DISTINCT sal) from emp;



--�μ��� ������ ����� �˰� �ʹٸ�??
select avg(sal) from emp where deptno=10;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;
  
--group by : ������� ���ϴ� ���� ���� ���.
select deptno,avg(sal) from emp  GROUP BY deptno;

--�μ���ȣ�� �߰� ���� ��� ���ϱ�.
SELECT deptno, avg(comm) from emp group by deptno;
 
 
 --�μ���ȣ, ��å�� �޿� ��� ���ϱ�
 SELECT deptno, avg(sal) as �������, job as ��å 
 from emp 
 group by deptno, job ORDER BY deptno,job;
 
 
 -- group by ���� ���� �ȵǴ� ���� select���� �����ϸ� �ȵ�.
 SELECT ename, deptno, avg(sal)
 from emp
 GROUP BY deptno;  --���� ename ����� �����ϱ� ������ ����.
 
 
 --HAVING : GROUP BY ���� ������ �� �� ���
 
/*SELECT deptno, job, avg(sal) as ���
 FROM emp
where avg(sal) >=2000
group by deptno, job
 order by deptno,job;
 */
 
 
 -- emp���̺��� "�μ���" "��å"�� ��� �޿��� 500�̻��� ������� 
 -- �μ���ȣ, ��å, �μ��� ��å�� ��ձ޿� ���.
 
select deptno, job, avg(sal)
from emp
group by deptno, job having avg(sal) >= 500;
 
 
 select deptno, job, avg(sal)
 from emp
 where sal <=3000
group by deptno, job having avg(sal) >= 2000
order BY deptno, job;


-- ���� join

SELECT * FROM emp, dept ORDER by empno;
SELECT count(*) FROM emp, dept ORDER by empno;  --56�� = 14*4

SELECT * FROM dept; --4��
SELECT * FROM emp; --14��

-- 1) �������� (�����)
select *  --emp�������� ���
from emp, dept
where emp.deptno = dept.deptno  --���α��� / ���ٸ� ��� ������.
ORDER by empno;

--������.

SELECT *  
FROM emp e, dept d 
where e.deptno = d.deptno  --���α��� / ���ٸ� ��� ������.
ORDER by empno;


SELECT *  
FROM emp E INNER JOIN dept D  --emp E dept D ��Ī�� �ٿ��ָ� �ܼ��ϰ� �۾� ����.
ON E.deptno = D.deptno --���α���
ORDER BY empno;





-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ������ �� ������ ��Ȯ�� ���.

SELECT empno, ename, job, d.deptno, dname   --deptno ������ ���� / d.deptno���� ��Ȯ�ϰ�
FROM emp e, dept d 
where e.deptno = d.deptno  --���α��� 
ORDER by empno;



--emp���̺�� dept���̺��� �����Ͽ� ENPNO,ENAME, SAL, DEPTNO
--DNAME, LOC�� ��ȸ�Ѵ�. //�� �޿��� 3000 �̻��� ����� ���.

Select E.Empno, E.Ename, E.Sal, D.Deptno, D.Dname, D.Loc
From Emp E, Dept D
Where E.Deptno = D.Deptno And Sal >= 3000;


--emp���̺��� ��Ī�� e�� dept���̺� ��Ī�� d�� �Ͽ�
--�޿��� 2500�����̰� �����ȣ�� 9999������ ��� ����

Select *
From Emp E, Dept D
where E.Deptno = D.Deptno and Sal >= 2500 
                          and empno <= 9999;


--emp���̺��� ��Ī�� e�� selgrade���̺� ��Ī�� s�� �Ͽ�
--�� ����� ������ // ����� ��� ���� ���
Select * from salgrade;

Select *
From Emp E, salgrade s
where E.sal between s.losal and s.hisal;

--2) ��������(��ü����) ���� ���̺��� �ڱ� �ڽ� ���̺��ϋ�

SELECT * FROM emp;

select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;  --13��, kig�� �Ŵ����� ����.

--3) outer join(�ܺ�����) : ������ �������� �ʴ� �����͵� ����


select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1 LEFT OUTER JOIN emp e2 --KING�� ���. 14��
ON e1.mgr = e2.empno;


select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr  = e2.empno(+); --���صǴ°��� (+) ���δ�.


-- 2)RIGHT OUTER JOIN

select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1 RIGHT OUTER JOIN emp e2 
ON e1.mgr = e2.empno;



select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr(+)  = e2.empno;



-- PPT ��������
-- �޿��� 2000�ʰ��� ������� �μ� ����, ��� ������ �Ʒ��� ���� ����ϴ� SQL ���� �ۼ�
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL>2000 ORDER BY E.DEPTNO;



-- �� �μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, ������� ����ϴ� SQL���� �ۼ�

SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL, COUNT(DNAME)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

-- ��� �μ������� ��� ������ �Ʒ��� ���� �μ���ȣ, ����̸� ������ �����Ͽ� ����ϴ� SQL���� �ۼ�

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.EMPNO;


-- ��� �μ������� ��� ����, �޿���� ����, �� ����� ���� ����� ���� �μ���ȣ, 
-- �����ȣ ������ �����Ͽ� ����ϴ� SQL���� �ۼ�
SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL,S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 
RIGHT OUTER JOIN DEPT D1 ON E1.DEPTNO = D1.DEPTNO
LEFT OUTER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO
ORDER BY D1.DEPTNO, E1.EMPNO;


SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL,S.HISAL,S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, DEPT D1, SALGRADE S, EMP E2
WHERE E1.DEPTNO(+) = D1.DEPTNO AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) AND E1.MGR = E2.EMPNO(+)
ORDER BY E1.DEPTNO;








