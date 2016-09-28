--블로그 테이블

--1. 블로그 게시판 테이블----------------
select * from BLOG_BBS;

DROP TABLE blog_bbs
CASCADE CONSTRAINT;

drop sequence seq_blogbbs;

create table blog_bbs(
	bbs_seq number not null, --seq
	m_id varchar2(50) not null,--회원id
	bbs_ca_seq number not null,--카테고리 seq
	bbs_title varchar2(200) not null,--글제목
	bbs_content varchar2(4000) not null,--글내용
	bbs_img varchar2(4000),--이미지 경로
	poll_seq number,--투표 seq
	topic_seq number,--주제분류 seq
	bbs_hid number not null,--공개 여부.전체공개(0),이웃공개(1),서로이웃공개(2),비공개(3)
	bbs_comchk number not null,--댓글 허용 여부(비허용 하면 안보임). 댓글허용(0), 댓글비허용(1)
	bbs_likechk number not null, --공감 허용 여부. 공감허용(0), 공감비허용(1)
	bbs_scrapchk number not null, --스크랩 허용 여부
	bbs_date date not null,
	bbs_like_count number not null,
	primary key(bbs_seq)
);

create sequence seq_blogbbs
start with 1 increment by 1;


 
alter table blog_bbs
add constraint fk_blogbbs_id foreign key(m_id)
references member(m_id);

select * from blog_bbs;



--2.공감 테이블 --------------------------

select * from bbs_like;

DROP TABLE bbs_like
CASCADE CONSTRAINT;

drop sequence seq_bbslike;

create table bbs_like(
	like_seq number not null,
	m_id varchar2(50) not null,
	blog_title varchar2(50), --원래 not null인데 지금 블로그정보 안했으니까
	bbs_seq number not null,
	like_date date,
	primary key(like_seq)
);


create sequence seq_bbslike
start with 1 increment by 1;

alter table bbs_like
add constraint fk_bbslike_id foreign key(m_id)
references member(m_id);



-- 3.댓글 테이블 --------

select * from bbs_comment;

DROP TABLE bbs_comment
CASCADE CONSTRAINT;

drop sequence seq_bbscomment;

create table bbs_comment(
	com_seq number not null,
	bbs_seq number not null,
	com_content varchar2(200) not null,
	m_id varchar2(50) not null,
	blog_nickname varchar2(50) not null,
	com_ref number not null,
	com_step number not null,
	com_depth number not null,
	com_del number not null,
	com_parent number not null,
	com_date date not null,
	primary key(com_seq)
);


create sequence seq_bbscomment
start with 1 increment by 1;

alter table bbs_comment
add constraint fk_bbscomment_id foreign key(m_id)
references member(m_id);


SELECT COM.COM_SEQ,COM.BBS_SEQ, COM.COM_CONTENT,COM.COM_REF, COM.COM_STEP,COM.COM_DEPTH,
COM.COM_DEL,COM.COM_PARENT,COM.COM_DATE,MEM.M_ID,MEM.M_PHOTO
FROM BBS_COMMENT COM, MEMBER MEM
WHERE BBS_SEQ=2 AND COM.M_ID=MEM.M_ID
ORDER BY COM_REF DESC, COM_STEP ASC









