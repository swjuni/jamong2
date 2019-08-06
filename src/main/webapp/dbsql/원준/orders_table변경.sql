drop table orders cascade constraints;

-- 고객_주문
CREATE TABLE ORDERS (
	ORDER_NO     NUMBER       NOT NULL, -- 고객_주문번호
	ORDER_ID     VARCHAR2(50) NULL,     -- 주문ID
	ORDER_DATE   DATE         DEFAULT sysdate, -- 주문일
	PRICE        NUMBER       NULL,     -- 구매금액
	CONFIRM_DATE DATE         NULL, -- 판매확정일자
	PROGRESS     VARCHAR2(10) DEFAULT 'W', -- 진행상태
	FINISH_DATE  DATE         NULL, -- 거래종료일
	PACK_NO      NUMBER       NOT NULL, -- 패키지번호
	USER_NO      NUMBER       NOT NULL  -- 회원번호
);

-- 고객_주문 기본키
CREATE UNIQUE INDEX PK_ORDERS
	ON ORDERS ( -- 고객_주문
		ORDER_NO ASC -- 고객_주문번호
	);

-- 고객_주문
ALTER TABLE ORDERS
	ADD
		CONSTRAINT PK_ORDERS -- 고객_주문 기본키
		PRIMARY KEY (
			ORDER_NO -- 고객_주문번호
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
			ORDER_NO -- 고객_주문번호
		);

-- 쿠폰
ALTER TABLE COUPON
	ADD
		CONSTRAINT END_CHECK -- 고객_주문 -> 쿠폰
		FOREIGN KEY (
			ORDER_NO -- 고객_주문번호
		)
		REFERENCES ORDERS ( -- 고객_주문
			ORDER_NO -- 고객_주문번호
		);

-- 자료실
ALTER TABLE FILES
	ADD
		CONSTRAINT FK_ORDERS_TO_FILES -- 고객_주문 -> 자료실
		FOREIGN KEY (
			ORDER_NO -- 고객_주문번호
		)
		REFERENCES ORDERS ( -- 고객_주문
			ORDER_NO -- 고객_주문번호
		);