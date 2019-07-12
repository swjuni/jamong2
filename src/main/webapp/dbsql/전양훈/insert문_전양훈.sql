--카테고리 대,중 입력
insert into CATEGORY_L (CATEGORY_NO,CATEGORY_NAME_L) values(1,'1');
insert into CATEGORY_M (CATEGORY_NO_M,CATEGORY_NO_L,CATEGORY_NAME,CATEGORY_DESC)values(1,1,'3','4');
insert into CATEGORY_M (CATEGORY_NO_M,CATEGORY_NO_L,CATEGORY_NAME,CATEGORY_DESC)values(2,1,'3','4');
insert into CATEGORY_M (CATEGORY_NO_M,CATEGORY_NO_L,CATEGORY_NAME,CATEGORY_DESC)values(3,1,'3','4');

--상품 입력
insert into MENU_INFO(PRODUCT_NO,CATEGORY_TYPE_NO,EXPERT_NO) values (1,1,1);
insert into MENU_INFO(PRODUCT_NO,CATEGORY_TYPE_NO,EXPERT_NO) values (2,2,1);
insert into MENU_INFO(PRODUCT_NO,CATEGORY_TYPE_NO,EXPERT_NO) values (3,3,1);
insert into MENU_INFO(PRODUCT_NO,CATEGORY_TYPE_NO,EXPERT_NO) values (5,3,1);


--관리자 입력

insert into ADMINISTRATOR values(ADMINISTRATOR_seq.nextval,'1','1','1',22);
insert into ADMINISTRATOR values(ADMINISTRATOR_seq.nextval,'2','2','2',22);
insert into ADMINISTRATOR values(ADMINISTRATOR_seq.nextval,'3','3','3',22);
insert into ADMINISTRATOR values(ADMINISTRATOR_seq.nextval,'4','4','4',22);

insert into authority values(authority_seq.nextval,'a','관리자',3);
commit;
select * from ADMINISTRATOR;
select * from authority;

--배너 임시 등록
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(1,1,1,3,sysdate,1000,'aa','aa',1000,1);
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(2,1,1,3,sysdate,1000,'aa','aa',1000,1);
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(3,1,1,3,sysdate,1000,'aa','aa',1000,1);
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(4,1,1,3,sysdate,1000,'aa','aa',1000,1);
select * from ads;
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(5,1,1,3,sysdate,1000,'aa','aa',1000,1);
select * from ads;
insert into ADS (ADS_NO,EXPERT_NO,CATEGORY_NO,REQUEST_PERIOD,START_DATE,PRICE,FILE_NAME,ORIGINAL_FILE_NAME,FILE_SIZE,ADMIN_NO) values
(6,1,1,3,sysdate,1000,'aa','aa',1000,1);
select * from ads;
commit;

--상품 년도 변경
update menu_info
set regdate = add_months(regdate, -12) 
where product_no=2; 

commit;

select * from ads;

--배너 년도 변경
update ads
set start_date = add_months(start_date, -12) 
where ads_no=6; 


update authority set author_name='aa',author_desc='관리자',author_lev=3
where author_no=21;
commit;

select * from authority;
select * from ADMINISTRATOR;

   update administrator 
   SET admin_name = '123',
       admin_pwd = '2',
       author_no = 21
   where admin_id='admin';
   commit;
