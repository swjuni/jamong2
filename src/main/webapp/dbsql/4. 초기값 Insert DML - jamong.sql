insert into AUTHORITY values(authority_seq.nextval, '관리자', '관리자', 1);
insert into AUTHORITY values(authority_seq.nextval, '부관리자', '관리자', 2);
insert into AUTHORITY values(authority_seq.nextval, '골드', '전문가', 3);
insert into AUTHORITY values(authority_seq.nextval, '실버', '전문가', 4);
insert into AUTHORITY values(authority_seq.nextval, '우수', '일반회원', 5);
insert into AUTHORITY values(authority_seq.nextval, '일반', '일반회원', 6);

insert into administrator values(administrator_seq.nextval,'admin','$2a$10$5GhWqUF/zAZEU2ERrtGVV.YxMExMVEc4LbDm9WiwIKHg.6D8AxrL.','관리자',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;

insert into FAQ_CATEGORY values(faq_category_seq.nextval, '이용안내'); 
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '가입/탈퇴');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '로그인/계정정보');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '서비스 구매하기');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '서비스 결제/환불');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '기타');


--카테고리 대분류
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'디자인');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'IT');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'콘텐츠 제작');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'마케팅');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'번역.통역');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'문서.취업');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'비즈니스 컨설팅');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'레슨');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'간판.인쇄');


--카테고리 중분류
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'3D 모델링','설명','1.png','1.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'배너','설명','2.png','2.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'웹.모바일 디자인','설명','3.png','3.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'PPT','설명','4.png','4.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'캘리그라피','설명','5.png','5.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'북커버','설명','6.png','6.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'일러스트','설명','7.png','7.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'포토샵','설명','8.png','8.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'현수막','설명','9.png','9.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='디자인'),'의류디자인','설명','10.png','10.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'워드프레스','설명','11.png','11.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'웹사이트 개발','설명','12.png','12.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'쇼핑몰','설명','13.png','13.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'모바일앱.웹','설명','14.png','14.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'프로그램 개발','설명','15.png','15.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'게임','설명','15.png','15.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'데이터베이스','설명','16.png','16.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'블록체인','설명','17.png','17.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'서버 및 기술 지원','설명','18.png','18.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'QA테스트','설명','19.png','19.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'영상','설명','20.png','20.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'사진','설명','21.png','21.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'더빙','설명','22.png','22.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'음악','설명','23.png','23.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'엔터테이너','설명','24.png','24.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='콘텐츠 제작'),'기타','설명','25.png','25.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'종합광고대행','설명','26.png','26.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'블로그.카페','설명','27.png','27.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'유튜버','설명','28.png','28.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'인스타 인플루언서','설명','29.png','29.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'SNS마케칭','설명','30.png','30.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'키워드 배너광고','설명','31.png','31.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'쇼핑몽.스토어','설명','32.png','32.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'앱마케팅','설명','33.png','33.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'언론홍보','설명','34.png','34.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='마케팅'),'기타','설명','35.png','35.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='번역.통역'),'번역','설명','36.jpg','36.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='번역.통역'),'통역','설명','37.jpg','37.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='번역.통역'),'영상번역','설명','38.jpg','38.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'면접.취업 코칭','설명','39.jpg','39.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'자소서.이력서','설명','40.jpg','40.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'카피라이팅','설명','41.jpg','41.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'논문','설명','42.jpg','42.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'글작성.대본','설명','43.jpg','43.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'타이핑','설명','44.jpg','44.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='문서.취업'),'기타','설명','45.jpg','45.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'사업계획','설명','46.jpg','46.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'법률.법무','설명','47.jpg','47.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'세무회계','설명','48.jpg','48.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'창업.경영진단','설명','49.jpg','49.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'리서치.서베이','설명','50.jpg','50.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'해외사업','설명','51.jpg','51.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'HR인사','설명','52.jpg','52.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='비즈니스 컨설팅'),'기타','설명','53.jpg','53.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'외국어','설명','54.jpg','54.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'컴퓨터','설명','55.jpg','55.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'마케팅','설명','56.jpg','56.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'커뮤니케이션','설명','57.jpg','57.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'영상.사진','설명','58.jpg','58.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'스포츠','설명','59.jpg','59.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'음악.악기','설명','60.jpg','60.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'취미.문화','설명','61.jpg','61.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='레슨'),'기타','설명','62.jpg','62.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='간판.인쇄'),'인쇄','설명','63.jpg','63.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='간판.인쇄'),'간판','설명','64.jpg','64.jpg');

select * from authority;
select * from administrator;
select * from faq_category;
select * from category_l;
select * from category_m;
commit;