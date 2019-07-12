DELETE FROM AUTHORITY;
delete from administrator;

insert into AUTHORITY values(authority_seq.nextval, '관리자', '관리자', 1);
insert into AUTHORITY values(authority_seq.nextval, '부관리자', '관리자', 2);
insert into AUTHORITY values(authority_seq.nextval, '골드', '전문가', 3);
insert into AUTHORITY values(authority_seq.nextval, '실버', '전문가', 4);
insert into AUTHORITY values(authority_seq.nextval, '우수', '일반회원', 5);
insert into AUTHORITY values(authority_seq.nextval, '일반', '일반회원', 6);

insert into administrator values(administrator_seq.nextval,'admin','1','관리자',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;
select * from AUTHORITY;
select * from administrator;

select * from  AUTHORITY where author_desc ='관리자';
select * from  AUTHORITY where author_desc ='전문가';
select * from  AUTHORITY where author_desc ='일반회원';
commit;
select * from menuinfoView;