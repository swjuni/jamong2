insert into AUTHORITY values(authority_seq.nextval, '관리자', '관리자', 1);
insert into AUTHORITY values(authority_seq.nextval, '부관리자', '관리자', 2);
insert into AUTHORITY values(authority_seq.nextval, '골드', '전문가', 3);
insert into AUTHORITY values(authority_seq.nextval, '실버', '전문가', 4);
insert into AUTHORITY values(authority_seq.nextval, '우수', '일반회원', 5);
insert into AUTHORITY values(authority_seq.nextval, '일반', '일반회원', 6);

insert into administrator values(administrator_seq.nextval,'admin','1','관리자',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;

insert into FAQ_CATEGORY values(faq_category_seq.nextval, '이용안내'); 
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '가입/탈퇴');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '로그인/계정정보');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '서비스 구매하기');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '서비스 결제/환불');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '기타');

select * from authority;
select * from administrator;
select * from faq_category;

commit;