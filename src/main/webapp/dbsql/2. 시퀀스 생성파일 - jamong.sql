select * from user_sequences;
/*시퀀스 종류
USER_INFO_SEQ	회원정보
MENU_INFO_SEQ	상품
COMPANY_SEQ	회사위치
ANNOUNCCE_SEQ	게시판_공지사항
FAQ_SEQ	FAQ
FAQ_CATEGORY_SEQ	FAQ카테고리
CATEGORY_L_SEQ	카테고리(대)
LOGS_SEQ	회원_로그인로그
ORDERS_SEQ	고객_주문
AUTHORITY_SEQ	권한
PAY_SEQ	결제
ADMINISTRATOR_SEQ	관리자
EXPERT_REQUEST_SEQ	전문가승인
INTEREST_SEQ	관심카테고리
CATEGORY_M_SEQ	카테고리(중)
ADS_SEQ	배너
PACKAGE_SEQ	패키지
PACKAGE_OPTIONS_SEQ	패키지옵션
IMAGE_SEQ	상품이미지
EXPERT_SEQ	전문가정보
EVALUATION_SEQ	서비스평가
COUPON_SEQ	쿠폰
IMG_DETAIL_SEQ	상품상세이미지
GUIDE_SEQ	안내페이지
SEARCH_TAG_SEQ	상품검색태그
CATEGORY_SEQ	상품검색카테고리
REPORT_SEQ	전문가신고
EXPERT_Q_SEQ	전문가문의
BOOKMARK_SEQ	즐겨찾기
SCHEDULE_SEQ	전문가일정
FILES_SEQ	자료실

*/



/* USER_INFO */
create sequence USER_INFO_SEQ
increment by 1
start with 1;

/* MENU_INFO */
create sequence MENU_INFO_SEQ
increment by 1
start with 1;

/* COMPANY */
create sequence COMPANY_SEQ
increment by 1
start with 1;

/* ANNOUNCCE */
create sequence ANNOUNCCE_SEQ
increment by 1
start with 1;

/* FAQ */
create sequence FAQ_SEQ
increment by 1
start with 1;

/* FAQ_CATEGORY */
create sequence FAQ_CATEGORY_SEQ
increment by 1
start with 1;

/* CATEGORY_L */
create sequence CATEGORY_L_SEQ
increment by 1
start with 1;

/* LOGS */
create sequence LOGS_SEQ
increment by 1
start with 1;

/* ORDERS */
create sequence ORDERS_SEQ
increment by 1
start with 1;

/* AUTHORITY */
create sequence AUTHORITY_SEQ
increment by 1
start with 1;

/* PAY */
create sequence PAY_SEQ
increment by 1
start with 1;

/* ADMINISTRATOR */
create sequence ADMINISTRATOR_SEQ
increment by 1
start with 1;

/* EXPERT_REQUEST */
create sequence EXPERT_REQUEST_SEQ
increment by 1
start with 1;

/* INTEREST */
create sequence INTEREST_SEQ
increment by 1
start with 1;

/* CATEGORY_M */
create sequence CATEGORY_M_SEQ
increment by 1
start with 1;

/* ADS */
create sequence ADS_SEQ
increment by 1
start with 1;

/* PACKAGE */
create sequence PACKAGE_SEQ
increment by 1
start with 1;

/* PACKAGE_OPTIONS */
create sequence PACKAGE_OPTIONS_SEQ
increment by 1
start with 1;

/* IMAGE */
create sequence IMAGE_SEQ
increment by 1
start with 1;

/* EXPERT */
create sequence EXPERT_SEQ
increment by 1
start with 1;

/* EVALUATION */
create sequence EVALUATION_SEQ
increment by 1
start with 1;

/* COUPON */
create sequence COUPON_SEQ
increment by 1
start with 1;

/* IMG_DETAIL */
create sequence IMG_DETAIL_SEQ
increment by 1
start with 1;

/* GUIDE */
create sequence GUIDE_SEQ
increment by 1
start with 1;

/* SEARCH_TAG */
create sequence SEARCH_TAG_SEQ
increment by 1
start with 1;

/* CATEGORY */
create sequence CATEGORY_SEQ
increment by 1
start with 1;

/* REPORT */
create sequence REPORT_SEQ
increment by 1
start with 1;

/* EXPERT_Q */
create sequence EXPERT_Q_SEQ
increment by 1
start with 1;

/* BOOKMARK */
create sequence BOOKMARK_SEQ
increment by 1
start with 1;

/* SCHEDULE */
create sequence SCHEDULE_SEQ
increment by 1
start with 1;

/* FILES */
create sequence FILES_SEQ
increment by 1
start with 1;
