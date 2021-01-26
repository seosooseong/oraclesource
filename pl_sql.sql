--실행 결과를 화면에 출력

--시작전 꼭 실행
set SERVEROUTPUT ON;




BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/




--변수

DECLARE
    -- 변수 선언 : 1. 변수명 타입;
    --             2. 변수명 타입 :=값;
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME :='SCOTT';
    DBMS_OUTPUT.put_line('V_EMPNO :' || V_EMPNO);
    DBMS_OUTPUT.put_line('V_ENAME :' || V_ENAME);
END;
/

--상수 (CONSTANT)
DECLARE
    v_tax CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_tax 는 ' || v_tax);
END;
/


--변수의 기본값 지정 / DEFAULT
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_line('v_deptno : ' || v_deptno);
end;
/



--변수에 null값 저장 막기
DECLARE
    v_deptno NUMBER(2) not null := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/

--변수 기본값과 null / not null DEFAULT 
DECLARE
    v_deptno NUMBER(2) not null DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/





-- 자료형
-- 스칼라형 : 오라클 데이터베이스에서 사용하는 자료형 + Boolean
-- 참조형 : 다른 테이블의 컬럼 자료형이나 하나의 행 구조를 참조



-- 특정 테이블의 컬럼 자료형 참조
DECLARE
    -- dept 테이블의 deptno와 같은 자료형 사용
    V_DEPTNO DEPTNO.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/



-- dept 테이블의 구조와 같은 자료형 사용
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC  INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_row.DEPTNO); 
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_row.DNAME);
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_row.LOC);
END;
/





--조건문

-- IF
DECLARE
    V_NUMBER NUMBER :=13; --홀수
BEGIN
    IF MOD(V_NUMBER,2)=1 THEN  --MOD 는 이클립스의 %와 동일 나머지값을 가져온다.
        dbms_output.put_line('V_NUMER 홀수 ');
    END IF;
end;
/





-- IF ~ELSE
DECLARE
    V_NUMBER NUMBER :=14; --짝수
BEGIN
    IF MOD(V_NUMBER,2)=1 THEN  --MOD 는 이클립스의 %와 동일 나머지값을 가져온다.
        dbms_output.put_line('V_NUMER 홀수 ');
    ELSE
        dbms_output.put_line('V_NUMER 짝수 ');   
    END IF;
end;
/


-- IF ~ELSIF ~ELSE 여러 조건

DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        dbms_output.put_line('A');
    ELSIF V_SCORE >= 80 THEN
        dbms_output.put_line('B');
    ELSIF V_SCORE >= 70 THEN
        dbms_output.put_line('C');
    ELSIF V_SCORE >= 60 THEN
        dbms_output.put_line('D');
    ELSE
        dbms_output.put_line('F');
    END IF;
end;
/
-- CASE 구조
DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN
            dbms_output.put_line('A');
        WHEN 9 THEN
            dbms_output.put_line('B');
        WHEN 8 THEN
            dbms_output.put_line('C');
        WHEN 7 THEN
            dbms_output.put_line('D');
        ELSE
            dbms_output.put_line('F');
    END CASE;
end;
/



--반복문 FOR


--LOOP 기본 반복문
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        EXIT WHEN V_NUM >4; --반복문 종료시점
    END LOOP;
end;
/


DECLARE
    V_NUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        IF V_NUM > 4 THEN
            EXIT;
        END IF ; --반복문 종료시점
    END LOOP;
end;
/



--WHIILE
DECLARE
    V_NUM NUMBER :=0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        
    END LOOP;
end;
/



--FOR
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in 0..4 LOOP --i값 4번 돌린다.
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i); --i
                
    END LOOP;
end;
/



--FOR reverse
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in REVERSE 0..4 LOOP --i값 4번 돌린다.
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i); --i
                
    END LOOP;
end;
/




--continue
DECLARE
    V_NUM NUMBER :=0;
BEGIN
   FOR i in 0..4 LOOP 
        CONTINUE when mod (i, 2) = 1; --continue 나머지값이 1이면 건너 띔 (홀수_)
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i); 
                
    END LOOP;
end;
/





--[실습] 1~10까지 출력
   
BEGIN
   FOR i in 1..10 LOOP 
        DBMS_OUTPUT.PUT_LINE(i);           
    END LOOP;
end;
/


--홀수만 출력
BEGIN
   FOR i in 1..10 LOOP 
        continue when mod (i,2) =1;
        DBMS_OUTPUT.PUT_LINE('홀수만 출력 : '|| i);           
    END LOOP;
end;

--선생님 
BEGIN
   FOR i in 1..10 LOOP 
        if i mod 2=1 then
        DBMS_OUTPUT.PUT_LINE('홀수만 출력 : '|| i);           
        end if;
    END LOOP;
end;
/

--[실습2] p16
--DEPT 테이블의 DEPTNO 와 자료형이 같은 변수 V_DEPTNO 를 선언합니다. 
--그리고 V_DEPTNO 변수 값에 10,20,30,40을 대입했을 때 다음과 같이 
--부서 이름을 출력하는 프로그램을 작성하기, 
--단, 부서 번호가 10,20,30,40이 아니면 N/A 로 출력하기

-- 10 : accounting / 20 : reserch / 30: sales / 40 : operation

DECLARE
    v_deptno dept.Deptno%type := 30; --DEPT 테이블의 DEPTNO 와 같은 변수 V_DEPTNO 를 선언
BEGIN
    if v_deptnO = 10 then            --V_DEPTNO 변수 값에 10,20,30,40을 대입
        DBMS_OUTPUT.PUT_LINE ('DNAME : ACCOUNTING');
    ELSif v_deptNO = 20 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : reserch');
    ELSif v_deptNO = 30 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : sales');
    ELSif v_deptNO = 40 then
        DBMS_OUTPUT.PUT_LINE ('DNAME : operation');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('DNAME : N/A');
    END IF; --종료
end;
/











--레코드 : 자료형이 각가 다른 데이터를 하나의 변수에 저장

DECLARE
    type rec_dept is record( -- 레코드 이름
        deptno NUMBER (2) not null :=99, -- 변수 선언
        dname dept.dname%type,-- DEPT dname을 사용
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec명으로 변수 선언

begin
    dept_rec.deptno :=99; --dept_rec. 으로 세팅
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    dbms_output.put_line ('DEPTNO : ' || DEPT_REC.DEPTNO); --출력
    dbms_output.put_line ('DNAME : ' || DEPT_REC.DNAME);
    dbms_output.put_line ('LOC : ' || DEPT_REC.LOC);
end;
/









--테이블 생성 (연습) / dept테이블 복사)


CREATE TABLE dept_record
as select * from dept;

SELECT * FROM dept_record;



--레코드를 사용한 insert

DECLARE
    type rec_dept is record( -- 레코드 이름
        deptno NUMBER (2) not null :=99, -- 변수 선언
        dname dept.dname%type,-- DEPT dname을 사용
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec명으로 변수 선언

begin
    dept_rec.deptno :=99; --dept_rec. 으로 세팅
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    
    insert into dept_record
    values dept_rec;
end;
/



--레코드를 사용한 업데이트 (수정)

DECLARE
    type rec_dept is record( -- 레코드 이름
        deptno NUMBER (2) not null :=99, -- 변수 선언
        dname dept.dname%type,-- DEPT dname을 사용
        loc dept.loc%TYPE     --    "
        );
        dept_rec REC_DEPT; -- dept_rec명으로 변수 선언

begin
    dept_rec.deptno :=50; --dept_rec. 으로 세팅
    dept_rec.dname := 'jsp';
    dept_rec.loc := 'busan';
    
    UPDATE dept_record
    set row = dept_rec
    where deptno = 99;
end;
/


--레코드를 포함한 레코드


DECLARE
    type rec_dept is record( 
        deptno NUMBER (2) not null :=99,
        dname dept.dname%type,
        loc dept.loc%TYPE    
        );
        dept_rec REC_DEPT; 
        TYPE rec_emp is RECORD(
        empno emp.empno%type,
        ename emp.empname%type,
        dinfo emp_dept);
    
    emp_rec REC_EMP;
begin
    select e.empno, e.ename, d.deptno, d.dname, d.loc
    into emp_rec.empno, emp_rec.ename, emp_rec.dinfo.deptno, emp_rec.dinfo.dname, emp_rec.dinfo.loc
    from EMP e, DEPT d
    where e.deptno = d.deptno and e.empno = 7788;
    DBMS_OUTPUT.put_line('EMPNO : ' || EMP_REC.EMPNO);
    DBMS_OUTPUT.put_line('ENAME : ' || EMP_REC.ENAME);
            
            DBMS_OUTPUT.put_line('DEPTNO : ' || EMP_REC.DINFO.DEPTNO);
            DBMS_OUTPUT.put_line('DNAME : ' || EMP_REC.DINFO.DNAME);
            DBMS_OUTPUT.put_line('LOC : ' || EMP_REC.DINFO.LOC);
end;
/





-- 컬렉션 : 자료형이 같은 여러 데이터 저장 (배열, List ...)
-- "연관배열", 중첩테이블, Varry

-- 연관배열 : key, value

declare
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER; --배열명 ITAB_EX / INDEX타입을 PLS_INTEGER
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data'; --1,2,3,4 PLS_INTEGER
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(4) := '4st data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
end;
/







-- 레코드를 활용한 연관배열

declare --레코드 정의
    type REC_DEPT is record( 
        deptno DEPT.DEPTNO%TYPE,
        dname dept.dname%type
    );
    --연관배열 정의
    -- int arr[] = {}, Acount arr[]
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT INDEX BY PLS_INTEGER;
    
    dept_arr IRAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
    idx := idx + 1;
    dept_arr(idx).deptno := i.Deptno;
    dept_arr(idx).dname := i.Dname;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ':' || dept_arr(idx).dname);
    
    end loop;
end;
/



-- 컬렉션 메서드
declare
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER; --배열명 ITAB_EX / INDEX타입을 PLS_INTEGER
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data'; --1,2,3,4 PLS_INTEGER
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(50) := '50st data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr.count : ' || text_arr.count); --갯수
    DBMS_OUTPUT.PUT_LINE('text_arr.first : ' || text_arr.first); --처음
    DBMS_OUTPUT.PUT_LINE('text_arr.last : ' || text_arr.last);  --마지막
    DBMS_OUTPUT.PUT_LINE('text_arr.prior(50) : ' || text_arr.prior(50)); --prior 50번 앞에
    DBMS_OUTPUT.PUT_LINE('text_arr.next(50) : ' || text_arr.next(50)); --next 50번 다음
end;
/



-- [실습] p22
--다음과 같은 결과가 나오도록 PL/SQL 문을 작성하기
--EMP 테이블과 같은 열 구조를 가지는 빈 테이블 EMP_RECORD를 생성하는 SQL문 작성
--EMP_RECORD 테이블에 레코드를 사용하여 새로운 사원 정보를 다음과 같이 삽입하는 PL/SQL 문 작성
DROP table EMP_RECORD;

SELECT * FROM EMP_RECORD;

CREATE TABLE EMP_RECORD
as select * from emp
where 1<>1;



DECLARE
    type emp_record is record(
    empno emp.empno%type,
    ename emp.ename%type,
    job emp.job%type,
    mgr emp.mgr%type,
    hiredate hiredate%type,
    sal emp.sal%type,
    comm emp.comm%type,
    deptno emp.deptno%type
    );
emp_rec emp_record;
    
begin
    emp_rec.empno := 6699;
    emp_rec.ename := 'JOHN';
    emp_rec.JOB := 'SALESMAN';
    emp_rec.MGR := 7902;
    emp_rec.HIREDATE := '07/11/05';
    emp_rec.SAL := 1500;
    emp_rec.COMM := NULL;
    emp_rec.deptno := 10;
    insert into emp_record values emp_rec;
                    
end;
/

--[실습2]연관배열

declare
    type ITAB_EMP IS TABLE OF EMP%ROWTYPE INDEX BY PLS_INTEGER;
    
    emp_arr ITAB_EMP;
    idx pls_integer :=0;
begin
    for i in (select * from emp) loop
    idx := idx+1;
    emp_arr(idx).empno := i.empno;
    emp_arr(idx).ename := i.ename;
    emp_arr(idx).job := i.job;
    emp_arr(idx).mgr := i.mgr;
    emp_arr(idx).hiredate := i.hiredate;
    emp_arr(idx).sal := i.sal;
    emp_arr(idx).comm := i.comm;
    emp_arr(idx).deptno := i.deptno;
    
    DBMS_OUTPUT.PUT_LINE (emp_arr(idx).empno || ' : ' || emp_arr(idx).ename
    || ' : ' ||emp_arr(idx).job || ' : ' ||emp_arr(idx).mgr|| ' : ' ||emp_arr(idx).hiredate
    || ' : ' ||emp_arr(idx).sal || ' : ' ||emp_arr(idx).comm || ' : ' ||emp_arr(idx).deptno);
    
    end loop;
end;







-- 커서 :sql문 실행시 결과 저장한 메모리 공간(Private sql area)의 포인터


--단일행 데이터를 저장하는 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --명시적 커서 선언
    cursor c1 is --커서이름 임의적으로 가능 
        select deptno, dname, loc
        from dept
        where deptno = 40;
        
BEGIN
    --커서 열기
    open c1;
    
    --커서로 부터 읽어온 데이터 사용(fetch)
    FETCH c1 into v_dept_row;
    
    DBMS_OUTPUT.PUT_line('deptno : ' || v_dept_row.deptno );
    DBMS_OUTPUT.PUT_line('dname : ' || v_dept_row.dname );
    DBMS_OUTPUT.PUT_line('loc : ' || v_dept_row.loc );
   
   --커서 닫기
   close c1;
END;
/




--커서 안쓰고
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
     
BEGIN
   select deptno, dname, loc into v_dept_row
        from dept
        where deptno = 40;
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || V_DEPT_ROW.DEPTNO );
    DBMS_OUTPUT.PUT_LINE('dname : ' || V_DEPT_ROW.DNAME );
    DBMS_OUTPUT.PUT_LINE('loc : ' || V_DEPT_ROW.LOC );

END;
/






--여러행이 조회되는 경우 커서

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --명시적 커서 선언
    cursor c1 is --커서이름 임의적으로 가능 
        select deptno, dname, loc
        from dept;
        
BEGIN
    --커서 열기
    open c1;
    
    
    LOOP
    
        --커서로 부터 읽어온 데이터 사용(fetch)
        FETCH c1 into v_dept_row;
        
        --커서의 모든행을 읽어오기 -지정
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_line('deptno : ' || v_dept_row.deptno );
        DBMS_OUTPUT.PUT_line('dname : ' || v_dept_row.dname );
        DBMS_OUTPUT.PUT_line('loc : ' || v_dept_row.loc );
   
   end loop;
   
   --커서 닫기
   close c1;
END;
/



--------------------------------------------------
--커서 for

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --명시적 커서 선언
    cursor c1 is --커서이름 임의적으로 가능 
        select deptno, dname, loc
        from dept;
        
BEGIN
    --커서 for loop (자동 open, fetch, cloes)
    for c1_rec in c1 loop
        
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.deptno );
        DBMS_OUTPUT.PUT_line('dname : ' || c1_rec.dname );
        DBMS_OUTPUT.PUT_line('loc : ' || c1_rec.loc );
   
   end loop;

END;
/





--커서에 파라미터 사용
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE; 
    --명시적 커서 선언
    cursor c1(p_deptno DEPT.DEPTNO%TYPE) is 
        select deptno, dname, loc
        from DEPT
        WHERE DEPTNO = P_DEPTNO;
BEGIN
    --커서 열기
    open c1(10);
        LOOP
            --커서로 부터 읽어온 데이터 사용(fetch)
            FETCH c1 into v_dept_row;
            --커서의 모든행을 읽어오기 -지정
            EXIT WHEN c1%notfound;
            
            DBMS_OUTPUT.PUT_line('10번부서 deptno : ' || v_dept_row.deptno || 'dname : ' || v_dept_row.dname 
            || 'loc : ' || v_dept_row.loc );
   
     end loop;
       
    open c1(20);
         LOOP
            --커서로 부터 읽어온 데이터 사용(fetch)
            FETCH c1 into v_dept_row;
            --커서의 모든행을 읽어오기 -지정
            EXIT WHEN c1%notfound;
            
            DBMS_OUTPUT.PUT_line('20번부서 deptno : ' || v_dept_row.deptno || 'dname : ' || v_dept_row.dname 
            || 'loc : ' || v_dept_row.loc );
   
        end loop;
   
   --커서 닫기
   close c1;
   
END;
/







--
DECLARE
    --사용자가 입력한 부서번호를 저장하는 변수
    V_DEPTNO DEPT.DEPTNO%TYPE; 
    
    --명시적 커서 선언
    cursor c1(p_deptno DEPT.DEPTNO%TYPE) is --커서이름 임의적으로 가능 
        select deptno, dname, loc
        from dept WHERE deptno = p_deptno;
        
BEGIN
    V_DEPTNO :=&INPUT_DEPTNO;
    --커서 for loop (자동 open, fetch, cloes)
    for c1_rec in c1(V_DEPTNO) loop
        
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.deptno || ' '
        || 'dname : ' || c1_rec.dname || ' ' || 'loc : ' || c1_rec.loc );
   
   end loop;

END;
/








--묵시적 커서
BEGIN
    UPDATE dept_temp SET DNAME = 'DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE ('갱신된 행의 수 :' || SQL%ROWCOUNT);
    
        IF(SQL%FOUND) THEN
            DBMS_OUTPUT.PUT_LINE ('갱신  대상 행 존재 여부 : TRUE');
        ELSE
             DBMS_OUTPUT.PUT_LINE ('갱신  대상 행 존재 여부 : FALSE');
        END IF;
        
        IF(SQL%ISOPEN) THEN
            DBMS_OUTPUT.PUT_LINE ('커서의 OPEN 여부 : TRUE');
        ELSE
             DBMS_OUTPUT.PUT_LINE ('커서의 OPEN 여부 : FALSE');
        END IF;
END;
/

SELECT * FROM dept;

-- 예외(오류)
-- 컴파일 / 런타임 오류

DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception 
    when value_error then
        dbms_output.put_line ('예외처리 - 수치 또는 값 오류 발생');
end;
/





--예외종료 : Internal exception(내부예외) , user-difined exception(사용자정의예외)

DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception
    WHEN too_many_rows then
         dbms_output.put_line ('예외처리 - 요구보다 많은 행 추출 오류 발생');
    when value_error then
        dbms_output.put_line ('예외처리 - 수치 또는 값 오류 발생');
    when others then
        dbms_output.put_line ('예외처리 - 사전 정의 외 오류 발생');

end;
/


DECLARE
    v_wrong number;
begin
    select dname into v_wrong
    from dept
    where deptno =10;
    
exception
    when others then
        DBMS_OUTPUT.PUT_LINE ('예외처리 - 사전 정의 외 오류 발생');
        dbms_output.put_line ('sqlcode : ' || TO_CHAR(sqlcode); --sqlcode (오류 번호)
        dbms_output.put_line ('sqlerrm : ' || sqlerrm); --sqlerrm (오류 메세지)

end;
/


-- [실습] 커서 p30
-- 명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회한 후 커서 안의 데이터가 다음과 같이 출력

-- 1.LOOP를 사용한 방식

DECLARE
    --커서 데이터가 입력될 변수 선언
    V_emp_ROW EMP%ROWTYPE; 
    --명시적 커서 선언
    cursor c1 is --커서이름 임의적으로 가능 
        select * from EMP;
        
BEGIN
    --커서 열기
    open c1;
    
    LOOP
        --커서로 부터 읽어온 데이터 사용(fetch)
        FETCH c1 into v_EMP_row;
        
        --커서의 모든행을 읽어오기 -지정
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_EMP_ROW.EMPNO || 'DNAME : ' || V_EMP_ROW.ENAME ||'loc : ' || V_EMP_ROW.job 
        ||'MGR : ' || V_EMP_ROW.MGR  ||'HIREDATE : ' || V_EMP_ROW.HIREDATE || 'SAL : ' || V_EMP_ROW.SAL ||'COMM : ' || V_EMP_ROW.COMM ||'DEPTNO : ' || V_EMP_ROW.DEPTNO );

   end loop;
   
   --커서 닫기
   close c1;
END;
/



-- 2. FOR LOOP를 사용한 방식

DECLARE
--커서 데이터가 입력될 변수 선언
    V_emp_ROW EMP%ROWTYPE; 
    --명시적 커서 선언
    cursor c1 is --커서이름 임의적으로 가능 
        select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
        from EMP;
        
BEGIN
    --커서 for loop (자동 open, fetch, cloes)
    for c1_rec in c1 loop
       
        DBMS_OUTPUT.PUT_line('deptno : ' || c1_rec.EMPNO );
        DBMS_OUTPUT.PUT_line('dname : ' || c1_rec.ENAME );
        DBMS_OUTPUT.PUT_line('loc : ' || c1_rec.JOB );
        DBMS_OUTPUT.PUT_line('MGR : ' || c1_rec.MGR );
        DBMS_OUTPUT.PUT_line('HIREDATE : ' || c1_rec.HIREDATE );
        DBMS_OUTPUT.PUT_line('SAL : ' || c1_rec.SAL );
        DBMS_OUTPUT.PUT_line('COMM : ' || c1_rec.COMM );
        DBMS_OUTPUT.PUT_line('DEPTNO : ' || c1_rec.DEPTNO );
   end loop;

END;
/



-- 익명블록 : 이름X, 저장X, 실행시 컴파일, 공유X, 다른 응용프로그램에서 호출X

-- 저장 서브 프로그램 : 이름지정, 저장 가능, 저장시 한번 컴파일, 공유가능, 호출 가능.


--프로시저 생성
CREATE OR REPLACE PROCEDURE pro_noparam
is
    v_empno number(4) := 7788;
    v_ename varchar(10);

begin
    v_ename :='SCOTT';
    DBMS_OUTPUT.PUT_LINE('v_empno : ' ||v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : ' ||v_ename);
    
end;
/


--sql+에서도 실행해보슈

execute pro_noparam;



-- pl/sql 블록에서 프로시저 실행

begin
    pro_noparam;
end;
/



--프로시저 삭제

DROP PROCEDURE PRO_NOPARAM;



--------------------------------------------------------------------------------------------------------

-- 프로시저 파라미터 IN / OUT / IN OUT

-- IN 파라미터 (기본)
CREATE OR REPLACE PROCEDURE pro_param_in
    (
    param1 in number,
    param2 number,
    param3 number :=3,
    oaram4 number default 2
    )
is
begin
    DBMS_OUTPUT.PUT_LINE('param1 : ' ||param1);
    DBMS_OUTPUT.PUT_LINE('param2 : ' ||param2);
    DBMS_OUTPUT.PUT_LINE('param3 : ' ||param3);
    DBMS_OUTPUT.PUT_LINE('param4 : ' ||param4);
end;
/


execute pro_param_in;




--out모드 파라미터 : 프로시저 실행 후 호출한 프로그램으로 값 반환

create or replace procedure pro_param_out
(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)

is
begin
    SELECT ename, SAL INTO out_ename, out_sal
    FROM emp
    where empno = in_empno;
end;
/

execute pro_param_out;

--다른 pl/sql 블록에서 프로시저 사용
DECLARE
    V_ENAME EMP.ENAME%TYPE;
    V_SAL EMP.SAL%TYPE;
BEGIN
    PRO_PARAM_OUT (7788,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('Sal : ' || V_SAL);
END;
/



--in out : in, out 기능을 동시에 수행
create or replace procedure pro_param_inout
(
    inout_no in out number
)
is
begin
    inout_no := inout_no * 2;
end;
/


declare
    no number;
begin
    no :=6;
    pro_param_inout(no);
    dbms_output.put_line ('no : ' || no);
end;
/


--javadb에서 실행
create or replace PROCEDURE register_user
(
    name nvarchar2,
    year number,
    addr nchar,
    mobile nvarchar2
)
is
begin
    insert into userTBL(no, username, birthyear,addr,mobile)
    values(usertbl_seq.nextval, name, year,addr, mobile);
    commit;
    dbms_output.put_line (name || year|| addr || mobile);
end;
/

execute register_user ('대조영','1996','부산','010-4569-4568');

SELECT * FROM userTBL;









--[실습] 프로시저 생성
--1. DEPT 테이블 부서번호(DEPTNO)를 입력 값으로 받은 후 
--부서 번호(DEPTNO), 부서이름(DNAME), 지역(LOC)을 출력하는 프로시저 pro_dept_in 작성

CREATE OR REPLACE PROCEDURE pro_dept_in
(
    inout_deptno in out dept.deptno%type,
    out_dname out dept.dname%type,
    out_loc out dept.loc%type
)
is
begin
    select deptno, dname, loc into inout_deptno,out_dname,out_loc
    from dept
    where deptno = inout_deptno;

end;
/

execute pro_dept_in;


--2.pro_dept_in 프로시저를 통해 출력된 부서 번호(DEPTNO), 부서이름(DNAME), 지역(LOC)을 
--다음과 같이 출력하는 PL/SQL 프로그램 작성
declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
    v_loc dept.loc%type;
begin
    v_deptno :=10;
    pro_dept_in(v_deptno, v_dname, v_loc);
    DBMS_OUTPUT.PUT_LINE('부서번호 : '|| v_deptno);
    DBMS_OUTPUT.PUT_LINE('부서명 : '|| v_dname);
    DBMS_OUTPUT.PUT_LINE('지역 : '|| v_loc);
end;
/



/*
--트리거 : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트 발생할 때 자동으로 실행시키는 기능.

--before 트리거
--트리거를 적용할 테이블 생성.

create table emp_trg as select * from emp;


--emp_trg에 dml구문 (주말이라면 사원정보 수정 불가.) 사용시 트리거 발생
--raise_application_error: 사용자 정의 예외

CREATE OR REPLACE TRIGGER trg_emp_nodml_weekend
BEFORE
-- 트리거 연결
INSERT OR UPDATE OR DELETE ON emp_trg
BEGIN
    IF to_char(sysdate, 'DY') IN ('토','일') THEN
        IF inserting THEN
            raise_application_error(-20000, '주말 사원정보 추가 불가');
        ELSIF updating THEN
            raise_application_error(-20001, '주말 사원정보 추가 불가');
        ELSIF deleting THEN
            raise_application_error(-20002, '주말 사원정보 추가 불가');
        ELSE
            raise_application_error(-20003, '주말 사원정보 추가 불가');
        END IF;
    END IF;
END;
/




select * from emp_trg;


update emp_trg
set sal = 3500
where empno = 7788;






-- AFTER

create table emp_TRG_log(
    tablename varchar2(10),
    dml_type varchar2(10),
    empno number(4),
    user_name varchar2(30),
    change_date date);
    
DROP TABLE trg_emp_log; 
DROP TABLE emp_TRG_log;
----- 
SELECT*FROM EMP_TRG;
SELECT*FROM trg_emp_log; 
------  
    
    
    
create or replace trigger trg_emp_log
after
insert or delete or update on emp_trg
for each row -- dml문장에 의해 영향 받는 행별로 실행

begin
    if inserting then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'INSERT', : NEW.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE); --SYS_CONTEXT : 현재 데이터베이스 접속자
    ELSif UPDATING then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'UODATE', : OLD.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    ELSif DELETING then
        insert into emp_trg_log
        valueS('EMP_TRG' , 'DELETE', : OLD.EMPNO,
        SYS_CONTEXT('USERENV','SESSION_USER'), SYSDATE);
    END IF;

END;
/
    
-------------   
    
INSERT INTO EMP_TRG VALUES
            (9990, 'TESTtemp', 'CLERK',7788, TO_DATE('2018-03-03','YYY-MM-DD'),1200,NULL,20);
    
    
    
    
---
UPDATE EMP_TRG
SET SAL= 1300
WHERE MGR = 7788;
    


--트리거 조회
SELECT*FROM USER_TRIGGERS;


--트리거 삭제
DROP TRIGGER trg_emp_log;
    
    
    
    
    
--트리거 변경
ALTER TRIGGER trg_emp_log_WEEKEND DISABLE; --비활성화

ALTER TRIGGER trg_emp_log_WEEKEND ENABLE; --활성화
    
    
    
    
 */   


