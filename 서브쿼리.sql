-- ������ �޿����� ���� �޿��� �޴� ����� ���.

-- 1. ������ �޿� �˾Ƴ��� jones 2975
SELECT sal
FROM emp
where ename = 'JONES';


-- 2. ���� �޿� ��� ����ϱ�

SELECT * FROM EMP where sal > 2975;


-- �������� : ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
-- ������ �������� : > < = <= >= �������� <> ^= !=
SELECT * FROM EMP where sal > (SELECT sal FROM emp where ename = 'JONES');


-- ����̸��� ALLEN�� ����� �߰����纸�� ���� �޴� ���
SELECT * FROM EMP where COMM > (SELECT COMM FROM emp where ename = 'ALLEN');

-- ����̸��� WARD�� ����� �Ի��Ϻ��� ���� �Ի��� ���
SELECT * FROM EMP where hiredate < (SELECT HIREDATE FROM emp where ename = 'WARD');


-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���.
SELECT * FROM EMP where deptno = 20 and sal > (SELECT avg(sal) from emp);


-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���.
-- �μ���, ������ġ
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp e, dept d
where e.deptno = d.deptno and deptno = 20 and sal > (SELECT avg(sal) from emp);



-- ������ ��������
IN
ANY
ALL
EXISTS

--�������� ����� 2���̻󳪿��� ������ ���������� ������ ���Ұ�,����
--���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
SELECT * FROM emp where sal >= (select max(sal) from emp GROUP BY deptno);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;
-- IN���
SELECT * FROM emp where sal IN (select max(sal) from emp GROUP BY deptno);

-- ANY or SOME
-- = ANY : IN�� �������� ����. / IN�� �� ���� ��� �Ѵ�.
SELECT * FROM emp where sal = ANY (select max(sal) from emp GROUP BY deptno);

SELECT * FROM emp where sal = some (select max(sal) from emp GROUP BY deptno);


-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���.
select max(sal) from emp where deptno = 30; --������

SELECT * FROM emp where sal< ANY (select max(sal) from emp where deptno = 30);
--max�� ��� ����� ����.
SELECT * FROM emp where sal< ANY (select sal from emp where deptno = 30);

select distinct sal from emp where deptno = 30; --�ߺ��� �����ϰ� ���




-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���.
SELECT * FROM emp where sal > ANY (select sal from emp where deptno = 30);





-- ALL : ���� ������ ����� ��� �����ϴ� ���������� ����
-- �μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ���
SELECT * FROM emp where sal < ALL (select sal from emp where deptno = 30);



-- EXISTS : IN�� ����� ����, IN���� ������ �����.

SELECT * FROM EMP WHERE EXISTS (select dname from dept where deptno =20);

SELECT * FROM EMP WHERE not EXISTS (select dname from dept where deptno =20);

select empno, deptno
from emp
where exists (select deptno
                from dept
                where deptno in (20,30) and emp.deptno = dept.deptno);
                
select empno, deptno
from emp
where not exists (select 1
                from dept
                where deptno in (20,30) and emp.deptno = dept.deptno);
                
                
--ppt�������� p19
--[�ǽ�1] ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, 
--�μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.

select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job_id in (select job from emp where ename = 'ALLEN');
                                
--[�ǽ�2] ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� 
--�������, �μ�����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
--(��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� 
--��� ��ȣ�� �������� ������������ �����ϱ�)

SELECT e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
FROM EMP E, dept d, SALGRADE S
WHERE e.deptno = d.deptno and E.SAL BETWEEN S.LOSAL AND S.HISAL 
                AND E.SAL > (select avg(sal) from emp)
order by e.sal desc, e.empno asc;



-- ���� �� �������� : ���������� select���� ���� �÷��� ������ ������ ���.
select * from emp where (deptno, sal) in 
                        (select deptno, max(sal) from emp group by deptno);


--FROM���� ����ϴ� ��������(�ζ��� ��)
select e.empno, e.ename, d.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) E, (select * from dept) D
where e.deptno = d.deptno;

--select ���� ����ϴ� �������� --��Į�� ��������
--ppt ����





/*[�ǽ�1] 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� 
���� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.*/

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.job not in 
     (select distinct job from emp where deptno = 30)
and e.deptno = 10;

/*[�ǽ�2] ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� 
�������,�޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�(��, ���������� Ȱ���� �� ������ �Լ��� 
����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.)*/

SELECT empno, ename, sal, 
      (select grade from salgrade where e.sal between losal and hisal) as grade
FROM emp
where sal > (select max(sal) from emp where job = 'SALESMAN');

--����
SELECT empno, ename, sal
FROM emp
where sal > all (select (sal) from emp where job = 'SALESMAN');
--ORDER BY deptno desc;


