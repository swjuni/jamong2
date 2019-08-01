-- 회원정보
CREATE TABLE USER_INFO (
	USER_NO        NUMBER        NOT NULL, -- 회원번호
	USER_ID        VARCHAR2(20)  NOT NULL, -- 아이디
	USER_PWD       VARCHAR2(100) NOT NULL, -- 비밀번호
	USER_NAME      VARCHAR2(100) NOT NULL, -- 이름
	HP             VARCHAR2(20)  NULL,     -- 연락처
	ZIPCODE        VARCHAR2(10)  NULL,     -- 우편번호
	ADDRESS        VARCHAR2(100) NULL,     -- 주소
	ADDRESS_DETAIL VARCHAR2(100) NULL,     -- 상세주소
	REGDATE        DATE          DEFAULT sysdate, -- 등록일
	OUTDATE        DATE          NULL,     -- 탈퇴일
	ACTIVATION     VARCHAR2(10)  DEFAULT 'Y', -- 활성화
	AUTHOR_NO      NUMBER        DEFAULT 6 NOT NULL-- 권한번호
);

-- 회원정보 기본키
CREATE UNIQUE INDEX UserInfo
	ON USER_INFO ( -- 회원정보
		USER_NO ASC -- 회원번호
	);

-- 회원정보 유니크 인덱스
CREATE UNIQUE INDEX UIX_USER_INFO
	ON USER_INFO ( -- 회원정보
		USER_ID ASC -- 아이디
	);

-- 회원정보
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT UserInfo -- 회원정보 기본키
		PRIMARY KEY (
			USER_NO -- 회원번호
		);

-- 회원정보
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT UK_USER_INFO -- 회원정보 유니크 제약
		UNIQUE (
			USER_ID -- 아이디
		);

-- 상품
CREATE TABLE MENU_INFO (
	PRODUCT_NO       NUMBER        NOT NULL, -- 상품번호
	CATEGORY_TYPE_NO NUMBER        NULL,     -- 카테고리중번호
	PRODUCT_NAME     VARCHAR2(100) NULL,     -- 상품명
	EVAL_SCORE       NUMBER        NULL,     -- 상품평가점수
	SUMMARY          CLOB          NULL,     -- 요약설명
	DETAIL_DESC      CLOB          NULL,     -- 상세설명
	REGDATE          DATE          DEFAULT SYSDATE, -- 등록일
	ORDER_LEVEL      NUMBER        NULL,     -- 정렬레벨
	RECOMMEND        VARCHAR2(10)  NULL,     -- 추천
	ACTIVATION       VARCHAR2(10)  DEFAULT 'Y', -- 활성화
	EXPERT_NO        NUMBER        NOT NULL  -- 전문가정보번호
);

-- 상품 기본키
CREATE UNIQUE INDEX PK_MENU_INFO
	ON MENU_INFO ( -- 상품
		PRODUCT_NO ASC -- 상품번호
	);

-- 상품
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT PK_MENU_INFO -- 상품 기본키
		PRIMARY KEY (
			PRODUCT_NO -- 상품번호
		);

-- 회사위치
CREATE TABLE COMPANY (
	COMPANY_NO       NUMBER        NOT NULL, -- 회사위치번호
	C_NAME           VARCHAR2(100) NOT NULL, -- 회사명
	C_HP             VARCHAR2(20)  NULL,     -- 회사연락처
	C_ZIPCODE        VARCHAR2(10)  NULL,     -- 우편번호
	C_ADDRESS        VARCHAR2(100) NOT NULL, -- 주소
	C_ADDRESS_DETAIL VARCHAR2(100) NULL,     -- 상세주소
	C_LATITUDE       NUMBER(10,7)  NOT NULL, -- 위도
	C_LONGITUDE      NUMBER(10,7)  NOT NULL  -- 적도
);

-- 회사위치 기본키
CREATE UNIQUE INDEX PK_COMPANY
	ON COMPANY ( -- 회사위치
		COMPANY_NO ASC -- 회사위치번호
	);

-- 회사위치
ALTER TABLE COMPANY
	ADD
		CONSTRAINT PK_COMPANY -- 회사위치 기본키
		PRIMARY KEY (
			COMPANY_NO -- 회사위치번호
		);

-- 게시판_공지사항
CREATE TABLE ANNOUNCCE (
	ANNOUNCE_NO        NUMBER        NOT NULL, -- 공지사항번호
	TITLE              VARCHAR2(100) NOT NULL, -- 제목
	CONTENT            CLOB          NOT NULL, -- 내용
	FILE_NAME          VARCHAR2(100) NULL,     -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NULL,     -- 원본파일명
	FILE_SIZE          NUMBER        NULL,     -- 파일사이즈
	READ_COUNT         NUMBER        DEFAULT 0, -- 조회수
	REGDATE            DATE          DEFAULT sysdate, -- 작성일
	DELFLAG            VARCHAR2(50)  DEFAULT 'N', -- 삭제여부
	ADMIN_NO           NUMBER        NOT NULL  -- 관리자번호
);

-- 게시판_공지사항 기본키
CREATE UNIQUE INDEX PK_TABLE4
	ON ANNOUNCCE ( -- 게시판_공지사항
		ANNOUNCE_NO ASC -- 공지사항번호
	);

-- 게시판_공지사항
ALTER TABLE ANNOUNCCE
	ADD
		CONSTRAINT PK_TABLE4 -- 게시판_공지사항 기본키
		PRIMARY KEY (
			ANNOUNCE_NO -- 공지사항번호
		);

-- FAQ
CREATE TABLE FAQ (
	FAQ_NO      NUMBER        NOT NULL, -- FAQ번호
	FAQ_TITLE   VARCHAR2(150) NOT NULL, -- 제목
	FAQ_CONTENT CLOB          NOT NULL, -- 내용
	FAQ_REGDATE DATE          DEFAULT sysdate, -- 작성일
	FAQ_DELFLAG VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- 삭제여부
	FAQ_CATE_NO NUMBER        NOT NULL, -- FAQ카테고리번호
	ADMIN_NO    NUMBER        NULL      -- 관리자번호
);

-- FAQ 기본키
CREATE UNIQUE INDEX PK_TABLE11
	ON FAQ ( -- FAQ
		FAQ_NO ASC -- FAQ번호
	);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT PK_TABLE11 -- FAQ 기본키
		PRIMARY KEY (
			FAQ_NO -- FAQ번호
		);

-- FAQ카테고리
CREATE TABLE FAQ_CATEGORY (
	FAQ_CATE_NO NUMBER        NOT NULL, -- FAQ카테고리번호
	FAQ_NAME    VARCHAR2(100) NULL      -- 카테고리명
);

-- FAQ카테고리 기본키
CREATE UNIQUE INDEX PK_TABLE12
	ON FAQ_CATEGORY ( -- FAQ카테고리
		FAQ_CATE_NO ASC -- FAQ카테고리번호
	);

-- FAQ카테고리
ALTER TABLE FAQ_CATEGORY
	ADD
		CONSTRAINT PK_TABLE12 -- FAQ카테고리 기본키
		PRIMARY KEY (
			FAQ_CATE_NO -- FAQ카테고리번호
		);

-- 카테고리(대)
CREATE TABLE CATEGORY_L (
	CATEGORY_NO       NUMBER        NOT NULL, -- 카테고리대번호
	CATEGORY_NAME_L   VARCHAR2(100) NOT NULL, -- 카테고리명(대)
	CATEGORY_DESC     CLOB          NULL,     -- 카테고리설명
	IMG_NAME          VARCHAR2(100) NULL,     -- 이미지파일명
	IMG_ORIGINAL_NAME VARCHAR2(100) NULL,     -- 이미지원본파일명
	IMG_SIZE          NUMBER        NULL      -- 이미지사이즈
);

-- 카테고리(대) 기본키
CREATE UNIQUE INDEX PK_CATEGORY_L
	ON CATEGORY_L ( -- 카테고리(대)
		CATEGORY_NO ASC -- 카테고리대번호
	);

-- 카테고리(대)
ALTER TABLE CATEGORY_L
	ADD
		CONSTRAINT PK_CATEGORY_L -- 카테고리(대) 기본키
		PRIMARY KEY (
			CATEGORY_NO -- 카테고리대번호
		);

-- 회원_로그인로그
CREATE TABLE LOGS (
	LOGS_NO    NUMBER        NOT NULL, -- 회원_로그인로그번호
	USER_NO    NUMBER        NOT NULL, -- 회원번호
	LOGIN_IP   VARCHAR2(100) NULL,     -- 로그인IP
	LOGIN_OS   VARCHAR2(100) NULL,     -- 로그인OS
	LOGIN_TIME DATE          DEFAULT sysdate NULL -- 로그인시간
);

-- 회원_로그인로그 기본키
CREATE UNIQUE INDEX PK_TABLE14
	ON LOGS ( -- 회원_로그인로그
		LOGS_NO ASC -- 회원_로그인로그번호
	);

-- 회원_로그인로그
ALTER TABLE LOGS
	ADD
		CONSTRAINT PK_TABLE14 -- 회원_로그인로그 기본키
		PRIMARY KEY (
			LOGS_NO -- 회원_로그인로그번호
		);

-- 고객_주문
CREATE TABLE ORDERS (
	ORDER_LIST_NO  NUMBER       NOT NULL, -- 고객_주문번호
	ORDER_DATE     DATE         DEFAULT sysdate, -- 주문일
	PURCHASE_PRICE NUMBER       NULL,     -- 패키지구매시점금액
	COUPON_CHECK   VARCHAR2(10) DEFAULT 'N', -- 쿠폰적용여부
	PURCHASE_DATE  DATE         NULL,     -- 구매확정일자
	DELFALG        VARCHAR2(10) DEFAULT 'N' NOT NULL, -- 의뢰마감결과
	PAY_CHECK      VARCHAR2(10) DEFAULT 'N' NULL, -- 결제여부
	PACK_NO        NUMBER       NOT NULL, -- 패키지번호
	USER_NO        NUMBER       NOT NULL  -- 회원번호
);

-- 고객_주문 기본키
CREATE UNIQUE INDEX PK_ORDERS
	ON ORDERS ( -- 고객_주문
		ORDER_LIST_NO ASC -- 고객_주문번호
	);

-- 고객_주문
ALTER TABLE ORDERS
	ADD
		CONSTRAINT PK_ORDERS -- 고객_주문 기본키
		PRIMARY KEY (
			ORDER_LIST_NO -- 고객_주문번호
		);

-- 권한
CREATE TABLE AUTHORITY (
	AUTHOR_NO   NUMBER        NOT NULL, -- 권한번호
	AUTHOR_NAME VARCHAR2(100) NOT NULL, -- 권한명
	AUTHOR_DESC VARCHAR2(100) DEFAULT 'N' NOT NULL, -- 권한설명
	AUTHOR_LEV  NUMBER        NOT NULL  -- 권한레벨
);

-- 권한 기본키
CREATE UNIQUE INDEX PK_AUTHORITY
	ON AUTHORITY ( -- 권한
		AUTHOR_NO ASC -- 권한번호
	);

-- 권한
ALTER TABLE AUTHORITY
	ADD
		CONSTRAINT PK_AUTHORITY -- 권한 기본키
		PRIMARY KEY (
			AUTHOR_NO -- 권한번호
		);

-- 결제
CREATE TABLE PAY (
	PAY_NO     NUMBER        NOT NULL, -- 결제번호
	ORDER_NO   NUMBER        NOT NULL, -- 고객_주문번호
	PAY_METHOD VARCHAR2(100) NULL,     -- 결제수단
	PRICE      NUMBER        DEFAULT 0 NOT NULL, -- 결제금액
	REGDATE    DATE          DEFAULT sysdate -- 결제일
);

-- 결제 기본키
CREATE UNIQUE INDEX PK_PAY
	ON PAY ( -- 결제
		PAY_NO ASC -- 결제번호
	);

-- 결제
ALTER TABLE PAY
	ADD
		CONSTRAINT PK_PAY -- 결제 기본키
		PRIMARY KEY (
			PAY_NO -- 결제번호
		);

-- 관리자
CREATE TABLE ADMINISTRATOR (
	ADMIN_NO   NUMBER        NOT NULL, -- 관리자번호
	ADMIN_ID   VARCHAR2(20)  NOT NULL, -- 아이디
	ADMIN_PWD  VARCHAR2(100) NOT NULL, -- 비밀번호
	ADMIN_NAME VARCHAR2(100) NOT NULL, -- 이름
	AUTHOR_NO  NUMBER        NOT NULL  -- 권한번호
);

-- 관리자 기본키2
CREATE UNIQUE INDEX PK_TABLE29
	ON ADMINISTRATOR ( -- 관리자
		ADMIN_NO ASC -- 관리자번호
	);

-- 관리자 유니크 인덱스
CREATE UNIQUE INDEX UIX_ADMINISTRATOR
	ON ADMINISTRATOR ( -- 관리자
		ADMIN_ID ASC -- 아이디
	);

-- 관리자
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT PK_TABLE29 -- 관리자 기본키2
		PRIMARY KEY (
			ADMIN_NO -- 관리자번호
		);

-- 관리자
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT UK_ADMINISTRATOR -- 관리자 유니크 제약
		UNIQUE (
			ADMIN_ID -- 아이디
		);

-- 전문가승인
CREATE TABLE EXPERT_REQUEST (
	EXPERT_NO       NUMBER        NOT NULL, -- 전문가번호
	REQUEST_CONTENT VARCHAR2(100) NULL,     -- 승인요청내용
	REQUEST_DATE    DATE          DEFAULT SYSDATE, -- 신청일
	APPROVE_DATE    DATE          NULL,     -- 승인일
	DELFLAG         VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- 승인여부
	USER_NO         NUMBER        NOT NULL, -- 회원번호
	ADMIN_NO        NUMBER        NOT NULL  -- 관리자번호
);

-- 전문가승인 기본키
CREATE UNIQUE INDEX PK_EXPERT_REQUEST
	ON EXPERT_REQUEST ( -- 전문가승인
		EXPERT_NO ASC -- 전문가번호
	);

-- 전문가승인
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT PK_EXPERT_REQUEST -- 전문가승인 기본키
		PRIMARY KEY (
			EXPERT_NO -- 전문가번호
		);

-- 관심카테고리
CREATE TABLE INTEREST (
	INTEREST_NO      NUMBER NOT NULL, -- 관심카테고리번호
	USER_NO          NUMBER NULL,     -- 회원번호
	CATEGORY_TYPE_NO NUMBER NULL      -- 카테고리대번호
);

-- 관심카테고리 기본키
CREATE UNIQUE INDEX PK_INTEREST
	ON INTEREST ( -- 관심카테고리
		INTEREST_NO ASC -- 관심카테고리번호
	);

-- 관심카테고리
ALTER TABLE INTEREST
	ADD
		CONSTRAINT PK_INTEREST -- 관심카테고리 기본키
		PRIMARY KEY (
			INTEREST_NO -- 관심카테고리번호
		);

-- 카테고리(중)
CREATE TABLE CATEGORY_M (
	CATEGORY_NO_M     NUMBER        NOT NULL, -- 카테고리중번호
	CATEGORY_NO_L     NUMBER        NOT NULL, -- 카테고리대번호
	CATEGORY_NAME     VARCHAR2(100) NOT NULL, -- 카테고리명(중)
	CATEGORY_DESC     CLOB          NOT NULL, -- 카테고리설명
	IMG_NAME          VARCHAR2(100) NULL,     -- 이미지파일명
	IMG_ORIGINAL_NAME VARCHAR2(100) NULL,     -- 이미지원본파일명
	IMG_SIZE          NUMBER        NULL      -- 이미지사이즈
);

-- 카테고리(중) 기본키
CREATE UNIQUE INDEX PK_CATEGORY_M
	ON CATEGORY_M ( -- 카테고리(중)
		CATEGORY_NO_M ASC -- 카테고리중번호
	);

-- 카테고리(중)
ALTER TABLE CATEGORY_M
	ADD
		CONSTRAINT PK_CATEGORY_M -- 카테고리(중) 기본키
		PRIMARY KEY (
			CATEGORY_NO_M -- 카테고리중번호
		);

-- 배너
CREATE TABLE ADS (
	ADS_NO             NUMBER        NOT NULL, -- 배너_번호
	EXPERT_NO          NUMBER        NOT NULL, -- 전문가정보번호
	CATEGORY_NO        NUMBER        NOT NULL, -- 카테고리중번호
	REQUEST_PERIOD     NUMBER        NOT NULL, -- 신청기간
	START_DATE         DATE          NULL,     -- 광고시작
	END_DATE           DATE          NULL,     -- 광고마감
	PRICE              NUMBER        NOT NULL, -- 금액
	FILE_NAME          VARCHAR2(100) NOT NULL, -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- 원본파일명
	FILE_SIZE          NUMBER        NOT NULL, -- 파일사이즈
	APPROVE_DELFLAG    VARCHAR2(10)  DEFAULT 'N', -- 승인여부
	ACTIVATION         VARCHAR2(10)  DEFAULT 'N', -- 활성화
	ADMIN_NO           NUMBER        NULL  -- 관리자번호
);

-- 배너 기본키
CREATE UNIQUE INDEX PK_ADS
	ON ADS ( -- 배너
		ADS_NO ASC -- 배너_번호
	);

-- 배너
ALTER TABLE ADS
	ADD
		CONSTRAINT PK_ADS -- 배너 기본키
		PRIMARY KEY (
			ADS_NO -- 배너_번호
		);

-- 패키지
CREATE TABLE PACKAGE (
	PACK_NO        NUMBER        NOT NULL, -- 패키지번호
	PACK_LEVEL     VARCHAR2(50)  NOT NULL, -- 패키지등급
	PACK_PRICE     NUMBER        NOT NULL, -- 패키지가격
	PACK_NAME      VARCHAR2(100) NOT NULL, -- 패키지명
	PACK_DESC      CLOB          NOT NULL, -- 패키지설명
	WORKING_PERIOD NUMBER        DEFAULT 0, -- 작업기간
	MODIFY_COUNT   NUMBER        DEFAULT 0, -- 수정횟수
	PRODUCT_NO     NUMBER        NOT NULL  -- 상품번호
);

-- 패키지 기본키
CREATE UNIQUE INDEX PK_PACKAGE
	ON PACKAGE ( -- 패키지
		PACK_NO ASC -- 패키지번호
	);

-- 패키지
ALTER TABLE PACKAGE
	ADD
		CONSTRAINT PK_PACKAGE -- 패키지 기본키
		PRIMARY KEY (
			PACK_NO -- 패키지번호
		);

-- 패키지옵션
CREATE TABLE PACKAGE_OPTIONS (
	OPTIONS_NO   NUMBER        NOT NULL, -- 패키지옵션번호
	OPTIONS_NAME VARCHAR2(100) NOT NULL, -- 옵션명
	PACK_NO      NUMBER        NULL      -- 패키지번호
);

-- 패키지옵션 기본키
CREATE UNIQUE INDEX PK_PACKAGE_OPTIONS
	ON PACKAGE_OPTIONS ( -- 패키지옵션
		OPTIONS_NO ASC -- 패키지옵션번호
	);

-- 패키지옵션
ALTER TABLE PACKAGE_OPTIONS
	ADD
		CONSTRAINT PK_PACKAGE_OPTIONS -- 패키지옵션 기본키
		PRIMARY KEY (
			OPTIONS_NO -- 패키지옵션번호
		);

-- 상품이미지
CREATE TABLE IMAGE (
	IMG_NO             NUMBER        NOT NULL, -- 상품이미지번호
	FILE_NAME          VARCHAR2(100) NOT NULL, -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- 원본파일명
	FILE_SIZE          NUMBER        NOT NULL, -- 파일사이즈
	PRODUCT_NO         NUMBER        NOT NULL  -- 상품번호
);

-- 상품이미지 기본키
CREATE UNIQUE INDEX PK_IMAGE
	ON IMAGE ( -- 상품이미지
		IMG_NO ASC -- 상품이미지번호
	);

-- 상품이미지
ALTER TABLE IMAGE
	ADD
		CONSTRAINT PK_IMAGE -- 상품이미지 기본키
		PRIMARY KEY (
			IMG_NO -- 상품이미지번호
		);

-- 전문가정보
CREATE TABLE EXPERT (
	EXPERT_NO          NUMBER        NOT NULL, -- 전문가정보번호
	ID                 VARCHAR2(20)  NOT NULL, -- 닉네임
	FILE_NAME          VARCHAR2(100) NULL,     -- 로고파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NULL,     -- 로고원본파일명
	FILE_SIZE          NUMBER        NULL,     -- 로고사이즈
	SERVICEABLE_TIME   VARCHAR2(300) NULL,     -- 연락가능시간
	WORK_AMOUNT        NUMBER        DEFAULT 0, -- 작업수량
	INTRODUCTION       CLOB          NULL,     -- 소개
	ETC                VARCHAR2(500) NULL,     -- 기타정보
	BANK_NAME          VARCHAR2(20)  NULL,     -- 은행명
	ACCOUNT_NO         VARCHAR2(50)  NULL,     -- 계좌번호
	USER_NO            NUMBER        NOT NULL  -- 회원번호
);

-- 전문가정보 기본키
CREATE UNIQUE INDEX PK_EXPERT
	ON EXPERT ( -- 전문가정보
		EXPERT_NO ASC -- 전문가정보번호
	);

-- 전문가정보
ALTER TABLE EXPERT
	ADD
		CONSTRAINT PK_EXPERT -- 전문가정보 기본키
		PRIMARY KEY (
			EXPERT_NO -- 전문가정보번호
		);

-- 서비스평가
CREATE TABLE EVALUATION (
	EVAL_NO    NUMBER NOT NULL, -- 서비스평가번호
	PRODUCT_NO NUMBER NOT NULL, -- 상품번호
	EVAL_SCORE NUMBER DEFAULT 0, -- 평가점수
	REVIEW     CLOB   NULL,     -- 이용후기
	COL        DATE   DEFAULT SYSDATE, -- 평가일
	USER_NO    NUMBER NOT NULL  -- 회원번호
);

-- 서비스평가 기본키
CREATE UNIQUE INDEX PK_EVALUATION
	ON EVALUATION ( -- 서비스평가
		EVAL_NO ASC -- 서비스평가번호
	);

-- 서비스평가
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT PK_EVALUATION -- 서비스평가 기본키
		PRIMARY KEY (
			EVAL_NO -- 서비스평가번호
		);

-- 쿠폰
CREATE TABLE COUPON (
	CP_NO         NUMBER       NOT NULL, -- 쿠폰번호
	CP_NAME       VARCHAR2(50) NULL,     -- 쿠폰명
	CP_PRICE      NUMBER       NOT NULL, -- 쿠폰금액
	MIN_PRICE     NUMBER       NULL,     -- 적용최저금액
	EXPIRY_PERIOD DATE         NULL,     -- 적용기간
	DATE_OF_ISSUE DATE         DEFAULT SYSDATE, -- 발행일
	COL5          VARCHAR2(10) NULL,     -- 쿠폰종료여부
	ADMIN_NO      NUMBER       NOT NULL, -- 관리자번호
	USER_NO       NUMBER       NOT NULL, -- 회원번호
	ORDER_NO      NUMBER       NOT NULL  -- 고객_주문번호
);

-- 쿠폰 기본키
CREATE UNIQUE INDEX PK_COUPON
	ON COUPON ( -- 쿠폰
		CP_NO ASC -- 쿠폰번호
	);

-- 쿠폰
ALTER TABLE COUPON
	ADD
		CONSTRAINT PK_COUPON -- 쿠폰 기본키
		PRIMARY KEY (
			CP_NO -- 쿠폰번호
		);

-- 상품상세이미지
CREATE TABLE IMG_DETAIL (
	DETAIL_IMG_NO      NUMBER        NOT NULL, -- 상품상세이미지번호
	FILE_NAME          VARCHAR2(100) NOT NULL, -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- 원본파일명
	FILE_SIZE          NUMBER        NOT NULL, -- 파일사이즈
	PRODUCT_NO         NUMBER        NOT NULL  -- 상품번호
);

-- 상품상세이미지 기본키
CREATE UNIQUE INDEX PK_IMG_DETAIL
	ON IMG_DETAIL ( -- 상품상세이미지
		DETAIL_IMG_NO ASC -- 상품상세이미지번호
	);

-- 상품상세이미지
ALTER TABLE IMG_DETAIL
	ADD
		CONSTRAINT PK_IMG_DETAIL -- 상품상세이미지 기본키
		PRIMARY KEY (
			DETAIL_IMG_NO -- 상품상세이미지번호
		);

-- 안내페이지
CREATE TABLE GUIDE (
	GUIDE_NO  NUMBER        NOT NULL, -- 안내페이지번호
	PAGE_NAME VARCHAR2(100) NULL,     -- 페이지명
	CONTENT   CLOB          NULL,     -- 내용
	ADMIN_NO  NUMBER        NULL      -- 관리자번호
);

-- 안내페이지 기본키
CREATE UNIQUE INDEX PK_GUIDE
	ON GUIDE ( -- 안내페이지
		GUIDE_NO ASC -- 안내페이지번호
	);

-- 안내페이지
ALTER TABLE GUIDE
	ADD
		CONSTRAINT PK_GUIDE -- 안내페이지 기본키
		PRIMARY KEY (
			GUIDE_NO -- 안내페이지번호
		);

-- 상품검색태그
CREATE TABLE SEARCH_TAG (
	TAG_NO        NUMBER       NOT NULL, -- 상품검색태그번호
	CATEGORY_NO   NUMBER       NULL,     -- 상품검색카테고리번호
	TAG_NAME      VARCHAR2(50) NULL,     -- 태그이름
	CATEGORY_NO_M NUMBER       NULL,     -- 카테고리중번호
	PRODUCT_NO    NUMBER       NULL      -- 상품번호
);

-- 상품검색태그 기본키
CREATE UNIQUE INDEX PK_SEARCH_TAG
	ON SEARCH_TAG ( -- 상품검색태그
		TAG_NO ASC -- 상품검색태그번호
	);

-- 상품검색태그
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT PK_SEARCH_TAG -- 상품검색태그 기본키
		PRIMARY KEY (
			TAG_NO -- 상품검색태그번호
		);

-- 상품검색카테고리
CREATE TABLE CATEGORY (
	CATEGORY_NO         NUMBER       NOT NULL, -- 상품검색카테고리번호
	SEARCH_CATE_CONTENT VARCHAR2(50) NULL      -- 검색카테고리명
);

-- 상품검색카테고리 기본키
CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY ( -- 상품검색카테고리
		CATEGORY_NO ASC -- 상품검색카테고리번호
	);

-- 상품검색카테고리
ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY -- 상품검색카테고리 기본키
		PRIMARY KEY (
			CATEGORY_NO -- 상품검색카테고리번호
		);

-- 전문가신고
CREATE TABLE REPORT (
	REPORT_NO   NUMBER       NOT NULL, -- 전문가신고번호
	REPORT_DESC CLOB         NOT NULL, -- 신고내용
	REPORT_DATE DATE         DEFAULT SYSDATE NOT NULL, -- 신고일
	DELFLAG     VARCHAR2(10) NULL,     -- 승인여부
	REPORT_TYPE VARCHAR2(100) NULL,     -- 신고타입
	USER_NO     NUMBER       NOT NULL, -- 회원번호
	EXPERT_NO   NUMBER       NOT NULL, -- 전문가정보번호
	PRODUCT_NO  NUMBER       NOT NULL, -- 상품번호
	ADMIN_NO    NUMBER       NULL      -- 관리자번호
);

-- 전문가신고 기본키
CREATE UNIQUE INDEX PK_REPORT
	ON REPORT ( -- 전문가신고
		REPORT_NO ASC -- 전문가신고번호
	);

-- 전문가신고
ALTER TABLE REPORT
	ADD
		CONSTRAINT PK_REPORT -- 전문가신고 기본키
		PRIMARY KEY (
			REPORT_NO -- 전문가신고번호
		);

-- 전문가문의
CREATE TABLE EXPERT_Q (
	NO        NUMBER NOT NULL, -- 전문가문의번호
	INQ_DESC  CLOB   NOT NULL, -- 문의내용
	USER_NO   NUMBER NOT NULL, -- 회원번호
	EXPERT_NO NUMBER NOT NULL  -- 전문가정보번호
);

-- 전문가문의 기본키
CREATE UNIQUE INDEX PK_EXPERT_Q
	ON EXPERT_Q ( -- 전문가문의
		NO ASC -- 전문가문의번호
	);

-- 전문가문의
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT PK_EXPERT_Q -- 전문가문의 기본키
		PRIMARY KEY (
			NO -- 전문가문의번호
		);

-- 즐겨찾기
CREATE TABLE BOOKMARK (
	BOOKMARK_NO NUMBER NOT NULL, -- 즐겨찾기번호
	USER_NO     NUMBER NULL,     -- 회원번호
	EXPERT_NO   NUMBER NULL      -- 전문가정보번호
);

-- 즐겨찾기 기본키
CREATE UNIQUE INDEX PK_BOOKMARK
	ON BOOKMARK ( -- 즐겨찾기
		BOOKMARK_NO ASC -- 즐겨찾기번호
	);

-- 즐겨찾기
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT PK_BOOKMARK -- 즐겨찾기 기본키
		PRIMARY KEY (
			BOOKMARK_NO -- 즐겨찾기번호
		);

-- 전문가일정
CREATE TABLE SCHEDULE (
	SCHE_NO    NUMBER        NOT NULL, -- 전문가일정번호
	SCHE_NAME  VARCHAR2(100) NULL,     -- 일정명
	SCHE_DESC  VARCHAR2(200) NULL,     -- 일정내용
	START_DATE DATE          NOT NULL, -- 일정시작시간
	END_DATE   DATE          NOT NULL, -- 일정마감시간
	EXPERT_NO  NUMBER        NOT NULL  -- 전문가정보번호
);

-- 전문가일정 기본키
CREATE UNIQUE INDEX PK_SCHEDULE
	ON SCHEDULE ( -- 전문가일정
		SCHE_NO ASC -- 전문가일정번호
	);

-- 전문가일정
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE -- 전문가일정 기본키
		PRIMARY KEY (
			SCHE_NO -- 전문가일정번호
		);

-- 자료실
CREATE TABLE FILES (
	FILES_NO           NUMBER        NOT NULL, -- 자료실번호
	FILES_NAME         VARCHAR2(100) NOT NULL, -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- 원본파일명
	FILES_SIZE         NUMBER        NOT NULL, -- 파일사이즈
	ORDER_NO           NUMBER        NULL      -- 고객_주문번호
);

-- 자료실 기본키
CREATE UNIQUE INDEX PK_FILES
	ON FILES ( -- 자료실
		FILES_NO ASC -- 자료실번호
	);

-- 자료실
ALTER TABLE FILES
	ADD
		CONSTRAINT PK_FILES -- 자료실 기본키
		PRIMARY KEY (
			FILES_NO -- 자료실번호
		);

-- 메시지
CREATE TABLE MESSAGE (
	MESSAGE_NO         NUMBER        NOT NULL, -- 메시지번호
	USER_ID            VARCHAR2(20)  NOT NULL, -- 보낸아이디
	USER_ID2           VARCHAR2(20)  NOT NULL, -- 받는아이디
	CONTENTS           VARCHAR2(500) NULL,     -- 내용
	TRASH              VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- 휴지통여부
	TRASH2             VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- 상대방휴지통
	FILE_NAME          VARCHAR2(200) NULL,     -- 파일명
	ORIGINAL_FILE_NAME VARCHAR2(200) NULL,     -- 원본파일명
	FILE_SIZE          NUMBER        NULL,     -- 파일사이즈
	REGDATE            DATE          DEFAULT SYSDATE -- 날짜
);

-- 메시지 기본키
CREATE UNIQUE INDEX PK_MESSAGE
	ON MESSAGE ( -- 메시지
		MESSAGE_NO ASC -- 메시지번호
	);

-- 메시지
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT PK_MESSAGE -- 메시지 기본키
		PRIMARY KEY (
			MESSAGE_NO -- 메시지번호
		);

-- 전문가프로필
CREATE TABLE EXPERT_PROFILE (
	PROFILE_NO NUMBER NOT NULL, -- 전문가프로필번호
	EXPERT_NO  NUMBER NOT NULL, -- 전문가정보번호
	MAJOR      CLOB   NULL,     -- 전공
	LICENSE    CLOB   NULL,     -- 자격증
	EDUCATION  CLOB   NULL,     -- 학력
	CAREER     CLOB   NULL      -- 경력
);

-- 전문가프로필 기본키
CREATE UNIQUE INDEX PK_EXPERT_PROFILE
	ON EXPERT_PROFILE ( -- 전문가프로필
		PROFILE_NO ASC -- 전문가프로필번호
	);

-- 전문가프로필
ALTER TABLE EXPERT_PROFILE
	ADD
		CONSTRAINT PK_EXPERT_PROFILE -- 전문가프로필 기본키
		PRIMARY KEY (
			PROFILE_NO -- 전문가프로필번호
		);

-- 평가댓글
CREATE TABLE EVAL_COMMENT (
	EVAL_C_NO    NUMBER        NOT NULL, -- 평가댓글번호
	EVAL_NO      NUMBER        NOT NULL, -- 서비스평가번호
	USER_NO      NUMBER        NOT NULL, -- 회원번호
	EVAL_COMMENT VARCHAR2(500) NULL,     -- 댓글내용
	REGDATE      DATE          DEFAULT SYSDATE, -- 작성일
	GROUP_NO     NUMBER        NULL,     -- 그룹번호
	STEP         NUMBER        NULL,     -- 단계
	SORT_NO      NUMBER        NULL,     -- 정렬번호
	DELFLAG      VARCHAR(10)   DEFAULT 'N' -- 삭제여부
);

-- 평가댓글 기본키
CREATE UNIQUE INDEX PK_EVAL_COMMENT
	ON EVAL_COMMENT ( -- 평가댓글
		EVAL_C_NO ASC -- 평가댓글번호
	);

-- 평가댓글
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT PK_EVAL_COMMENT -- 평가댓글 기본키
		PRIMARY KEY (
			EVAL_C_NO -- 평가댓글번호
		);

-- 회원정보
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT FK_AUTHORITY_TO_USER_INFO -- 권한 -> 회원정보
		FOREIGN KEY (
			AUTHOR_NO -- 권한번호
		)
		REFERENCES AUTHORITY ( -- 권한
			AUTHOR_NO -- 권한번호
		);

-- 상품
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_MENU_INFO -- 카테고리(중) -> 상품
		FOREIGN KEY (
			CATEGORY_TYPE_NO -- 카테고리중번호
		)
		REFERENCES CATEGORY_M ( -- 카테고리(중)
			CATEGORY_NO_M -- 카테고리중번호
		);

-- 상품
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT FK_EXPERT_TO_MENU_INFO -- 전문가정보 -> 상품
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 게시판_공지사항
ALTER TABLE ANNOUNCCE
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_ANNOUNCCE -- 관리자 -> 게시판_공지사항
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT FK_FAQ_CATEGORY_TO_FAQ -- FAQ카테고리 -> FAQ
		FOREIGN KEY (
			FAQ_CATE_NO -- FAQ카테고리번호
		)
		REFERENCES FAQ_CATEGORY ( -- FAQ카테고리
			FAQ_CATE_NO -- FAQ카테고리번호
		);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_FAQ -- 관리자 -> FAQ
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 회원_로그인로그
ALTER TABLE LOGS
	ADD
		CONSTRAINT FK_USER_INFO_TO_LOGS -- 회원정보 -> 회원_로그인로그
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 고객_주문
ALTER TABLE ORDERS
	ADD
		CONSTRAINT ORDER_NO -- 패키지 -> 고객_주문
		FOREIGN KEY (
			PACK_NO -- 패키지번호
		)
		REFERENCES PACKAGE ( -- 패키지
			PACK_NO -- 패키지번호
		);

-- 고객_주문
ALTER TABLE ORDERS
	ADD
		CONSTRAINT FK_USER_INFO_TO_ORDERS -- 회원정보 -> 고객_주문
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 결제
ALTER TABLE PAY
	ADD
		CONSTRAINT FK_ORDERS_TO_PAY -- 고객_주문 -> 결제
		FOREIGN KEY (
			ORDER_NO -- 고객_주문번호
		)
		REFERENCES ORDERS ( -- 고객_주문
			ORDER_LIST_NO -- 고객_주문번호
		);

-- 관리자
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT FK_AUTHORITY_TO_ADMINISTRATOR -- 권한 -> 관리자
		FOREIGN KEY (
			AUTHOR_NO -- 권한번호
		)
		REFERENCES AUTHORITY ( -- 권한
			AUTHOR_NO -- 권한번호
		);

-- 전문가승인
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT_REQUEST -- 회원정보 -> 전문가승인
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 전문가승인
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT PERM_NO -- 관리자 -> 전문가승인
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 관심카테고리
ALTER TABLE INTEREST
	ADD
		CONSTRAINT FK_USER_INFO_TO_INTEREST -- 회원정보 -> 관심카테고리
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 관심카테고리
ALTER TABLE INTEREST
	ADD
		CONSTRAINT FK_CATEGORY_L_TO_INTEREST -- 카테고리(대) -> 관심카테고리
		FOREIGN KEY (
			CATEGORY_TYPE_NO -- 카테고리대번호
		)
		REFERENCES CATEGORY_L ( -- 카테고리(대)
			CATEGORY_NO -- 카테고리대번호
		);

-- 카테고리(중)
ALTER TABLE CATEGORY_M
	ADD
		CONSTRAINT FK_CATEGORY_L_TO_CATEGORY_M -- 카테고리(대) -> 카테고리(중)
		FOREIGN KEY (
			CATEGORY_NO_L -- 카테고리대번호
		)
		REFERENCES CATEGORY_L ( -- 카테고리(대)
			CATEGORY_NO -- 카테고리대번호
		);

-- 배너
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_ADS -- 관리자 -> 배너
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 배너
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_ADS -- 카테고리(중) -> 배너
		FOREIGN KEY (
			CATEGORY_NO -- 카테고리중번호
		)
		REFERENCES CATEGORY_M ( -- 카테고리(중)
			CATEGORY_NO_M -- 카테고리중번호
		);

-- 배너
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_EXPERT_TO_ADS -- 전문가정보 -> 배너
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 패키지
ALTER TABLE PACKAGE
	ADD
		CONSTRAINT FK_MENU_INFO_TO_PACKAGE -- 상품 -> 패키지
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 패키지옵션
ALTER TABLE PACKAGE_OPTIONS
	ADD
		CONSTRAINT FK_PACKAGE_TO_PACKAGE_OPTIONS -- 패키지 -> 패키지옵션
		FOREIGN KEY (
			PACK_NO -- 패키지번호
		)
		REFERENCES PACKAGE ( -- 패키지
			PACK_NO -- 패키지번호
		);

-- 상품이미지
ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_MENU_INFO_TO_IMAGE -- 상품 -> 상품이미지
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 전문가정보
ALTER TABLE EXPERT
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT -- 회원정보 -> 전문가정보
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 서비스평가
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT FK_MENU_INFO_TO_EVALUATION -- 상품 -> 서비스평가
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 서비스평가
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT FK_USER_INFO_TO_EVALUATION -- 회원정보 -> 서비스평가
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 쿠폰
ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_COUPON -- 관리자 -> 쿠폰
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 쿠폰
ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_USER_INFO_TO_COUPON -- 회원정보 -> 쿠폰
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 쿠폰
ALTER TABLE COUPON
	ADD
		CONSTRAINT END_CHECK -- 고객_주문 -> 쿠폰
		FOREIGN KEY (
			ORDER_NO -- 고객_주문번호
		)
		REFERENCES ORDERS ( -- 고객_주문
			ORDER_LIST_NO -- 고객_주문번호
		);

-- 상품상세이미지
ALTER TABLE IMG_DETAIL
	ADD
		CONSTRAINT FK_MENU_INFO_TO_IMG_DETAIL -- 상품 -> 상품상세이미지
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 안내페이지
ALTER TABLE GUIDE
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_GUIDE -- 관리자 -> 안내페이지
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 상품검색태그
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_CATEGORY_TO_SEARCH_TAG -- 상품검색카테고리 -> 상품검색태그
		FOREIGN KEY (
			CATEGORY_NO -- 상품검색카테고리번호
		)
		REFERENCES CATEGORY ( -- 상품검색카테고리
			CATEGORY_NO -- 상품검색카테고리번호
		);

-- 상품검색태그
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_SEARCH_TAG -- 카테고리(중) -> 상품검색태그
		FOREIGN KEY (
			CATEGORY_NO_M -- 카테고리중번호
		)
		REFERENCES CATEGORY_M ( -- 카테고리(중)
			CATEGORY_NO_M -- 카테고리중번호
		);

-- 상품검색태그
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_MENU_INFO_TO_SEARCH_TAG -- 상품 -> 상품검색태그
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 전문가신고
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_USER_INFO_TO_REPORT -- 회원정보 -> 전문가신고
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 전문가신고
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_EXPERT_TO_REPORT -- 전문가정보 -> 전문가신고
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 전문가신고
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_MENU_INFO_TO_REPORT -- 상품 -> 전문가신고
		FOREIGN KEY (
			PRODUCT_NO -- 상품번호
		)
		REFERENCES MENU_INFO ( -- 상품
			PRODUCT_NO -- 상품번호
		);

-- 전문가신고
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_REPORT -- 관리자 -> 전문가신고
		FOREIGN KEY (
			ADMIN_NO -- 관리자번호
		)
		REFERENCES ADMINISTRATOR ( -- 관리자
			ADMIN_NO -- 관리자번호
		);

-- 전문가문의
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT_Q -- 회원정보 -> 전문가문의
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 전문가문의
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT FK_EXPERT_TO_EXPERT_Q -- 전문가정보 -> 전문가문의
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 즐겨찾기
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_USER_INFO_TO_BOOKMARK -- 회원정보 -> 즐겨찾기
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 즐겨찾기
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_EXPERT_TO_BOOKMARK -- 전문가정보 -> 즐겨찾기
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 전문가일정
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_EXPERT_TO_SCHEDULE -- 전문가정보 -> 전문가일정
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 자료실
ALTER TABLE FILES
	ADD
		CONSTRAINT FK_ORDERS_TO_FILES -- 고객_주문 -> 자료실
		FOREIGN KEY (
			ORDER_NO -- 고객_주문번호
		)
		REFERENCES ORDERS ( -- 고객_주문
			ORDER_LIST_NO -- 고객_주문번호
		);

-- 메시지
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_INFO_TO_MESSAGE -- 회원정보 -> 메시지
		FOREIGN KEY (
			USER_ID -- 보낸아이디
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_ID -- 아이디
		);

-- 메시지
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_INFO_TO_MESSAGE2 -- 회원정보 -> 메시지2
		FOREIGN KEY (
			USER_ID2 -- 받는아이디
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_ID -- 아이디
		);

-- 전문가프로필
ALTER TABLE EXPERT_PROFILE
	ADD
		CONSTRAINT FK_EXPERT_TO_EXPERT_PROFILE -- 전문가정보 -> 전문가프로필
		FOREIGN KEY (
			EXPERT_NO -- 전문가정보번호
		)
		REFERENCES EXPERT ( -- 전문가정보
			EXPERT_NO -- 전문가정보번호
		);

-- 평가댓글
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT FK_USER_INFO_TO_EVAL_COMMENT -- 회원정보 -> 평가댓글
		FOREIGN KEY (
			USER_NO -- 회원번호
		)
		REFERENCES USER_INFO ( -- 회원정보
			USER_NO -- 회원번호
		);

-- 평가댓글
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT FK_EVALUATION_TO_EVAL_COMMENT -- 서비스평가 -> 평가댓글
		FOREIGN KEY (
			EVAL_NO -- 서비스평가번호
		)
		REFERENCES EVALUATION ( -- 서비스평가
			EVAL_NO -- 서비스평가번호
		)on delete cascade;