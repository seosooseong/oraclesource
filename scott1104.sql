-- scott 계정이 가지고 있는 "모든" 테이블 보기
select * from tab;

-- emp 테이블의 구조 (스크립트 출력)
DESC emp;

-- emp의 모든 내용 조회 (질의 결과)
SELECT * FROM emp;

-- emp 테이블의 특정 필드만 조회
SELECT ename, job, sal FROM emp;

-- 중복 레코드 제거한 후 조회 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- alais (별칭) : AS,  empno -> 사원번호
SELECT empno AS 사원번호 FROM emp;

SELECT ename, sal, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as 사원이름, job as "직 책"From emp;

-- ORDER BY : 정렬하여 조회
-- 하나의 열로 기준을 주어 오름차순(ASC 생략가능, 기본값) 조회
SELECT ename, sal FROM emp ORDER BY sal;

-- 하나의 열로 기준을 주어 내림차순(DESC) 조회 
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- 전체 데이터를 조회 (사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;


-- 부서번호의 오름차순(ASC)이고, 부서번호가 동일하다면, 급여의 내림차순(DESC)
SELECT*FROM emp ORDER BY deptno ASC, sal DESC;

-- 예제실습 01-- 부서번호를 기준으로 내림차순 부서번호가 같다면 사원 이름 기준.
SELECT EMPNO AS  EMPLOYEE_NO, ENAME AS EMPLIYEE_NAME,JOB, MGR AS MANAGER, 
                       hiredate, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO 
FROM emp  ORDER BY deptno DESC, ename ASC;



-- WHERE : 조회를 할 때 기준 주기
-- 부서번호가 30번인 사원조회

SELECT *FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 조회
SELECT*FROM emp WHERE empno =7782;

-- 부서번호가 30이고, 서원의 직책이 salman '가차타입은 ''으로 묶는다'정보 조회
SELECT*FROM emp WHERE deptno =30 AND job = 'SALESMAN';

-- 사원번호 7499, 부서번호 30 조회
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- 부서번호가 30이거나, 사원직책이 CLERK정보 조회
SELECT * FROM emp WHERE deptno = 30 OR JOB = 'CLERK';

-- 부서번호 20이거나, 사원 직책이 SALESMAN
SELECT * FROM emp WHERE deptno = 20 OR JOB = 'SALESMAN';

-- 연산자를 이용한 조회
-- 산술연산자 : sal*12 한 금액이 3600인 데이터

SELECT * FROM emp WHERE sal *12=36000;

-- 관계연산자 : > , <, >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F' ;

-- 논리연산자 : AND, OR
-- 급여가 2500이상이고 직업이 ANALYST

SELECT * FROM emp WHERE sal >= 2500 and job = 'ANALYST';

-- 직무 MANAGER, SALESMAN, CLERK 
SELECT * FROM emp WHERE job = 'MANAGER' or job = 'Salesman' or job ='CLERK';

-- 등가연산자 : 양쪽 항목이 같은지 검사
-- sal이 3000이 아닌거 .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   !=, <>, ^= 사원정보 출력
SELECT * FROM emp WHERE sal !=3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^=3000;

-- IN 연산자
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job !='CLERK';

-- 아닌거 != == NOT IN
SELECT * FROM emp WHERE job NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- IN 연산자를 사용허요 부서번호 10, 20 인거
SELECT * FROM emp WHERE deptno in (10, 20);

-- between a and b

-- 1) 급여가 2000이상 3000이하인 사원정보 조회

SELECT * FROM emp where sal >=2000 and sal<=3000;

SELECT * FROM emp where sal between 2000 and 3000;



-- 2) 급여가 2000이상 3000이하 가 아닌 사원정보 조회  not between a and b
SELECT * FROM emp where sal  not between 2000 and 3000;


-- LIKE : 문자열 검색 사용 (S로 시작하는 ~~,  H로 끝나는... , 가운데 T 가 있으면 - 검색) 
-- 1)사원 이름이 s로 시작하는 모든 사원정보 조회하기
SELECT * FROM emp where ename like 'S%';

-- 2)사원 이름이 두번째 글자가 L 사원만 조회   // _ L%언더바가 한글자 취급
SELECT * FROM emp where ename like '_L%';

-- 3) 사원 이름에 AM이 포함되어 있는 사원
SELECT * FROM emp where ename like '%AM%';

-- 4) 사원 이름에 AM이 포함되어 있지 않는 사원 // NOT like
SELECT * FROM emp where ename not like '%AM%';

-- IS null
SELECT * FROM emp where comm IS null;

-- 매니저가 null 인 사원
SELECT * FROM emp where mgr is null;
-- 매니저가 null 이 아닌 사원
SELECT * FROM emp where mgr is not null;

--집합연산자 :  합집합 UNION, 교집합 INTERSECT, 차집합 MINUS
--deptno 가 10인 테이블과 drptno가 20인 결과를 구해서 합해서 보여주기
SELECT empno, ename, sal, deptno from emp where deptno = 10
union
SELECT empno, ename, sal, deptno from emp where deptno = 20;

-- 중복 출력 X
SELECT empno, ename, sal, deptno from emp where deptno = 10
union
SELECT empno, ename, sal, deptno from emp where deptno = 10;

-- 중복까지 출력 union ALL
SELECT empno, ename, sal, deptno from emp where deptno = 10
union ALL
SELECT empno, ename, sal, deptno from emp where deptno = 10;


-- 부서번호가 10이 아닌 사원들의 정보조회 //차집합
SELECT empno, ename, sal, deptno FROM emp
minus
SELECT empno, ename, sal, deptno FROM emp where deptno = 10;

-- 부서번호가 10인 사원정보 조회 //교집합
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp where deptno = 10;


-- 20,30번부서에 근무하고 있는 사원 중 sal 이 2000 초과인 사원을 다음 두가지
-- 방식의 select문을 사용하여, 사원번호, 이름, 급여, 부서번호 출력


-- 집합연산자 사용하지 않는 방식
SELECT empno, ename, sal, deptno
from emp
where deptno in (20,30) and sal > 2000;

--집합연산자를 사용하는 방식
SELECT empno, ename, sal, deptno FROM emp where  sal > 2000 and deptno = 20
union
SELECT empno, ename, sal, deptno FROM emp where sal > 2000 and deptno = 30;




-- 오라클 함수
-- 1) 문자함수 : 대문자 UPPER, 소문자 LOWER, 단어의 처음을 대문자 INICTCAP
--                  length, LENGTHB
-- ename을 upper, lower, initcap으로 변환하여 조회

select ename, upper (ename), lower (ename) , initcap (ename) 
from emp;

-- deul 테이블 이용 (sys가 소유하고 있는 테이블로 임시 연산이나 함수의 결과 값 확인용도)
select length ('한글'), lengthb ('한글')
from dual;


-- 직책 이름이 6글자 이상인 사원들의 정보 추출
select * from emp where length (job) >=6;

-- 문자열 함수 : substr
select job from emp;
select job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

--                  -length(job) = -5
select job, substr(job,-length(job)), substr(job,-length(job),2), substr(job,-3) 
from emp;




-- 문장열 함수 : instr (특정 문자 위치 찾기)

SELECT INSTR ('HELLO, ORACLE', 'L') as instr_1,
            INSTR ('HELLO, ORACLE', 'L', 5) as instr_2,
            INSTR ('HELLO, ORACLE', 'L', 2, 2) as instr_3
From dual;


-- 문자열함수 : replace (찾아서 바꾸기)

select replace ('이것이 oracle이다','이것이','This is')
from dual;

select '010-8620-0439' as REPLACE_BEFORE,
            REPLACE('010-8620-0439','-', ' ') as REPLACE_1
            --REPLACE('010-8620-0439', '-') as REPLACE_2
            
from dual;

-- 문자열 함수 : CONcaT(연결)
-- empno, ename을 연결하여 조회

select concat (empno,ename), concat(empno, concat(':', ename))
from emp
where ename = 'SCOTT';


-- || : 연결의 의미로 사용
select empno||ename, empno || ':' || ename
from emp
where ename = 'SCOTT';


-- 문자열 함수 : TRIM (공백제거), LTRIM (왼쪽공백제거), RTRIM (오른쪽공백제거)
SELECT '   이것이   ', TRIM ('      이것이    ' )
FROM dual;

-- 문자열 함수 : reverse (거꾸로 출력)
select reverse('Oracle') from dual;


--2. 숫자함수 : ROUND (반올림), TRUNC (버림), CEIL(입력된 숫자와 가까운 큰 정수),
-- FLOOR( 입력된 숫자와 가까운 정수), NOD(나머지)

--ROUND (반올림)
select    ROUND(1234.5678) as ROUND,  
            ROUND(1234.5678,0) as ROUND_1,  
            ROUND(1234.5678,1) as ROUND_2, 
            ROUND(1234.5678,-1) as ROUND_MINUS, 
            ROUND(1234.5678,-2) as ROUND_MINUS2
from DUAL;

--TRUNC (버림)
select    trunc(1234.5678) as trunc,  --소수첫째자리
            trunc(1234.5678,0) as trunc_1, 
            trunc(1234.5678,1) as trunc_2, 
            trunc(1234.5678,-1) as trunc_MINUS,
            trunc(1234.5678,-2) as trunc_MINUS2
from dual;


--CEIL(입력된 숫자와 가까운 큰 정수),FLOOR( 입력된 숫자와 가까운 정수)

select ceil(3.14),  floor(3.14), ceil(-3.14), floor(-3.14)
from dual;


--Mod(나눈 나머지)

select mod(15,6), mod(10,2), mod(11,2)
from dual;

--3.날짜 함수 : sysdate,current_date, current_timestamp

select sysdate, current_date, current_timestamp from dual;

--날짜데이터는 연산이 가능 : 날짜데이터 +1,-1 , 날짜데이터 - 날짜 데이터
--날짜데이터 + 날짜데이터는 안됨.

SELECT sysdate as now, sysdate-1 as yesterday, sysdate +1 as tomorrow
from dual;



-- 날짜함수 : add_months
select sysdate,  add_months(sysdate,3) from dual;

-- 입사10주년이 되는 사원들 조회
select empno, ename, hiredate, add_months(hiredate,120)
from emp;

-- 입사 38년 미만사원 조회
select * FROM emp where add_months(hiredate, 456) > sysdate;


--날짜함수 : months_between(두날짜 사이의 차이)
SELECT * FROM emp where months_between(sysdate, hiredate) < 456;

SELECT empno, ename, hiredate, sysdate, months_between(hiredate, sysdate) as months1,
months_between(sysdate, hiredate) as month2, trunc(months_between(hiredate, sysdate))
from emp;

-- 날짜함수 : next_day, last_day
select sysdate, next_day(sysdate, '월요일'), last_day(sysdate)
from dual;



-- 4. 형변환함수
-- to_char (숫자, 날짜 데이터를 문자 변환)
-- to_number (문자 데이터를 숫자 데이터 변환)
-- to_date (문자 데이터를 날짜 데이터 변환)

select to_char(sysdate, 'yyyy/mm/dd') as 현재날짜 from dual;
select to_char(sysdate, 'mm') as 현재날짜 from dual;
select to_char(sysdate, 'mon') as 현재날짜 from dual;
select to_char(sysdate, 'dd') as 현재날짜 from dual;
select to_char(sysdate, 'mon/day') as 현재날짜 from dual;
select to_char(sysdate, 'hh:mi:ss') as 현재날짜 from dual;
select to_char(sysdate, 'hh12:mi:ss') as 현재날짜 from dual;
select to_char(sysdate, 'hh24:mi:ss am') as 현재날짜 from dual;
select to_char(sysdate, 'hh24:mi:ss pm') as 현재날짜 from dual;



--오늘 날짜를 년 /월/일 16:51:45 표현
select to_char(sysdate, 'yyyy:mm:dd hh24:mi:ss') as 오늘날짜 from dual;

select 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 from dual;
select 1300-'1500', '1300'+1500 from dual;

-- 오류 
-- select TO_NUMBER('1,300') - TO_NUMBER ('1,500') FROM DUAL;
-- 9,0 (숫자의 한자리를 의미함), 9: 빈자리를 채우지 않는 형태, 0: 빈자리를 채우는 형태
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
        
        
        
        
-- 1981년 6월 1일 이후에 입사한 사원정보 조회
select * from emp
where hiredate > to_date('1981-06-01','yyyy-mm-dd');


SELECT to_date('2019-12-20','yyyy-mm-dd') 
         - to_date('2019-10-20', 'yyyy-mm-dd') from dual;
         


-- 널처리 함수
-- nvl : 열 또는 데이터를 입력하여 해당 데이터가 NULL이 아닐 경우 
--        데이터를 그대로 반환하고, NULL인 경우 지정한 데이터를 반환

-- nvl2 : 열 또는 데이터를 입력하여 해당 데이터가 
--          NULL이 아닐 때와 NULL일 때 출력 데이터를 각각 지정


select empno, ename, sal, comm, sal+comm from emp;

select empno, ename, sal, comm, sal+comm, nvl(comm,0), sal+nvl(comm, 0)
from emp;

select empno, ename, sal, comm, sal+comm, nvl2(comm,'O','X'),
        nvl2(comm, SAL*COMM,SAL*12) AS ANNSAL
from emp;


-- DECODE 함수와 CASE문
-- job이 manager,  SALESMAN, ANALYST 경우 다른 비율로 적용하고 싶다면?

SELECT empno, ename, job, sal, decode(job,
                                                        'manager', sal*1.1,
                                                        'salesman', sal*1.05,
                                                        'analyst', sal,
                                                        sal*1.03) as upsal 
from emp;

------------------case문이 좀 더 깔끔---------------------

SELECT empno, ename, job, sal, case job 
                                            when 'manager' then sal*1.1
                                            when'salesman'then sal*1.05
                                            when 'analyst'then sal
                                            else sal*1.03
                                    end as upsal 
from emp;

SELECT empno, ename, job, sal, case job 
                                            when comm then '해당사항없음'
                                            when comm = 0 then '수당없음'
                                            when comm>0 then '수당 : ' || comm
                                        end as COMM_TEXT 
from emp;


SELECt *FROM emp;






-- [실습1] 다음과 같은 결과가 나오도록 SQL문을 작성하시오.
--EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
--하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 
--시급(TIME_PAY)를 계산하여 결과를 출력한다. 단, 하루 급여는 소수점 셋째 자리에서 버리고, 
--시급은 두 번째 소수점에서 반올림하시오.


SELECT empno,ename,sal,ROUND((sal/21.5),2) as day_pay, 
       ROUND((sal/21.5/8),1) as time_pay
FROM emp;



--comm IS null

--[실습2] EMP 테이블에서 사원들은 입사일(HIREDATE) 개월이 지난 후 
--첫 월요일에 을 기준으로 정직원이 된다. 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 
--아래와 같이 출력하시오. 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력.

SELECT empno, ename, HIREDATE, NEXT_DAY(add_months(hiredate,3),'월요일)' as R_JOB, 
            nvl(TO_CHAR(comm), 'N/A') as comm
FROM emp;

SELECT empno, ename, HIREDATE, add_months(hiredate,3) as R_JOB, 
            nvl(TO_CHAR(comm), 'N/A') as comm
--nvl(comm,to_char('N/A'))  X
FROM emp;






--[실습3] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 
--다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력


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


--HAVING : GROUP BY 절에 조건을 줄 때 사용
--각 부서의 직책별 평균 급여를 구하되 그 평균 급여가 2000이상인 그룹만 출력
 
 SELECT deptno, job, avg(sal) as 평균
 FROM emp
 group by deptno, job
 HAVING avg(sal) >=2000
 order by deptno,job;


/*[실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 
최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다. 
단, 평균 급여를 출력할 때 소수점을 제외하고 
각 부서번호별로 출력하는 SQL 문을 작성하시오. */

select deptno, floor(avg(sal)) as avg_sal, max(sal) as max_sal, 
        min(sal) as min_sal, count(empno) as cnt
from emp
group by deptno;



/*[실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력*/
SELECT  * FROM emp;

SELECT job, count(job)
FROM emp
group by job having count(job) >= 3;


/*[실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력 
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







