alter table ads
modify ADMIN_NO NUMBER NULL;

create or replace view absView as
select  a.*, e.id , c.category_name_l, c.category_name
from ads a join expert e
on a.EXPERT_NO = e.EXPERT_NO
join categoryView c
on c.CATEGORY_NO_M = a.CATEGORY_NO;
commit;