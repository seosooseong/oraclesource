--���� ����� ȭ�鿡 ���

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;
/




--����

DECLARE
    -- ���� ���� : 1. ������ Ÿ��;
    --             2. ������ Ÿ�� :=��;
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME :='SCOTT';
    DBMS_OUTPUT.put_line('V_EMPNO :' || V_EMPNO);
    DBMS_OUTPUT.put_line('V_ENAME :' || V_ENAME);
END;
/

--��� (CONSTANT)
DECLARE
    v_tax CONSTANT NUMBER(1) :=3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_tax �� ' || v_tax);
END;
/


--������ �⺻�� ���� / DEFAULT
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_line('v_deptno : ' || v_deptno);
end;
/



--������ null�� ���� ����
DECLARE
    v_deptno NUMBER(2) not null := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
end;
/

--���� �⺻���� null / not null DEFAULT 
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


