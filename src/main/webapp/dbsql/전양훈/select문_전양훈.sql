--현재 회원 (일반+전문가)
select count(*) 
from user_info where outdate is null;

--현재 전문가
select count(*) 
from user_info a join EXPERT_REQUEST b on
a.USER_NO = b.USER_NO
where outdate is null;

--카테고리(중) 조회
select * from CATEGORY_M;

--카테고리(중)별 상품수
select CATEGORY_NAME,count(*) "상품수" from
(select * from MENU_INFO a join CATEGORY_M b on
a.CATEGORY_TYPE_NO = b.CATEGORY_NO_M)
group by CATEGORY_NAME;

select * from authority;
select * from menu_info;
--년도별 상품 개수 구하기
SELECT * FROM (
select TO_CHAR(regdate,'YYYY') REGDATE,count(*) COUNT from menu_info
group by TO_CHAR(regdate,'YYYY')
)
ORDER BY REGDATE;

select * from ads;
commit;

