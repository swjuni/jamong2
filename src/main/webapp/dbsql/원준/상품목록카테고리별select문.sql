select * from CATEGORY; --상품검색카테고리 
select * from SEARCH_TAG; --상품검색태그
select * from authority; --등급권한
select * from CATEGORY_l ; --카테고리대
select * from CATEGORY_m ; --카테고리중
select * from menu_info; --상품
select * from image order by img_no desc; --상품이미지
select * from expert;
select * from expert_profile;

--이미지테이블에서 동일 제품은 첫번째 행만 가져오는 쿼리
select i.product_no, i.file_name
from image I join
(
select min(img_no) as img_no, product_no from image
group by product_no
)IJ 
on IJ.IMG_NO = I.IMG_NO
order by I.IMG_NO asc;


--전문가 선택하면 해당 전문가의 모든 상품을 보여주는 select문
select m.*, F.FILE_NAME
from MENU_INFO m join
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
where EXPERT_NO=1;


--카테고리(대) 선택해서 보여주는 select문 (모든 중카테고리를 포함)
select m.*, F.FILE_NAME, cl.CATEGORY_NO
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
where cl.CATEGORY_NO=12;

--카테고리(대) 중에서 카테고리(중)을 선택한 경우 보여주는 select문 (해당 중카테고리만 포함)
select m.*, F.FILE_NAME, cl.CATEGORY_NO, cl.CATEGORY_NAME_L, cm.CATEGORY_NAME,
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
on e.EXPERT_NO = m.EXPERT_NO
where cm.CATEGORY_NO_M=83;


--카테고리(대) 중에서 검색태그를 체크하면 보여주는 select문 (해당 대 카테고리에서 검색 태그를 포함하는) 

--카테고리(대) 중에서 카테고리(중)을 선택한 후 검색태그를 체크하면 보여주는 select문 (해당 중 카테고리에서 검색 태그를 포함하는)

/*
상품 태그 검색기능 사용할때 필요해보이는 코드
http://www.mybatis.org/mybatis-3/ko/dynamic-sql.html

delete from products
where productNo in
<!-- where productNo in (8,9) -->
<foreach item="pdNo" collection="pdNos" open="(" close=")" separator=",">
#{pdNo}
</foreach>

*/
