-- hr 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- employees  테이블 전체 내용 조회
SELECT * FROM employees;

-- 테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 사원번호가 176, 사람의 last_name와 부서번호 조회
SELECT  last_name, department_id FROM Employees WHERE  Employee_Id = 176 ;

-- 연봉이 1200 이상(>=) 되는 직원들의  last_name 및 연봉 조회
SELECT last_name, salary*12 AS 연봉 FROM employees WHERE salary >= 1200;

-- 연봉이 5000에서 1200의 번위 이외의 사람들의 last_name 및 연봉 조회
SELECT last_name, salary*12 AS 연봉 FROM employees WHERE Salary <= 5000 OR salary >= 1200;

--20번 및 50번 부서에서 근무하는 사원들의 LAST_NAME 및 부서번호를 알파벳 순서로
select last_name, department_id from employees 
where department_id >= 20 and department_id <=50 ;

--커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회, 단 연봉의 역순
select LAST_NAME, SALARY*12, COMMISSION from EMPLOYEES;

-- 연봉이 2500, 3500, 7000 이 아니며 직업이 SA_REP 이나 ST__CLERK인 사람 조회
SELECT * FROM employees where salary NOT in (2500, 3500, 7000) 
and Job_Id in ('SA_REP','ST__CLERK') ;

-- 200/02/08 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, 사원번호, 고용일자 조회
-- 단 고용일자 내림차순
SELECT last_name,  employee_id, HIRE_DATE FROM employees ORDER BY HIRE_DATE desc;

--2004년도에 고용된 모든 사람들의 last_name 및 고용일을 조회하여 입사일 기준으로 오름차순
-- 오름차순 (ASC 생략가능, 기본값)
select last_name, hire_date
from employees 
where hire_date >= '04-01-01' and hire_date <='2004-12-31' order by hire_date; 

SELECT last_name, hire_date
FROM employees
where hire_date between '04-01-01' and '2004-12-31' order by hire_date; 


-- 연봉이 5000에서 12000의 범위에 있고
-- 20 or 50번 부서에 근무하는 사람들의 연봉 조회 오름차순
-- last_name, salary

SELECT last_name, salary 
from employees 
where department_id in (20,50) and salary between 5000 and 12000 order by salary;

-- 2004년도 고용된 모든 사람들의 last_name 및 고 용일을 조회하여 입사일 기준 오름차순
SELECT last_name, hire_date
FROM employees
where hire_date between '04-01-01' and '2004-12-31' order by hire_date; 

-- 연봉이 5000~12000 범위 이외의 사람들의 last_name, salary 조회
SELECT last_name, salary
from employees
where salary not between 5000 and 12000;




-- 2004년도 고용된 모든 사람들의 last_name 및 고 용일을 조회하여 입사일 기준 오름차순
SELECT last_name, hire_date FROM employees
where hire_date like '04%' order by hire_date; 

-- last_name에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT employee_id, last_name FROM employees where last_name like '%u%';

-- last_name 에 4번째 글자가 a인 사람들의 last_name 출력
SELECT last_name FROM employees where last_name like '___a%';


-- last_name 에 a 혹은 e 글자가 있는 사원들의 last_name 출력

--  last_name like '%a%' and last_name like '%e%'

-- last_name기준으로 오름차순 정렬

SELECT last_name FROM employees 
where last_name like '%a%' or last_name like '%e%' order by last_name;

SELECT last_name FROM employees 
where last_name like '%a%e%' or last_name like '%e%a%' order by last_name;


-- IS null 연습
--매니저가 없는 사람들의 last_name, job_id 조회
SELECT last_name, job_id  
FROM employees 
where manager_id is null; 

-- st_clerk인 job_id를 가진 사원이 없는 부서 ID조회, 부서 번호가 null인 값 제외
-- distinct 중복제외
SELECT distinct department_id 
FROM employees 
where job_id not in ('st_clerk') and department_id is not null;

-- Commission_Pct 가 Null이 아닌 사원들 중에서 Commission = Salary * Commission_Pct
-- 를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID와 같이 조회
SELECT employee_id, first_name, job_id , Salary * Commission_Pct as Commission
FROM employees 
where commission_pct is  not null;



-- [실습] 문자열함수
-- 1.first_name이 Curitis 인 사람의 first_name, last_name,email, phone_number,
-- job_id 를 조회한다. 단, job_id의 결과는 lower 소문자로 출력

select first_name, last_name, email, phone_number, lower(job_id)
from employees where first_name = 'Curtis';


--2. 부서번호가 70,80,90인 사람들의 employee_id, first_name, hire_date, job_id를 조회한다.
--jop_id가 it_prog인 사원의 경우 프로그래머 변경

select employee_id, first_name, hire_date, replace (job_id, 'IT_PROG','프로그래머')
from employees where department_id in(60,70,80,90) ;



--3. job_id가 Ad_Pres, Pu_Clerk인 사원들의 employee_id, first_name, last_name, department_id, job_id
-- 를 조회하시오, 단 사원명은 first_name, last_name 연결하여 출력한다.

select employee_id, concat (first_name,concat('. ', last_name)), department_id, job_id
from employees
where job_id in('AD_PRES', 'PU_CLERK');



--[실습4] 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오.
SELECT  *FROM employees;

--case문
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

              
--decode문
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
 
 --다중행 함수 연습
 -- 회사 내의 최대 연봉 및 최소 연봉 차이를 조회
 select max(salary) - min(salary) from employees; 
 
 --매니저 근무하는 사원들의 인원수 조회 106인
select count(manager_id) as 매니저 from employees ; 

--매니저 중복값을 제외 18인
select count(distinct manager_id) as 매니저 from employees ; 
 
  SELECT* FROM employees;
  
  
  
  
  
  
  
  
 --부서별 직원의 수를 구하여 부서번호의 오름차순으로 출력
SELECT count(employee_id), department_id
FROM employees 
GROUP by department_id
ORDER BY department_id;
 
 
 
 
 
 -- 부서별 급여의 평균연봉을 출력하고 
 -- 평균연봉은 정수만 나오게
 -- 부서번호별 오름차순으로 정렬
--선생님 샘플

SELECT round(avg(salary),0) as 월급평균, department_id
from employees
group by department_id ORDER BY department_id;

--나
SELECT department_id, TRUNC (avg(salary)) as 월급평균
from employees
group by department_id ORDER BY department_id;
 
 
 
 
 --동일한 직업을 가진 사원들의 직원수를 조회
 SELECT job_id, count(employee_id)
 from employees
 GROUP BY job_id;
 
 
 
 
 
-- JOIN 실습

--자신의 담당 매니저의 고용일 보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME,
--MANAGER_ID를 출력 (EMPLOYEES SELF JOIN) -> 37


select E1.HIRE_DATE, E1.LAST_NAME, e1.HIRE_DATE AS 내입사일,
      E1.MANAGER_ID, E2.HIRE_DATE AS 매니저입사일
From employees E1, employees E2
where e1.manager_id = e2.manager_id and e1.hire_date < e2.hire_date;




-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번,LAST_NAME,부서번호 조회
-- (EMPLOYEES 의 DEPARTMENT_ID와 DEPARTMENTS의 DEPARTMENT_ID 연결 후
-- DEPARTMENTS 의 LOCATION_ID와  LOCATIONS의 LOCATION_ID 조인) =>2행 정답:

select employee_id, last_name, D.department_id, L.CITY --d.department_id D.으로 명확하게
from EMPLOYEES E,DEPARTMENTS D,LOCATIONS L --별칭설정 쉽게쉽게
where E.DEPARTMENT_ID = d.department_id AND 
      D.location_id = L.location_id and city like 'T%';



-- 위치 ID가 1700인 동일한 사원들의 EMPLOYEE_ID, LAST_NAME, 
-- DEPARTMENT_ID, SALARY 조회 (EMPLOYEE, DEPARTMENS 조인) // 정답: 18명

select employee_id, last_name, D.department_id, salary 
from EMPLOYEES E,DEPARTMENTS D --별칭설정 쉽게쉽게
where E.DEPARTMENT_ID = d.department_id AND 
        D.LOCATION_ID = 1700;



--DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원수, 각 부서별 평균 연봉 조회
--(EMPLOYEE, DEPARTMENS 조인)


select d.department_name, d.location_id, count(employee_id), round(avg(salary),2)
from EMPLOYEES E,DEPARTMENTS D
where E.DEPARTMENT_ID = d.department_id
GROUP BY d.department_name, d.loction_id;        



--EXECUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID조회
--(EMPLOYEE, DEPARTMENS 조인)

select LAST_NAME, D.department_name, job_id
from EMPLOYEES E, DEPARTMENTS D
where E.DEPARTMENT_ID = d.department_id and d.department_name = 'Executive';



--기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID조회
--(EMPLOYEE, JOB_HISTORY 조인)

select e.employee_id, e.job_id
from EMPLOYEES E, job_history j
where E.employee_id = j.employee_id and e.job_id = j.job_id;




--각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 
--사원이 존재하는 모든 사원들의 LAST_NAME을 조회. || ' ' || 연결
-- employees self join

select e1.department_id, e1.first_name || ' ' || e1.last_name as name
from EMPLOYEES E1, EMPLOYEES E2
where E1.department_id = e2.department_id 
     and e1.hire_date < e2.hire_date and e1.salary < e2.salary;
     
     

-- 서브쿼리 실습

-- 회사 전체 연봉보다 더 많이 받는 사원들의 last_name, salary
select last_name, salary
FROM employees
where salary > (select avg(salary) from employees);

-- last_name에 u가 포함되는 사원들과 동일 부서 근무하는 employee_id, last_name

select employee_id, last_name
from employees
where department_id in (select distinct department_id
                        from employees
                        where last_name like '%u%');


-- no exists 연산자를 사용하여 매니저가 아닌 사원 조회

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


 
 