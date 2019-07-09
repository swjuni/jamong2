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