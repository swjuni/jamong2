select * from user_info;
select * from expert;
select * from bookmark;
select * from menu_info;
select * from image;
select * from category_m;

select *
from
(
    select i.*, rownum as RNUM
    from menu_info m join image i
    on m.PRODUCT_NO = i.PRODUCT_NO
    where m.PRODUCT_NO=2
    order by img_no
)A
where rnum=1;

select b.bookmark_no, b.user_no, e.expert_no, e.id, e.file_name, e.introduction
from BOOKMARK b join expert e
on b.expert_no=e.expert_no
where b.user_no=3;

select * from user_sequences;


insert into image
values(image_seq.nextval, '2.png', '2.png',0,2);

update menu_info
set category_type_no=83
where product_no=2;

commit;