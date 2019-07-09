--1단계
--테이블스페이스 생성, 사용자 생성, 롤(권한 묶음) 부여

--테이블 스페이스 생성
create tablespace tb_jamong
datafile 'C:\oraclexe\app\oracle\oradata\XE\tb_jamong.dbf' size 48m
autoextend on next 10m;
--학원에서는 동일한 경로로 추가 / 집에서는 각자 사용하는 폴더 만들어서 테이블 스페이스 생성


--사용자 생성
create user jamong
identified by jamong123
default tablespace tb_jamong;

--롤 권한 부여
grant resource, connect to jamong;
--semiuser 사용자에게 resource, connect 롤 부여하기
--일반적으로 새유저에 2개의 롤을 추가하고 view권한정도만 따로 추가한다

--뷰 권한 부여
grant create view to jamong;

--여기까지 1단계


--2단계
--생성된 정보 확인

--사용자 계정 정보 조회 (sys계정으로 접속해서 실행)
select * from dba_users where username like '%JAMONG%';    --default_tablespace
--데이터 파일에 대한 정보 조회
select * from dba_data_files;
select * from dba_data_files where tablespace_name like 'TB_JAMONG';
--테이블 스페이스에 대한 정보 조회
select * from dba_tablespaces;

--권한 조회
select * from dba_sys_privs where grantee='JAMONG';   --권한 조회
select * from dba_role_privs where grantee='JAMONG';  --롤 조회

--사용자 테이블 정보 조회
--select * from user_tables;
--select * from user_views;
--select * from user_sequences;
--select * from user_constraints;

--여기까지 2단계

--3단계
--생성 계정 비번변경 / 사용자 삭제 / 테이블스페이스 삭제

--기존 계정의 암호 변경하기
--alter user jamong identified by jamong123;

--사용자 삭제
--drop user JAMONG cascade;

--테이블스페이스 제거
--drop tablespace TB_JAMONG
--including contents and datafiles; --물리적인 데이터 파일까지 삭제 옵션