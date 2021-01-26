SELECT*FROM emp;

--안됨 X
SELECT ename, sum(sal) from emp;

--하나의 행만 출력하기때문 o
SELECT sum(sal) from emp;

-- SUM : 합계
SELECT sum(sal),sum(DISTINCT sal),sum(ALL sal) from emp;

-- COUNT : 개수
SELECT count(*) FROM emp;
--14개의 데이터를 가지고 있음.

 --부서번호가 30번인 직원수 
 select count(*) from emp where deptno = 30;

 SELECT count(sal),count(DISTINCT sal),count(ALL sal) from emp;
 
 
 --MAX 최대값 / MIN 최소값

--월급(sal) 최대 최소
 SELECT max(sal), min(sal) from emp; 
 
 
 --부서번호가 20인 사원의 입사일 중 가장 최근(max) 입사일 구하기
 select max(hiredate) from emp where deptno =20;
 
 
 -- AVG : 평균(AVERAGE)
select avg(sal) from emp;
 
 select avg(sal) from emp where deptno=30;
 
 --중복값 빼고....
select avg(DISTINCT sal) from emp;



--부서별 월급의 평균을 알고 싶다면??
select avg(sal) from emp where deptno=10;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;
  
--group by : 결과값을 원하는 열로 묶어 출력.
select deptno,avg(sal) from emp  GROUP BY deptno;

--부서번호별 추가 수당 평균 구하기.
SELECT deptno, avg(comm) from emp group by deptno;
 
 
 --부서번호, 직책별 급여 평균 구하기
 SELECT deptno, avg(sal) as 월급평균, job as 직책 
 from emp 
 group by deptno, job ORDER BY deptno,job;
 
 
 -- group by 절에 포함 안되는 열을 select열에 포함하면 안됨.
 SELECT ename, deptno, avg(sal)
 from emp
 GROUP BY deptno;  --오류 ename 평균을 못구하기 때문에 에러.
 
 
 --HAVING : GROUP BY 절에 조건을 줄 때 사용
 
/*SELECT deptno, job, avg(sal) as 평균
 FROM emp
where avg(sal) >=2000
group by deptno, job
 order by deptno,job;
 */
 
 
 -- emp테이블의 "부서별" "직책"의 평균 급여가 500이상인 사원들의 
 -- 부서번호, 직책, 부서별 직책의 평균급여 출력.
 
select deptno, job, avg(sal)
from emp
group by deptno, job having avg(sal) >= 500;
 
 
 select deptno, job, avg(sal)
 from emp
 where sal <=3000
group by deptno, job having avg(sal) >= 2000
order BY deptno, job;


-- 조인 join

SELECT * FROM emp, dept ORDER by empno;
SELECT count(*) FROM emp, dept ORDER by empno;  --56행 = 14*4

SELECT * FROM dept; --4행
SELECT * FROM emp; --14행

-- 1) 내부조인 (등가조인)
select *  --emp기준으로 출력
from emp, dept
where emp.deptno = dept.deptno  --조인기준 / 같다면 모두 가져와.
ORDER by empno;

--같은거.

SELECT *  
FROM emp e, dept d 
where e.deptno = d.deptno  --조인기준 / 같다면 모두 가져와.
ORDER by empno;


SELECT *  
FROM emp E INNER JOIN dept D  --emp E dept D 별칭을 붙여주면 단순하게 작업 가능.
ON E.deptno = D.deptno --조인기준
ORDER BY empno;





-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 가지고 올 것인지 정확히 명시.

SELECT empno, ename, job, d.deptno, dname   --deptno 때문에 오류 / d.deptno같이 명확하게
FROM emp e, dept d 
where e.deptno = d.deptno  --조인기준 
ORDER by empno;



--emp테이블과 dept테이블을 조인하여 ENPNO,ENAME, SAL, DEPTNO
--DNAME, LOC를 조회한다. //단 급여가 3000 이상인 사원만 출력.

Select E.Empno, E.Ename, E.Sal, D.Deptno, D.Dname, D.Loc
From Emp E, Dept D
Where E.Deptno = D.Deptno And Sal >= 3000;


--emp테이블의 별칭을 e로 dept테이블 별칭을 d로 하여
--급여가 2500이하이고 사원번호가 9999이하인 사원 정보

Select *
From Emp E, Dept D
where E.Deptno = D.Deptno and Sal >= 2500 
                          and empno <= 9999;


--emp테이블의 별칭을 e로 selgrade테이블 별칭을 s로 하여
--각 사원의 정보와 // 사원의 등급 정보 출력
Select * from salgrade;

Select *
From Emp E, salgrade s
where E.sal between s.losal and s.hisal;

--2) 셀프조인(자체조인) 조인 테이블이 자기 자신 테이블일떄

SELECT * FROM emp;

select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;  --13행, kig은 매니저가 없음.

--3) outer join(외부조인) : 조건을 만족하지 않는 데이터도 추출


select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1 LEFT OUTER JOIN emp e2 --KING도 출력. 14행
ON e1.mgr = e2.empno;


select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr  = e2.empno(+); --기준되는곳에 (+) 붙인다.


-- 2)RIGHT OUTER JOIN

select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1 RIGHT OUTER JOIN emp e2 
ON e1.mgr = e2.empno;



select e1.empno, e1.ename, e1.mgr, 
       e2.empno as mgr_empno ,e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr(+)  = e2.empno;



-- PPT 연습문제
-- 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 SQL 문을 작성
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000 ORDER BY E.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE E.SAL>2000 ORDER BY E.DEPTNO;



-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성

SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL, COUNT(DNAME)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

-- 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력하는 SQL문을 작성

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO ORDER BY D.DEPTNO, E.EMPNO;


-- 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 정보 부서번호, 
-- 사원번호 순으로 정렬하여 출력하는 SQL문을 작성
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








