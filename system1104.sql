-- scott 계정(scott) 암호(tiger) 지정한 후 계정 해제하기

alter user scott identified by tiger account unlock;

-- hr 계정(hr) 암호(12345) 지정한 후 계정 해제하기

alter user hr identified by 12345 account unlock;




--새로운 사용자 생성 (새로운 스키마 생성) TEST / 12345
CREATE USER TEST IDENTIFIED BY 12345;


--1. 접속 "권한부여!" (개별권한 부여)
grant create session to test;

--2.여러 작업의 권한을 가지고 있는 롤 부여
GRANT CONNECT, RESOURCE TO TEST;



-------------------------------------------------------------------------------

--TEST2 사용자 생성 (아무권한이 없는 사용자 생성) 
CREATE USER TEST2 IDENTIFIED BY 12345;

--권한부여
GRANT CREATE SESSION TO TEST2;
GRANT CONNECT, RESOURCE TO TEST2;

GRANT CREATE table TO TEST2;


--권한 취소
REVOKE CREATE table from TEST2;


--비밀번호 변경
ALTER USER TEST2 IDENTIFIED BY 00000;

--사용자 삭제 (사용자가 가진 객체가 아무것도 없을 대)
DROP USER TEST2;

--사용자와 객체 (테이블, 인덱스, 뷰 등..) 모두 삭제
DROP USER TEST2 cascade;





--201110
--수업에서 사용할 사용자 생성
CREATE USER JAVADB IDENTIFIED BY 12345;
GRANT CONNECT, RESOURCE TO JAVADB;




