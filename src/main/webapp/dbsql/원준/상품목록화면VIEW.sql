create or replace view MENULISTCATEGORYVIEW
as
select 
m.product_no, m.category_type_no, m.product_name,
(select sum(eval_score)/count(*) from evaluation ev where ev.product_no=m.product_no  ) as eval_score,
m.summary, m.detail_desc, m.regdate, m.order_level, m.recommend, m.activation, m.expert_no,
F.FILE_NAME, cl.CATEGORY_NO, cl.CATEGORY_NAME_L, cm.CATEGORY_NAME,
e.id, e.FILE_NAME as expert_file_name
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
on e.EXPERT_NO = m.EXPERT_NO;