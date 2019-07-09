alter table announcce
modify read_count default 0;

alter table announcce
modify regdate date;

alter table faq
modify faq_regdate date;

alter table faq
rename column faq_delfalg to faq_delflag;

