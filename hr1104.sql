-- hr ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- employees  ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;

-- ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- �����ȣ�� 176, ����� last_name�� �μ���ȣ ��ȸ
SELECT  last_name, department_id FROM Employees WHERE  Employee_Id = 176 ;

-- ������ 1200 �̻�(>=) �Ǵ� ��������  last_name �� ���� ��ȸ
SELECT last_name, salary*12 AS ���� FROM employees WHERE salary >= 1200;

-- ������ 5000���� 1200�� ���� �̿��� ������� last_name �� ���� ��ȸ
SELECT last_name, salary*12 AS ���� FROM employees WHERE Salary <= 5000 OR salary >= 1200;

--20�� �� 50�� �μ����� �ٹ��ϴ� ������� LAST_NAME �� �μ���ȣ�� ���ĺ� ������
select last_name, department_id from employees 
where department_id >= 20 and department_id <=50 ;

--Ŀ�̼��� ���� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ, �� ������ ����
select LAST_NAME, SALARY*12, COMMISSION from EMPLOYEES;

-- ������ 2500, 3500, 7000 �� �ƴϸ� ������ SA_REP �̳� ST__CLERK�� ��� ��ȸ
SELECT * FROM employees where salary NOT in (2500, 3500, 7000) 
and Job_Id in ('SA_REP','ST__CLERK') ;

-- 200/02/08 ~ 2008/05/01 ���̿� ���� ������� LAST_NAME, �����ȣ, ������� ��ȸ
-- �� ������� ��������
SELECT last_name,  employee_id, HIRE_DATE FROM employees ORDER BY HIRE_DATE desc;

--2004�⵵�� ���� ��� ������� last_name �� ������� ��ȸ�Ͽ� �Ի��� �������� ��������
-- �������� (ASC ��������, �⺻��)
select last_name, hire_date
from employees 
where hire_date >= '04-01-01' and hire_date <='2004-12-31' order by hire_date; 

SELECT last_name, hire_date
FROM employees
where hire_date between '04-01-01' and '2004-12-31' order by hire_date; 


-- ������ 5000���� 12000�� ������ �ְ�
-- 20 or 50�� �μ��� �ٹ��ϴ� ������� ���� ��ȸ ��������
-- last_name, salary

SELECT last_name, salary 
from employees 
where department_id in (20,50) and salary between 5000 and 12000 order by salary;

-- 2004�⵵ ���� ��� ������� last_name �� �� ������ ��ȸ�Ͽ� �Ի��� ���� ��������
SELECT last_name, hire_date
FROM employees
where hire_date between '04-01-01' and '2004-12-31' order by hire_date; 

-- ������ 5000~12000 ���� �̿��� ������� last_name, salary ��ȸ
SELECT last_name, salary
from employees
where salary not between 5000 and 12000;




-- 2004�⵵ ���� ��� ������� last_name �� �� ������ ��ȸ�Ͽ� �Ի��� ���� ��������
SELECT last_name, hire_date FROM employees
where hire_date like '04%' order by hire_date; 

-- last_name�� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT employee_id, last_name FROM employees where last_name like '%u%';

-- last_name �� 4��° ���ڰ� a�� ������� last_name ���
SELECT last_name FROM employees where last_name like '___a%';


-- last_name �� a Ȥ�� e ���ڰ� �ִ� ������� last_name ���

--  last_name like '%a%' and last_name like '%e%'

-- last_name�������� �������� ����

SELECT last_name FROM employees 
where last_name like '%a%' or last_name like '%e%' order by last_name;

SELECT last_name FROM employees 
where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;


-- IS null ����
--�Ŵ����� ���� ������� last_name, job_id ��ȸ
SELECT last_name, job_id  
FROM employees 
where manager_id is null; 

-- st_clerk�� job_id�� ���� ����� ���� �μ� ID��ȸ, �μ� ��ȣ�� null�� �� ����
-- distinct �ߺ�����
SELECT distinct department_id 
FROM employees 
where job_id not in ('st_clerk') and department_id is not null;

-- Commission_Pct �� Null�� �ƴ� ����� �߿��� Commission = Salary * Commission_Pct
-- �� ���Ͽ� EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT employee_id, first_name, job_id , Salary * Commission_Pct as Commission
FROM employees 
where commission_pct is  not null;



-- [�ǽ�] ���ڿ��Լ�
-- 1.first_name�� Curitis �� ����� first_name, last_name,email, phone_number,
-- job_id �� ��ȸ�Ѵ�. ��, job_id�� ����� lower �ҹ��ڷ� ���

select first_name, last_name, email, phone_number, lower(job_id)
from employees where first_name = 'Curtis';


--2. �μ���ȣ�� 70,80,90�� ������� employee_id, first_name, hire_date, job_id�� ��ȸ�Ѵ�.
--jop_id�� it_prog�� ����� ��� ���α׷��� ����

select employee_id, first_name, hire_date, replace (job_id, 'IT_PROG','���α׷���')
from employees where department_id in(60,70,80,90) ;



--3. job_id�� Ad_Pres, Pu_Clerk�� ������� employee_id, first_name, last_name, department_id, job_id
-- �� ��ȸ�Ͻÿ�, �� ������� first_name, last_name �����Ͽ� ����Ѵ�.

select employee_id, concat (first_name,concat('. ', last_name)), department_id, job_id
from employees
where job_id in('AD_PRES', 'PU_CLERK');



--[�ǽ�4] �μ� 80�� �� ����� ���� ���� ������ ������ ǥ���Ͻÿ�.
SELECT  *FROM employees;

--case��
select last_name, salary, case 
                                 when salary < 2000 then 0
                                 when (salary < 4000) then 0.09
                                when (salary < 6000) then 0.2
                                when (salary < 8000) then 0.3
                                when (salary < 10000) then 0.4
                                when (salary < 12000) then 0.42
                                when (salary < 14000) then 0.44
                               else 0.45
                               end as TAX_RATE 
from employees 
where department_id in (80);

              
--decode��
select last_name, salary, DECODE(TRUNK(salary/2000,0),
                                                        0,0.00,
                                                        1,0.09,
                                                        2,0.20,
                                                        3,0.30,
                                                        4,0.40,
                                                        5,0.42,
                                                        6,0.44,
                                                        0.45) as TAX_RATE 
 from employees where department_id in (80);
 
 SELECT* FROM employees;
 
 --������ �Լ� ����
 -- ȸ�� ���� �ִ� ���� �� �ּ� ���� ���̸� ��ȸ
 select max(salary) - min(salary) from employees; 
 
 --�Ŵ��� �ٹ��ϴ� ������� �ο��� ��ȸ 106��
select count(manager_id) as �Ŵ��� from employees ; 

--�Ŵ��� �ߺ����� ���� 18��
select count(distinct manager_id) as �Ŵ��� from employees ; 
 
  SELECT* FROM employees;
  
  
  
  
  
  
  
  
 --�μ��� ������ ���� ���Ͽ� �μ���ȣ�� ������������ ���
SELECT count(employee_id), department_id
FROM employees 
GROUP by department_id
ORDER BY department_id;
 
 
 
 
 
 -- �μ��� �޿��� ��տ����� ����ϰ� 
 -- ��տ����� ������ ������
 -- �μ���ȣ�� ������������ ����
--������ ����

SELECT round(avg(salary),0) as �������, department_id
from employees
group by department_id ORDER BY department_id;

--��
SELECT department_id, TRUNC (avg(salary)) as �������
from employees
group by department_id ORDER BY department_id;
 
 
 
 
 --������ ������ ���� ������� �������� ��ȸ
 SELECT job_id, count(employee_id)
 from employees
 GROUP BY job_id;
 
 
 
 
 
-- JOIN �ǽ�

--�ڽ��� ��� �Ŵ����� ����� ���� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME,
--MANAGER_ID�� ��� (EMPLOYEES SELF JOIN) -> 37


select E1.HIRE_DATE, E1.LAST_NAME, e1.HIRE_DATE AS ���Ի���,
      E1.MANAGER_ID, E2.HIRE_DATE AS �Ŵ����Ի���
From employees E1, employees E2
where e1.manager_id = e2.manager_id and e1.hire_date < e2.hire_date;




-- ���� �̸��� T�� �����ϴ� ������ ��� ������� ���,LAST_NAME,�μ���ȣ ��ȸ
-- (EMPLOYEES �� DEPARTMENT_ID�� DEPARTMENTS�� DEPARTMENT_ID ���� ��
-- DEPARTMENTS �� LOCATION_ID��  LOCATIONS�� LOCATION_ID ����) =>2�� ����:

select employee_id, last_name, D.department_id, L.CITY --d.department_id D.���� ��Ȯ�ϰ�
from EMPLOYEES E,DEPARTMENTS D,LOCATIONS L --��Ī���� ���Խ���
where E.DEPARTMENT_ID = d.department_id AND 
      D.location_id = L.location_id and city like 'T%';



-- ��ġ ID�� 1700�� ������ ������� EMPLOYEE_ID, LAST_NAME, 
-- DEPARTMENT_ID, SALARY ��ȸ (EMPLOYEE, DEPARTMENS ����) // ����: 18��

select employee_id, last_name, D.department_id, salary 
from EMPLOYEES E,DEPARTMENTS D --��Ī���� ���Խ���
where E.DEPARTMENT_ID = d.department_id AND 
        D.LOCATION_ID = 1700;



--DEPARTMENT_NAME, LOCATION_ID, �� �μ��� �����, �� �μ��� ��� ���� ��ȸ
--(EMPLOYEE, DEPARTMENS ����)


select d.department_name, d.location_id, count(employee_id), round(avg(salary),2)
from EMPLOYEES E,DEPARTMENTS D
where E.DEPARTMENT_ID = d.department_id
GROUP BY d.department_name, d.loction_id;        



--EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID��ȸ
--(EMPLOYEE, DEPARTMENS ����)

select LAST_NAME, D.department_name, job_id
from EMPLOYEES E, DEPARTMENTS D
where E.DEPARTMENT_ID = d.department_id and d.department_name = 'Executive';



--������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID��ȸ
--(EMPLOYEE, JOB_HISTORY ����)

select e.employee_id, e.job_id
from EMPLOYEES E, job_history j
where E.employee_id = j.employee_id and e.job_id = j.job_id;




--�� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� 
--����� �����ϴ� ��� ������� LAST_NAME�� ��ȸ. || ' ' || ����
-- employees self join

select e1.department_id, e1.first_name || ' ' || e1.last_name as name
from EMPLOYEES E1, EMPLOYEES E2
where E1.department_id = e2.department_id 
     and e1.hire_date < e2.hire_date and e1.salary < e2.salary;
     
     

-- �������� �ǽ�

-- ȸ�� ��ü �������� �� ���� �޴� ������� last_name, salary
select last_name, salary
FROM employees
where salary > (select avg(salary) from employees);

-- last_name�� u�� ���ԵǴ� ������ ���� �μ� �ٹ��ϴ� employee_id, last_name

select employee_id, last_name
from employees
where department_id in (select distinct department_id
                        from employees
                        where last_name like '%u%');


-- no exists �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ��� ��ȸ

select first_name ||' '|| last_name as name
from employees e1
where not exists (select distinct manager_id 
                  from employees e2 
                  where e1.employee_id = e2.manager_id);
                  
                  
                  
select first_name ||' '|| last_name as name
from employees e1
where e1.employee_id not in (select distinct manager_id 
                     from employees e2 
                     where e1.employee_id = e2.manager_id);


 
 