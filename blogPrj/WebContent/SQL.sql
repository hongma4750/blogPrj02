DROP TABLE member
CASCADE CONSTRAINT;

create table member(
	m_id varchar2(50) primary key,			-- 아이디
	m_pw varchar2(2000),			-- 비밀번호
	m_name varchar2(50),
	m_gender varchar2(2),
	m_birthday varchar2(12),
	m_email varchar2(50),		-- 이메일
	m_phone varchar2(50),		-- 전화번호
	M_PHOTO VARCHAR2(1000),
  
	m_action number default 0,		-- 인증
  
	--m_logchk number default 0, 		-- 로그인 실패 카운트
	--m_logdate date,			-- 로그인 한 날
	--m_faildate date,			-- 로그인 실패했을 때, 시간 입력
	m_auth number
);

insert into member values('a','a','aaaaa','m','20190705','aa','10010101','no_image','0',3);
insert into member values('b','b','aaaaa','m','20190705','aa','10010101','no_image','1',3);
insert into member values('aa1212','aa1212','aaaaa','m','20190705','aa','10010101','no_image','1',3);
select * from member;

update member set m_action = 1 where m_id = 'aa1212';
update member set m_action = 1 where m_id = 'b';


SELECT M_ID,M_NAME, M_GENDER, M_BIRTHDAY, M_EMAIL, M_PHONE, M_ACTION, M_LOGCHK, M_LOGDATE, M_FAILDATE, M_AUTH
	 	FROM MEMBER 
	 	WHERE M_ID = 'a' AND M_PW = 'a'
	 	
	 	
SELECT M_ID,M_NAME, M_GENDER, M_BIRTHDAY, M_EMAIL, M_PHONE,M_PHOTO, M_ACTION, M_AUTH
	 	FROM MEMBER 
	 	WHERE M_ID = 'b' AND M_PW = 'b' AND M_ACTION != 0	 	
	 	
	 	
--message

DROP TABLE message
CASCADE CONSTRAINT;

create table message(
	message_seq number primary key,
	message_sender varchar2(50) not null,
	message_receiver varchar2(50) not null,
	message_content varchar2(2000) not null,
	message_date date not null,
	message_read number(1),
	message_del number(1),
	m_name varchar2(50),
	m_photo VARCHAR2(1000)
);

DROP SEQUENCE SEQ_MESSAGE;

CREATE SEQUENCE SEQ_MESSAGE
START WITH 1 INCREMENT BY 1;

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요1',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

update message set message_read = 1;


insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요2',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요3',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요4',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요5',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요6',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요7',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));

insert into message 
values
(seq_message.nextval,'lovely4750','aa1212','안녕하세요8',sysdate,0,0,
(select m_name from MEMBER where m_id = 'lovely4750'),
(select m_photo from MEMBER where m_id = 'lovely4750'));


select * from message where message_receiver = 'aa1212' and message_read != 1;
