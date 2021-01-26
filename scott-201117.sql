--실행 결과를 화면에 출력

SET SERVEROUTPUT ON;

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




DECLARE

BEGIN

end;
/



DECLARE

BEGIN

end;
/


