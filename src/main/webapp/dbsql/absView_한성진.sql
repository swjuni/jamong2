create or replace view absView as
select  a.*, e.id , c.category_name_l, c.category_name, ad.admin_name
from ads a join expert e
on a.EXPERT_NO = e.EXPERT_NO
join categoryView c
on c.CATEGORY_NO_M = a.CATEGORY_NO
join ADMINISTRATOR ad
on ad.ADMIN_NO = a.ADMIN_NO;