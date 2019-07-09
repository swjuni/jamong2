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