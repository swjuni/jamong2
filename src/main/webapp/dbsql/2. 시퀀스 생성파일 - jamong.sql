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

--시퀀스 삭제

/* USER_INFO */
drop sequence USER_INFO_SEQ;

/* MENU_INFO */
drop sequence MENU_INFO_SEQ;

/* COMPANY */
drop sequence COMPANY_SEQ;

/* ANNOUNCCE */
drop sequence ANNOUNCCE_SEQ;

/* FAQ */
drop sequence FAQ_SEQ;

/* FAQ_CATEGORY */
drop sequence FAQ_CATEGORY_SEQ;

/* CATEGORY_L */
drop sequence CATEGORY_L_SEQ;

/* LOGS */
drop sequence LOGS_SEQ;

/* ORDERS */
drop sequence ORDERS_SEQ;

/* AUTHORITY */
drop sequence AUTHORITY_SEQ;

/* PAY */
drop sequence PAY_SEQ;

/* ADMINISTRATOR */
drop sequence ADMINISTRATOR_SEQ;

/* EXPERT_REQUEST */
drop sequence EXPERT_REQUEST_SEQ;

/* INTEREST */
drop sequence INTEREST_SEQ;

/* CATEGORY_M */
drop sequence CATEGORY_M_SEQ;

/* ADS */
drop sequence ADS_SEQ;

/* PACKAGE */
drop sequence PACKAGE_SEQ;

/* PACKAGE_OPTIONS */
drop sequence PACKAGE_OPTIONS_SEQ;

/* IMAGE */
drop sequence IMAGE_SEQ;

/* EXPERT */
drop sequence EXPERT_SEQ;

/* EVALUATION */
drop sequence EVALUATION_SEQ;

/* COUPON */
drop sequence COUPON_SEQ;

/* IMG_DETAIL */
drop sequence IMG_DETAIL_SEQ;

/* GUIDE */
drop sequence GUIDE_SEQ;

/* SEARCH_TAG */
drop sequence SEARCH_TAG_SEQ;

/* CATEGORY */
drop sequence CATEGORY_SEQ;

/* REPORT */
drop sequence REPORT_SEQ;

/* EXPERT_Q */
drop sequence EXPERT_Q_SEQ;

/* BOOKMARK */
drop sequence BOOKMARK_SEQ;

/* SCHEDULE */
drop sequence SCHEDULE_SEQ;

/* FILES */
drop sequence FILES_SEQ;



--시퀀스 생성

/* USER_INFO */
create sequence USER_INFO_SEQ
increment by 1
start with 1
nocache;

/* MENU_INFO */
create sequence MENU_INFO_SEQ
increment by 1
start with 1
nocache;

/* COMPANY */
create sequence COMPANY_SEQ
increment by 1
start with 1
nocache;

/* ANNOUNCCE */
create sequence ANNOUNCCE_SEQ
increment by 1
start with 1
nocache;

/* FAQ */
create sequence FAQ_SEQ
increment by 1
start with 1
nocache;

/* FAQ_CATEGORY */
create sequence FAQ_CATEGORY_SEQ
increment by 1
start with 1
nocache;

/* CATEGORY_L */
create sequence CATEGORY_L_SEQ
increment by 1
start with 1
nocache;

/* LOGS */
create sequence LOGS_SEQ
increment by 1
start with 1
nocache;

/* ORDERS */
create sequence ORDERS_SEQ
increment by 1
start with 1
nocache;

/* AUTHORITY */
create sequence AUTHORITY_SEQ
increment by 1
start with 1
nocache;

/* PAY */
create sequence PAY_SEQ
increment by 1
start with 1
nocache;

/* ADMINISTRATOR */
create sequence ADMINISTRATOR_SEQ
increment by 1
start with 1
nocache;

/* EXPERT_REQUEST */
create sequence EXPERT_REQUEST_SEQ
increment by 1
start with 1
nocache;

/* INTEREST */
create sequence INTEREST_SEQ
increment by 1
start with 1
nocache;

/* CATEGORY_M */
create sequence CATEGORY_M_SEQ
increment by 1
start with 1
nocache;

/* ADS */
create sequence ADS_SEQ
increment by 1
start with 1
nocache;

/* PACKAGE */
create sequence PACKAGE_SEQ
increment by 1
start with 1
nocache;

/* PACKAGE_OPTIONS */
create sequence PACKAGE_OPTIONS_SEQ
increment by 1
start with 1
nocache;

/* IMAGE */
create sequence IMAGE_SEQ
increment by 1
start with 1
nocache;

/* EXPERT */
create sequence EXPERT_SEQ
increment by 1
start with 1
nocache;

/* EVALUATION */
create sequence EVALUATION_SEQ
increment by 1
start with 1
nocache;

/* COUPON */
create sequence COUPON_SEQ
increment by 1
start with 1
nocache;

/* IMG_DETAIL */
create sequence IMG_DETAIL_SEQ
increment by 1
start with 1
nocache;

/* GUIDE */
create sequence GUIDE_SEQ
increment by 1
start with 1
nocache;

/* SEARCH_TAG */
create sequence SEARCH_TAG_SEQ
increment by 1
start with 1
nocache;

/* CATEGORY */
create sequence CATEGORY_SEQ
increment by 1
start with 1
nocache;

/* REPORT */
create sequence REPORT_SEQ
increment by 1
start with 1
nocache;

/* EXPERT_Q */
create sequence EXPERT_Q_SEQ
increment by 1
start with 1
nocache;

/* BOOKMARK */
create sequence BOOKMARK_SEQ
increment by 1
start with 1
nocache;

/* SCHEDULE */
create sequence SCHEDULE_SEQ
increment by 1
start with 1
nocache;

/* FILES */
create sequence FILES_SEQ
increment by 1
start with 1
nocache;
