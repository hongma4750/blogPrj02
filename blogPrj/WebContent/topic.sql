----- topic 
drop table topic
cascade constraint;

drop sequence seq_topic;

create table topic(
   t_seq number primary key,      -- seq
   topic_seq number not null,   
   t_name varchar2(50)          -- 주제명
);
create sequence seq_topic 
start with 1 increment by 1; 

ALTER TABLE topic
ADD CONSTRAINT FK_SIST_topic FOREIGN KEY(topic_seq)
REFERENCES blog_bbs(topic_seq);


insert into topic values(seq_topic.NEXTVAL, 1, '음악'); -- 1
insert into topic values(seq_topic.NEXTVAL, 2, '영화'); -- 2
insert into topic values(seq_topic.NEXTVAL, 3, '스포츠'); -- 3
insert into topic values(seq_topic.NEXTVAL, 4, '세계여행'); -- 4
insert into topic values(seq_topic.NEXTVAL, 5, '일상·생각'); -- 5

insert into topic values(seq_topic.NEXTVAL, 6, '전체'); --6

update blog_bbs set topic_seq=1 where bbs_seq=2;
update blog_bbs set topic_seq=5 where bbs_seq=29;
update blog_bbs set topic_seq=5 where bbs_seq=30;
update blog_bbs set topic_seq=5 where bbs_seq=31;
update blog_bbs set topic_seq=5 where bbs_seq=32;
update blog_bbs set topic_seq=5 where bbs_seq=33;
update blog_bbs set topic_seq=5 where bbs_seq=34;
update blog_bbs set topic_seq=5 where bbs_seq=37;
select *  from blog_bbs;
----------------------------------------------------------------------------------

SELECT distinct NVL(COUNT(B.BBS_SEQ),0) AS BBS_LIKES, A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE
FROM BLOG_BBS A, BBS_LIKE B
WHERE A.TOPIC_SEQ=2 or  B.BBS_SEQ=NULL and A.BBS_SEQ = B.BBS_SEQ 
GROUP BY A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE, b.bbs_Seq

select * from bbs_like

select *  from topic;

SELECT distinct A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE, NVL(COUNT(B.BBS_SEQ),0) as likes
FROM BLOG_BBS A, BBS_LIKE B
WHERE A.TOPIC_SEQ=2 
GROUP BY A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE

having count(b.BBS_SEQ)=null or count(b.BBS_SEQ)>=1


SELECT distinct A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE, NVL(COUNT(B.BBS_SEQ),0) AS BBS_LIKES
FROM BLOG_BBS A, BBS_LIKE B
WHERE A.TOPIC_SEQ=2
GROUP BY A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE


SELECT A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE, A.bbs_like_count
FROM BLOG_BBS A
GROUP BY A.BBS_TITLE, A.BBS_CONTENT, A.BBS_IMG, A.BBS_DATE



SELECT BBS_TITLE, BBS_CONTENT, BBS_IMG, BBS_DATE, bbs_like_count
FROM BLOG_BBS 
WHERE TOPIC_SEQ=1AND BBS_HID=0
ORDER BY BBS_LIKE_COUNT DESC


SELECT BBS_TITLE, BBS_CONTENT, BBS_IMG, BBS_DATE, bbs_like_count
FROM BLOG_BBS 
WHERE TOPIC_SEQ=1 AND BBS_HID=0
ORDER BY BBS_DATE DESC;


SELECT BBS_TITLE, BBS_CONTENT, BBS_IMG, BBS_DATE, BBS_LIKE_COUNT
FROM BLOG_BBS 
WHERE TOPIC_SEQ=1 AND BBS_HID=0
ORDER BY BBS_LIKE_COUNT DESC

