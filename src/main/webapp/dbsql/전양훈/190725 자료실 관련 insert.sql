--view 생성
create or replace view orderfilesview
as
select A.*,B.* from files A, orders B where A.ORDER_NO = B.ORDER_LIST_NO;

create or replace view expertmenuview
as
select A.product_no,A.product_name,B.* from menu_info A, expert B where A.EXPERT_NO = B.EXPERT_NO;

create or replace view packagemenuview
as
select A.product_name,B.* from menu_info A, package B where A.product_no = B.product_no;

create or replace view userfilesview
as
select A.product_no,A.product_name,B.* from packagemenuview A, orderfilesview B where A.PACK_NO = B.PACK_NO;

create or replace view expertfilesview
as
select A.product_no,A.PRODUCT_NAME,B.* from expertmenuview A, orderfilesview B where A.USER_NO = B.USER_NO;


--일반회원방향에서 자료 (구매자료)
select product_no,product_name,files_no,files_name,original_file_name,files_size,user_no,order_date from userfilesview where user_no=21;
select * from userfilesview where user_no=21;
--전문가방향에서 자료 (등록자료)
select product_no,product_name,files_no,files_name,original_file_name,files_size,user_no,order_date from expertfilesview where user_no=2;
select * from expertfilesview where user_no=41;


insert into menu_info (product_no, category_type_no, expert_no) values(menu_info_seq.nextval,81,21);
insert into package (pack_no, pack_level,pack_price,pack_name,pack_desc,product_no) values(package_seq.nextval,'1',500,'패키지1','패키지1이다',46);
insert into orders (order_list_no, pack_no, user_no) values (orders_seq.nextval,1,41);
insert into files (files_no, files_name, original_file_name,files_size,order_no) values (files_seq.nextval,'a.txt','a.txt',2000,2);

select * from menu_info;
select * from package;
select * from user_info;
select * from orders;
select * from files;
update files set files_name='b.txt',original_file_name='b.txt' where order_no=2;
select * from expert;
commit;