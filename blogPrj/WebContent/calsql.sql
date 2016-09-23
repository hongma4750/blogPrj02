DROP TABLE SCHWRITE
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_SIST_SCHWRITE;

CREATE TABLE SCHWRITE(
   sch_writenum number primary key,      -- seq
   sch_id varchar2(50) not null,         -- 작성자 이름
   sch_title varchar2(50) not null,      -- 캘린더 제목,
   sch_star number,                  -- 매우중요:2, 보통중요:1, 안중요:1
   sch_location varchar2(50),            -- 장소
   sch_startdate varchar2(50) not null,   -- 시작날짜 입력
   sch_starttime varchar2(50),            -- 시작시간 입력 
   sch_enddate varchar2(50) not null,      -- 끝날짜 입력
   sch_endtime varchar2(50),            -- 끝시간 입력
   sch_rdate varchar2(50) not null,      -- 등록하는 날짜 입력
   sch_allday number,                  -- 종일이면 1, 안 종일:0
   --sch_member varchar2(50),            -- 초대하는 친구
   sch_public number,                  -- 공개:0, 비공개:1
   sch_sticker varchar2(150),            -- 스티커 이름
   sch_content varchar2(150),            -- 내용
   sch_docname varchar2(150),            -- 문서 이름
   sch_alarm varchar2(50) not null,      -- 스케쥴 알람 시간 
   sch_finish number default 0,         -- 스케쥴 완료:1, 비완료:0   
   sch_calnum number            
);

CREATE SEQUENCE SEQ_SIST_SCHWRITE
START WITH 1 INCREMENT BY 1;

ALTER TABLE SCHWRITE
ADD CONSTRAINT FK_SIST_SCHWRITE FOREIGN KEY(sch_id)
REFERENCES MEMBER(m_id);  

ALTER TABLE SCHWRITE
ADD CONSTRAINT FK_SIST_SCHWRITE2 FOREIGN KEY(sch_calnum)
REFERENCES calendar(cal_num); 


select * from schwrite;
   