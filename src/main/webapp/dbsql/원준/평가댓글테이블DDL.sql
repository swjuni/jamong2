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
		
		
		select * from message;
		