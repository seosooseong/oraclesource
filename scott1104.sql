-- scott ������ ������ �ִ� "���" ���̺� ����
select * from tab;

-- emp ���̺��� ���� (��ũ��Ʈ ���)
DESC emp;

-- emp�� ��� ���� ��ȸ (���� ���)
SELECT * FROM emp;

-- emp ���̺��� Ư�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

-- �ߺ� ���ڵ� ������ �� ��ȸ : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais (��Ī) : AS,  empno -> �����ȣ
SELECT empno AS �����ȣ FROM emp;

SELECT ename, sal, sal*12+comm AS ����, comm FROM emp;

SELECT ename as ����̸�, job as "�� å"From emp;

-- ORDER BY : �����Ͽ� ��ȸ
-- �ϳ��� ���� ������ �־� ��������(ASC ��������, �⺻��) ��ȸ
SELECT ename, sal FROM emp ORDER BY sal;

-- �ϳ��� ���� ������ �־� ��������(DESC) ��ȸ 
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- ��ü �����͸� ��ȸ (�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;


-- �μ���ȣ�� ��������(ASC)�̰�, �μ���ȣ�� �����ϴٸ�, �޿��� ��������(DESC)
SELECT*FROM emp ORDER BY deptno ASC, sal DESC;

-- �����ǽ� 01-- �μ���ȣ�� �������� �������� �μ���ȣ�� ���ٸ� ��� �̸� ����.
SELECT EMPNO AS  EMPLOYEE_NO, ENAME AS EMPLIYEE_NAME,JOB, MGR AS MANAGER, 
                       hiredate, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO 
FROM emp  ORDER BY deptno DESC, ename ASC;



-- WHERE : ��ȸ�� �� �� ���� �ֱ�
-- �μ���ȣ�� 30���� �����ȸ

SELECT *FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ��ȸ
SELECT*FROM emp WHERE empno =7782;

-- �μ���ȣ�� 30�̰�, ������ ��å�� salman '����Ÿ���� ''���� ���´�'���� ��ȸ
SELECT*FROM emp WHERE deptno =30 AND job = 'SALESMAN';

-- �����ȣ 7499, �μ���ȣ 30 ��ȸ
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- �μ���ȣ�� 30�̰ų�, �����å�� CLERK���� ��ȸ
SELECT * FROM emp WHERE deptno = 30 OR JOB = 'CLERK';

-- �μ���ȣ 20�̰ų�, ��� ��å�� SALESMAN
SELECT * FROM emp WHERE deptno = 20 OR JOB = 'SALESMAN';

-- �����ڸ� �̿��� ��ȸ
-- ��������� : sal*12 �� �ݾ��� 3600�� ������

SELECT * FROM emp WHERE sal *12=36000;

-- ���迬���� : > , <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F' ;

-- �������� : AND, OR
-- �޿��� 2500�̻��̰� ������ ANALYST

SELECT * FROM emp WHERE sal >= 2500 and job = 'ANALYST';

-- ���� MANAGER, SALESMAN, CLERK 
SELECT * FROM emp WHERE job = 'MANAGER' or job = 'Salesman' or job ='CLERK';

-- ������� : ���� �׸��� ������ �˻�
-- sal�� 3000�� �ƴѰ� .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   !=, <>, ^= ������� ���
SELECT * FROM emp WHERE sal !=3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^=3000;

-- IN ������
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job !='CLERK';

-- �ƴѰ� != == NOT IN
SELECT * FROM emp WHERE job NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- IN �����ڸ� ������ �μ���ȣ 10, 20 �ΰ�
SELECT * FROM emp WHERE deptno in (10, 20);

-- between a and b

-- 1) �޿��� 2000�̻� 3000������ ������� ��ȸ

SELECT * FROM emp where sal >=2000 and sal<=3000;

SELECT * FROM emp where sal between 2000 and 3000;



-- 2) �޿��� 2000�̻� 3000���� �� �ƴ� ������� ��ȸ  not between a and b
SELECT * FROM emp where sal  not between 2000 and 3000;


-- LIKE : ���ڿ� �˻� ��� (S�� �����ϴ� ~~,  H�� ������... , ��� T �� ������ - �˻�) 
-- 1)��� �̸��� s�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp where ename like 'S%';

-- 2)��� �̸��� �ι�° ���ڰ� L ����� ��ȸ   // _ L%����ٰ� �ѱ��� ���
SELECT * FROM emp where ename like '_L%';

-- 3) ��� �̸��� AM�� ���ԵǾ� �ִ� ���
SELECT * FROM emp where ename like '%AM%';

-- 4) ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ��� // NOT like
SELECT * FROM emp where ename not like '%AM%';

-- IS null
SELECT * FROM emp where comm IS null;

-- �Ŵ����� null �� ���
SELECT * FROM emp where mgr is null;
-- �Ŵ����� null �� �ƴ� ���
SELECT * FROM emp where mgr is not null;

--���տ����� :  ������ UNION, ������ INTERSECT, ������ MINUS
--deptno �� 10�� ���̺�� drptno�� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
SELECT empno, ename, sal, deptno from emp where deptno = 10
union
SELECT empno, ename, sal, deptno from emp where deptno = 20;

-- �ߺ� ��� X
SELECT empno, ename, sal, deptno from emp where deptno = 10
union
SELECT empno, ename, sal, deptno from emp where deptno = 10;

-- �ߺ����� ��� union ALL
SELECT empno, ename, sal, deptno from emp where deptno = 10
union ALL
SELECT empno, ename, sal, deptno from emp where deptno = 10;


-- �μ���ȣ�� 10�� �ƴ� ������� ������ȸ //������
SELECT empno, ename, sal, deptno FROM emp
minus
SELECT empno, ename, sal, deptno FROM emp where deptno = 10;

-- �μ���ȣ�� 10�� ������� ��ȸ //������
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp where deptno = 10;


-- 20,30���μ��� �ٹ��ϰ� �ִ� ��� �� sal �� 2000 �ʰ��� ����� ���� �ΰ���
-- ����� select���� ����Ͽ�, �����ȣ, �̸�, �޿�, �μ���ȣ ���


-- ���տ����� ������� �ʴ� ���
SELECT empno, ename, sal, deptno
from emp
where deptno in (20,30) and sal > 2000;

--���տ����ڸ� ����ϴ� ���
SELECT empno, ename, sal, deptno FROM emp where  sal > 2000 and deptno = 20
union
SELECT empno, ename, sal, deptno FROM emp where sal > 2000 and deptno = 30;




-- ����Ŭ �Լ�
-- 1) �����Լ� : �빮�� UPPER, �ҹ��� LOWER, �ܾ��� ó���� �빮�� INICTCAP
--                  length, LENGTHB
-- ename�� upper, lower, initcap���� ��ȯ�Ͽ� ��ȸ

select ename, upper (ename), lower (ename) , initcap (ename) 
from emp;

-- deul ���̺� �̿� (sys�� �����ϰ� �ִ� ���̺�� �ӽ� �����̳� �Լ��� ��� �� Ȯ�ο뵵)
select length ('�ѱ�'), lengthb ('�ѱ�')
from dual;


-- ��å �̸��� 6���� �̻��� ������� ���� ����
select * from emp where length (job) >=6;

-- ���ڿ� �Լ� : substr
select job from emp;
select job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

--                  -length(job) = -5
select job, substr(job,-length(job)), substr(job,-length(job),2), substr(job,-3) 
from emp;




-- ���忭 �Լ� : instr (Ư�� ���� ��ġ ã��)

SELECT INSTR ('HELLO, ORACLE', 'L') as instr_1,
            INSTR ('HELLO, ORACLE', 'L', 5) as instr_2,
            INSTR ('HELLO, ORACLE', 'L', 2, 2) as instr_3
From dual;


-- ���ڿ��Լ� : replace (ã�Ƽ� �ٲٱ�)

select replace ('�̰��� oracle�̴�','�̰���','This is')
from dual;

select '010-8620-0439' as REPLACE_BEFORE,
            REPLACE('010-8620-0439','-', ' ') as REPLACE_1
            --REPLACE('010-8620-0439', '-') as REPLACE_2
            
from dual;

-- ���ڿ� �Լ� : CONcaT(����)
-- empno, ename�� �����Ͽ� ��ȸ

select concat (empno,ename), concat(empno, concat(':', ename))
from emp
where ename = 'SCOTT';


-- || : ������ �ǹ̷� ���
select empno||ename, empno || ':' || ename
from emp
where ename = 'SCOTT';


-- ���ڿ� �Լ� : TRIM (��������), LTRIM (���ʰ�������), RTRIM (�����ʰ�������)
SELECT '   �̰���   ', TRIM ('      �̰���    ' )
FROM dual;

-- ���ڿ� �Լ� : reverse (�Ųٷ� ���)
select reverse('Oracle') from dual;


--2. �����Լ� : ROUND (�ݿø�), TRUNC (����), CEIL(�Էµ� ���ڿ� ����� ū ����),
-- FLOOR( �Էµ� ���ڿ� ����� ����), NOD(������)

--ROUND (�ݿø�)
select    ROUND(1234.5678) as ROUND,  
            ROUND(1234.5678,0) as ROUND_1,  
            ROUND(1234.5678,1) as ROUND_2, 
            ROUND(1234.5678,-1) as ROUND_MINUS, 
            ROUND(1234.5678,-2) as ROUND_MINUS2
from DUAL;

--TRUNC (����)
select    trunc(1234.5678) as trunc,  --�Ҽ�ù°�ڸ�
            trunc(1234.5678,0) as trunc_1, 
            trunc(1234.5678,1) as trunc_2, 
            trunc(1234.5678,-1) as trunc_MINUS,
            trunc(1234.5678,-2) as trunc_MINUS2
from dual;


--CEIL(�Էµ� ���ڿ� ����� ū ����),FLOOR( �Էµ� ���ڿ� ����� ����)

select ceil(3.14),  floor(3.14), ceil(-3.14), floor(-3.14)
from dual;


--Mod(���� ������)

select mod(15,6), mod(10,2), mod(11,2)
from dual;

--3.��¥ �Լ� : sysdate,current_date, current_timestamp

select sysdate, current_date, current_timestamp from dual;

--��¥�����ʹ� ������ ���� : ��¥������ +1,-1 , ��¥������ - ��¥ ������
--��¥������ + ��¥�����ʹ� �ȵ�.

SELECT sysdate as now, sysdate-1 as yesterday, sysdate +1 as tomorrow
from dual;



-- ��¥�Լ� : add_months
select sysdate,  add_months(sysdate,3) from dual;

-- �Ի�10�ֳ��� �Ǵ� ����� ��ȸ
select empno, ename, hiredate, add_months(hiredate,120)
from emp;

-- �Ի� 38�� �̸���� ��ȸ
select * FROM emp where add_months(hiredate, 456) > sysdate;


--��¥�Լ� : months_between(�γ�¥ ������ ����)
SELECT * FROM emp where months_between(sysdate, hiredate) < 456;

SELECT empno, ename, hiredate, sysdate, months_between(hiredate, sysdate) as months1,
months_between(sysdate, hiredate) as month2, trunc(months_between(hiredate, sysdate))
from emp;

-- ��¥�Լ� : next_day, last_day
select sysdate, next_day(sysdate, '������'), last_day(sysdate)
from dual;



-- 4. ����ȯ�Լ�
-- to_char (����, ��¥ �����͸� ���� ��ȯ)
-- to_number (���� �����͸� ���� ������ ��ȯ)
-- to_date (���� �����͸� ��¥ ������ ��ȯ)

select to_char(sysdate, 'yyyy/mm/dd') as ���糯¥ from dual;
select to_char(sysdate, 'mm') as ���糯¥ from dual;
select to_char(sysdate, 'mon') as ���糯¥ from dual;
select to_char(sysdate, 'dd') as ���糯¥ from dual;
select to_char(sysdate, 'mon/day') as ���糯¥ from dual;
select to_char(sysdate, 'hh:mi:ss') as ���糯¥ from dual;
select to_char(sysdate, 'hh12:mi:ss') as ���糯¥ from dual;
select to_char(sysdate, 'hh24:mi:ss am') as ���糯¥ from dual;
select to_char(sysdate, 'hh24:mi:ss pm') as ���糯¥ from dual;



--���� ��¥�� �� /��/�� 16:51:45 ǥ��
select to_char(sysdate, 'yyyy:mm:dd hh24:mi:ss') as ���ó�¥ from dual;

select 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 from dual;
select 1300-'1500', '1300'+1500 from dual;

-- ���� 
-- select TO_NUMBER('1,300') - TO_NUMBER ('1,500') FROM DUAL;
-- 9,0 (������ ���ڸ��� �ǹ���), 9: ���ڸ��� ä���� �ʴ� ����, 0: ���ڸ��� ä��� ����
select TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500','999,999') from dual;

select sal, to_char(sal, '$999,999') as sla_$,
        to_char(sal, 'L999,999') AS SAL_L,
        to_char(sal, '$999,999.00') AS SAL_L1,
        to_char(sal, '000,999,999.00') AS SAL_2,
        to_char(sal, '000999999.99') AS SAL_3,
        to_char(sal, '999,999,00') AS SAL_4
        FROM EMP;
        

select to_date('2020-11-05', 'yyyy/mm/dd') as todate1,
        to_date('20201105', 'yyyy-mm-dd') as tpdate2 from dual;
        
        
        
        
-- 1981�� 6�� 1�� ���Ŀ� �Ի��� ������� ��ȸ
select * from emp
where hiredate > to_date('1981-06-01','yyyy-mm-dd');


SELECT to_date('2019-12-20','yyyy-mm-dd') 
         - to_date('2019-10-20', 'yyyy-mm-dd') from dual;
         


-- ��ó�� �Լ�
-- nvl : �� �Ǵ� �����͸� �Է��Ͽ� �ش� �����Ͱ� NULL�� �ƴ� ��� 
--        �����͸� �״�� ��ȯ�ϰ�, NULL�� ��� ������ �����͸� ��ȯ

-- nvl2 : �� �Ǵ� �����͸� �Է��Ͽ� �ش� �����Ͱ� 
--          NULL�� �ƴ� ���� NULL�� �� ��� �����͸� ���� ����


select empno, ename, sal, comm, sal+comm from emp;

select empno, ename, sal, comm, sal+comm, nvl(comm,0), sal+nvl(comm, 0)
from emp;

select empno, ename, sal, comm, sal+comm, nvl2(comm,'O','X'),
        nvl2(comm, SAL*COMM,SAL*12) AS ANNSAL
from emp;


-- DECODE �Լ��� CASE��
-- job�� manager,  SALESMAN, ANALYST ��� �ٸ� ������ �����ϰ� �ʹٸ�?

SELECT empno, ename, job, sal, decode(job,
                                                        'manager', sal*1.1,
                                                        'salesman', sal*1.05,
                                                        'analyst', sal,
                                                        sal*1.03) as upsal 
from emp;

------------------case���� �� �� ���---------------------

SELECT empno, ename, job, sal, case job 
                                            when 'manager' then sal*1.1
                                            when'salesman'then sal*1.05
                                            when 'analyst'then sal
                                            else sal*1.03
                                    end as upsal 
from emp;

SELECT empno, ename, job, sal, case job 
                                            when comm then '�ش���׾���'
                                            when comm = 0 then '�������'
                                            when comm>0 then '���� : ' || comm
                                        end as COMM_TEXT 
from emp;


SELECt *FROM emp;






-- [�ǽ�1] ������ ���� ����� �������� SQL���� �ۼ��Ͻÿ�.
--EMP ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5���̴�. 
--�Ϸ� �ٹ� �ð��� 8�ð����� ������ �� ������� �Ϸ� �޿�(DAY_PAY)�� 
--�ñ�(TIME_PAY)�� ����Ͽ� ����� ����Ѵ�. ��, �Ϸ� �޿��� �Ҽ��� ��° �ڸ����� ������, 
--�ñ��� �� ��° �Ҽ������� �ݿø��Ͻÿ�.


SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;



--comm IS null

--[�ǽ�2] EMP ���̺��� ������� �Ի���(HIREDATE) ������ ���� �� 
--ù �����Ͽ� �� �������� �������� �ȴ�. ������� �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD �������� 
--�Ʒ��� ���� ����Ͻÿ�. ��, �߰�����(COMM)�� ���� ����� �߰� ������ N/A�� ���.

SELECT empno, ename, HIREDATE, NEXT_DAY(add_months(hiredate,3),'������)' as R_JOB, 
            nvl(TO_CHAR(comm), 'N/A') as comm
FROM emp;

SELECT empno, ename, HIREDATE, add_months(hiredate,3) as R_JOB, 
            nvl(TO_CHAR(comm), 'N/A') as comm
--nvl(comm,to_char('N/A'))  X
FROM emp;






--[�ǽ�3] EMP ���̺��� ��� ����� ������� ���� ����� ��� ��ȣ(MGR)�� 
--������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR ���� ����Ͻÿ�.
--���ӻ���� ��� ��ȣ�� �������� ���� ��� : 0000
--���ӻ���� ��� ��ȣ �� ���ڸ��� 75�� ��� : 5555
--���ӻ���� ��� ��ȣ �� ���ڸ��� 76�� ��� : 6666
--���ӻ���� ��� ��ȣ �� ���ڸ��� 77�� ��� : 7777
--���ӻ���� ��� ��ȣ �� ���ڸ��� 78�� ��� : 8888
--�� �� ���� ��� ��� ��ȣ�� ��� : ���� ���� ����� �����ȣ �״�� ���


SELECT SUBSTR(TO_CHAR(MGR),1,2) FROM EMP; 

SELECT empno,ename,mgr,
       DECODE(SUBSTR(TO_CHAR(mgr),1,2),
            null, '0000',
            '75', '5555',
            '76', '6666',
            '77', '7777',
            '78', '8888',
            TO_CHAR(mgr)) AS CHG_MGR
FROM emp;


--HAVING : GROUP BY ���� ������ �� �� ���
--�� �μ��� ��å�� ��� �޿��� ���ϵ� �� ��� �޿��� 2000�̻��� �׷츸 ���
 
 SELECT deptno, job, avg(sal) as ���
 FROM emp
 group by deptno, job
 HAVING avg(sal) >=2000
 order by deptno,job;


/*[�ǽ�1] EMP ���̺��� �̿��Ͽ� �μ���ȣ(DEPTNO), ��ձ޿�(AVG_SAL), 
�ְ�޿�(MAX_SAL), �����޿�(MIN_SAL), �����(CNT)�� ����Ѵ�. 
��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� 
�� �μ���ȣ���� ����ϴ� SQL ���� �ۼ��Ͻÿ�. */

select deptno, floor(avg(sal)) as avg_sal, max(sal) as max_sal, 
        min(sal) as min_sal, count(empno) as cnt
from emp
group by deptno;



/*[�ǽ�2] ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ���*/
SELECT  * FROM emp;

SELECT job, count(job)
FROM emp
group by job having count(job) >= 3;


/*[�ǽ�3] ������� �Ի翬��(HIRE_YEAR)�� �������� �μ����� �� ���� �Ի��ߴ��� ��� 
select hiredate as HIRE_YEAR , count(deptno)
form emp 
group by hiredate, count(deptno);*/

select to_char (hiredate, 'yyyy') as HIRE_YEAR , deptno, count (*) as cnt
FROM emp
group by deptno, to_char (hiredate, 'yyyy')
order by to_char (hiredate, 'yyyy') desc;

select to_char (hiredate, 'yyyy') as HIRE_YEAR , deptno, count (*) as cnt
FROM emp
group by deptno, to_char (hiredate, 'yyyy')
order by to_char (hiredate, 'yyyy') desc;







