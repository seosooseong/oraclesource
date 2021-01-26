-- 존스의 급여보다 높은 급여를 받는 사원들 출력.

-- 1. 존스의 급여 알아내기 jones 2975
SELECT sal
FROM emp
where ename = 'JONES';


-- 2. 높은 급여 사원 출력하기

SELECT * FROM EMP where sal > 2975;


-- 서브쿼리 : 쿼리문 안에 다른 쿼리문을 포함하고 있는 형태
-- 단일행 서브쿼리 : > < = <= >= 같지않음 <> ^= !=
SELECT * FROM EMP where sal > (SELECT sal FROM emp where ename = 'JONES');


-- 사원이름이 ALLEN인 사원의 추가수당보다 많이 받는 사원
SELECT * FROM EMP where COMM > (SELECT COMM FROM emp where ename = 'ALLEN');

-- 사원이름이 WARD인 사원의 입사일보다 빨리 입사한 사원
SELECT * FROM EMP where hiredate < (SELECT HIREDATE FROM emp where ename = 'WARD');


-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력.
SELECT * FROM EMP where deptno = 20 and sal > (SELECT avg(sal) from emp);


-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력.
-- 부서명, 지역위치
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp e, dept d
where e.deptno = d.deptno and deptno = 20 and sal > (SELECT avg(sal) from emp);



-- 다중행 서브쿼리
IN
ANY
ALL
EXISTS

--서브쿼리 결과가 2개이상나오면 단일행 서브쿼리의 연산자 사용불가,오류
--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
SELECT * FROM emp where sal >= (select max(sal) from emp GROUP BY deptno);

SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;
-- IN사용
SELECT * FROM emp where sal IN (select max(sal) from emp GROUP BY deptno);

-- ANY or SOME
-- = ANY : IN의 수행결과와 같다. / IN을 더 많이 사용 한다.
SELECT * FROM emp where sal = ANY (select max(sal) from emp GROUP BY deptno);

SELECT * FROM emp where sal = some (select max(sal) from emp GROUP BY deptno);


-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 출력.
select max(sal) from emp where deptno = 30; --단일행

SELECT * FROM emp where sal< ANY (select max(sal) from emp where deptno = 30);
--max가 없어도 결과는 같음.
SELECT * FROM emp where sal< ANY (select sal from emp where deptno = 30);

select distinct sal from emp where deptno = 30; --중복값 제외하고 출력




-- 30번 부서 사원들의 최대 급여보다 많은 급여를 받는 사원 출력.
SELECT * FROM emp where sal > ANY (select sal from emp where deptno = 30);





-- ALL : 서브 쿼리의 결과를 모두 만족하는 메인쿼리를 추출
-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원
SELECT * FROM emp where sal < ALL (select sal from emp where deptno = 30);



-- EXISTS : IN과 비슷한 개념, IN보다 성능이 우수함.

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
                
                
--ppt연습문제 p19
--[실습1] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 
--부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오.

select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job_id in (select job from emp where ename = 'ALLEN');
                                
--[실습2] 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 
--사원정보, 부서정보, 급여 등급 정보를 출력하는 SQL문을 작성하시오
--(단, 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 
--사원 번호를 기준으로 오름차순으로 정렬하기)

SELECT e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
FROM EMP E, dept d, SALGRADE S
WHERE e.deptno = d.deptno and E.SAL BETWEEN S.LOSAL AND S.HISAL 
                AND E.SAL > (select avg(sal) from emp)
order by e.sal desc, e.empno asc;



-- 다중 열 서브쿼리 : 서브쿼리의 select문에 비교할 컬럼이 여러개 나오는 방식.
select * from emp where (deptno, sal) in 
                        (select deptno, max(sal) from emp group by deptno);


--FROM절에 사용하는 서브쿼리(인라인 뷰)
select e.empno, e.ename, d.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) E, (select * from dept) D
where e.deptno = d.deptno;

--select 절에 사용하는 서브쿼리 --스칼라 서브쿼리
--ppt 참고





/*[실습1] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 
가진 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오.*/

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.job not in 
     (select distinct job from emp where deptno = 30)
and e.deptno = 10;

/*[실습2] 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 
사원정보,급여등급 정보를 출력하는 SQL문을 작성하시오(단, 서브쿼리를 활용할 때 다중행 함수를 
사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 오름차순 정렬하여 출력하시오.)*/

SELECT empno, ename, sal, 
      (select grade from salgrade where e.sal between losal and hisal) as grade
FROM emp
where sal > (select max(sal) from emp where job = 'SALESMAN');

--다중
SELECT empno, ename, sal
FROM emp
where sal > all (select (sal) from emp where job = 'SALESMAN');
--ORDER BY deptno desc;


