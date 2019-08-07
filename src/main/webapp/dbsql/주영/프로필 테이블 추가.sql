
drop table expert_profile;
CREATE TABLE expert_profile (
       PROFILE_NO NUMBER PRIMARY KEY,
       EXPERT_NO NUMBER NOT NULL,
       MAJOR CLOB,
       LICENSE   CLOB,
       EDUCATION CLOB,
       CAREER CLOB,
   
      CONSTRAINT EXPERT_NO_PROFILE FOREIGN KEY (EXPERT_NO) REFERENCES EXPERT(EXPERT_NO)
    
);
CREATE SEQUENCE  expert_profile_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
;

alter table menu_info modify(activation default null);
commit;