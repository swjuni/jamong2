--VIEW 파일

--이주영
create or replace view reportView
as
select r.*,e.id from
report r join expert e
on r.EXPERT_NO=e.EXPERT_NO;

--이주영
create or replace view expertView
as
select e.*,u.outdate,u.activation,a.author_name from expert e
join user_info u
on e.user_no=u.user_no
join authority a
on a.author_no=u.author_no;

--이주영
create or replace view user_infoView
as
select u.*, a.AUTHOR_NAME,B.logtime from user_info u
left join authority a
on u.author_no=a.author_no
left join (
    select user_no,max(login_time) logtime from logs
    group by user_no
)B
on u.user_no=B.user_no
order by u.user_no;

--이주영
create or replace view absView as
select  a.*, e.id , c.category_name_l, c.category_name
from ads a join expert e
on a.EXPERT_NO = e.EXPERT_NO
join categoryView c
on c.CATEGORY_NO_M = a.CATEGORY_NO;

--이주영
create or replace view  categoryView as
select m.*, l.category_name_l
from category_M m join category_L l
on m.category_No_l = l.category_No;

--이주영
create or replace view  menuinfoView as
select m.*, e.id, c.category_name_l, c.category_name
from menu_info m join expert e
on m.expert_no = e.expert_no
join categoryView c
on m.category_type_no = c.category_no_m;

--이주영
create or replace view show_ads
as
select e.ID, e.INTRODUCTION,a.FILE_NAME from ads a
join expert e on e.EXPERT_NO = a.EXPERT_NO
where start_date<=sysdate and end_date>=sysdate;

-----------------------------------------

--전양훈
create or replace view orderfilesview
as
select B.price,B.CONFIRM_DATE,B.order_no,B.ORDER_DATE,B.PACK_NO as pack_no2,B.USER_NO as CUSTOMER_NO,A.files_no,A.files_name,A.original_file_name,A.files_size from files A, orders B where A.ORDER_NO = B.ORDER_NO;
select * from orderfilesview;

--전양훈
create or replace view packagemenuview
as
select A.*,B.pack_no from menu_info A, package B where A.product_no = B.product_no;
select * from packagemenuview;

--전양훈
create or replace view orfipameview
as
select A.*,B.* from orderfilesview A, packagemenuview B where A.PACK_NO2=B.PACK_NO;

select * from orfipameview;

create or replace view EXorfipameview
as
select A.*,B.user_no as SELLER_NO from orfipameview A, expert B where  A.EXPERT_NO=B.EXPERT_NO;

select * from EXorfipameview;
select sum(price) price,seller_no,TO_CHAR(confirm_date, 'yyyy-mm') confirm_date from EXorfipameview where seller_no=41
group by seller_no,TO_CHAR(confirm_date, 'yyyy-mm');
commit;

---------------------------------------

--원준
create or replace view MENULISTCATEGORYVIEW
as
select 
m.product_no, m.category_type_no, m.product_name,
(select sum(eval_score)/count(*) from evaluation ev where ev.product_no=m.product_no  ) as eval_score,
m.summary, m.detail_desc, m.regdate, m.order_level, m.recommend, m.activation, m.expert_no,
F.FILE_NAME, cl.CATEGORY_NO, cl.CATEGORY_NAME_L, cm.CATEGORY_NAME,
e.id, e.FILE_NAME as expert_file_name, p.PACK_PRICE
from MENU_INFO m join CATEGORY_M cm
on m.CATEGORY_TYPE_NO = cm.CATEGORY_NO_M
join CATEGORY_L cl
on cl.CATEGORY_NO = cm.CATEGORY_NO_L
join
(
    select i.product_no, i.file_name
    from image I join
    (
    select min(img_no) as img_no, product_no from image
    group by product_no
    )IJ 
    on IJ.IMG_NO = I.IMG_NO
    order by I.IMG_NO asc
)F
on m.PRODUCT_NO = F.PRODUCT_NO
join expert e
on e.EXPERT_NO = m.EXPERT_NO
join
(
select product_no, min(pack_price) as pack_price
from package
group by product_no
) p
on p.PRODUCT_NO = m.PRODUCT_NO;