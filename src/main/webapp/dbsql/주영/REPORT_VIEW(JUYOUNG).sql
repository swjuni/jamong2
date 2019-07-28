create or replace view reportView
as
select r.*,e.id from
report r join expert e
on r.EXPERT_NO=e.EXPERT_NO;

create or replace view expertView
as
select e.*,u.outdate,u.activation,a.author_name from expert e
join user_info u
on e.user_no=u.user_no
join authority a
on a.author_no=u.author_no;

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

alter table ads
modify ADMIN_NO NUMBER NULL;

create or replace view absView as
select  a.*, e.id , c.category_name_l, c.category_name
from ads a join expert e
on a.EXPERT_NO = e.EXPERT_NO
join categoryView c
on c.CATEGORY_NO_M = a.CATEGORY_NO;

create or replace view  categoryView as
select m.*, l.category_name_l
from category_M m join category_L l
on m.category_No_l = l.category_No;


create or replace view  menuinfoView as
select m.*, e.id, c.category_name_l, c.category_name
from menu_info m join expert e
on m.expert_no = e.expert_no
join categoryView c
on m.category_type_no = c.category_no_m;

create or replace view show_ads
as
select e.ID, e.INTRODUCTION,a.FILE_NAME from ads a
join expert e on e.EXPERT_NO = a.EXPERT_NO
where start_date<=sysdate and end_date>=sysdate;
