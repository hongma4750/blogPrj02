--<이웃 관리 table>
--2016.09.18 컬럼명 ***_뺄까?

--1. 이웃 맺기 테이블(일방적으로 이루어짐)
--2016.09.18 following table삭제


--2. 서로 이웃 맺기 테이블(수락 여부에 따라 맺어짐)
--2016.9.18 추가 컬럼 df_groupname varchar2(50),-- 그룹명
--2016.9.18 수정 컬럼 df_groupname->fnd_groupname


select * from dblfollowing

drop sequence seq_dblfollowing;

drop table dblfollowing
cascade constraint;

create table dblfollowing(
	df_seq number primary key,		-- seq
	df_send varchar2(50) not null, 	-- 신청한 사람
	df_receive varchar2(50) not null, 	-- 신청 받은 사람
	fnd_groupname varchar2(50),      -- 그룹명
	df_msg varchar2(500), --서로이웃신청메시지
	df_date date not null, 		-- 신청일
	df_accept number default 0, 		-- 수락1 / 거절2 / 미확인0 여부
	df_acceptdate date 		-- 수락일 (수락전빈문자열)
);
create sequence seq_dblfollowing 
start with 1 increment by 1; 

alter table dblfollowing
add constraint fk_df_send foreign key(df_send)
references member(m_id);

alter table dblfollowing
add constraint fk_df_receive foreign key(df_receive)
references member(m_id);

--3. 이웃 테이블
--2016.09.18 fnd_foldate date not null --이웃,서로이웃 추가일  추가?

select * from friend
delete friend where fnd_seq=16

drop sequence seq_friend;

drop table friend
cascade constraint;

create table friend(
	fnd_seq number primary key, 		-- seq
	fnd_myid varchar2(50), 		-- 내 아이디
	fnd_fndid varchar2(50),		-- 이웃 아이디
	fnd_groupname varchar2(50), 	-- 그룹명
	fnd_chk number not null, 		-- 이웃1 / 서로 이웃2 여부
	fnd_foldate date not null,  --이웃,서로이웃 추가일
	fnd_newAlert number default 0 not null --새글알림 on0 / off1
);
create sequence seq_friend 
start with 1 increment by 1; 

alter table friend
add constraint fk_fnd_myid foreign key(fnd_myid)
references member(m_id);

alter table friend
add constraint fk_fnd_fndid foreign key(fnd_fndid)
references member(m_id);

--alter table friend
--add constraint fk_fnd_groupname foreign key(fnd_groupname)
--references fgroup(fg_seq);
--4. 이웃 기본 설정 테이블
--2016.09.18 fset_dblfolmsg varchar2(200) --서로이웃 안내메시지 추가?
select * from fsetting

drop sequence seq_fsetting;

drop table fsetting
cascade constraint;

create table fsetting(
	fset_seq number primary key,		-- seq 
	fset_myid varchar2(50),		-- 내 아이디
	fset_sendchk number default 0	-- 서로 이웃 받기0 / 안받기1 여부
	--,fset_dblfolmsg varchar2(200) --서로이웃 안내메시지 추가?
);
create sequence seq_fsetting 
start with 1 increment by 1; 

alter table fsetting
add constraint fk_fset_myid foreign key(fset_myid)
references member(m_id);

--5. 이웃 그룹 테이블
--컬럼명수정 fg_groupname -> fnd_groupname
--fg_myid -> fnd_myid
select * from fgroup

drop sequence seq_fgroup;

drop table fgroup
cascade constraint;

create table fgroup(
	fg_seq number primary key,		-- seq
	fnd_groupname varchar2(50),		-- 그룹명
	fnd_myid varchar2(50),		-- 내 아이디
	fg_openchk number default 0 -- 공개0 / 비공개1
);
create sequence seq_fgroup 
start with 1 increment by 1; 

alter table fgroup
add constraint fk_fg_fnd_myid foreign key(fnd_myid)
references member(m_id);


--6.주제별글
drop table topic
cascade constraint;

drop sequence seq_topic;

create table topic(
	t_seq number primary key,		-- seq
	t_name varchar2(50)		    -- 주제명
);
create sequence seq_topic 
start with 1 increment by 1; 

insert into topic values(seq_topic.NEXTVAL,'전체');
insert into topic values(seq_topic.NEXTVAL,'음악');
insert into topic values(seq_topic.NEXTVAL,'영화');
insert into topic values(seq_topic.NEXTVAL,'스포츠');
insert into topic values(seq_topic.NEXTVAL,'세계여행');


------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
--chloevergreen
--aa1212

delete from member where m_id='lovley4750'
update member set m_action=1 where m_id='ccdd55'
select*from friend
--회원가입 아이디 ★시연아이디★

--그룹명
insert into fgroup values(seq_fgroup.NEXTVAL, '내친구들', 'chloevergreen',0);
insert into fgroup values(seq_fgroup.NEXTVAL, 'friends', 'lovely4750',0);

insert into fgroup values(seq_fgroup.NEXTVAL, '친구들', 'summer123',0);
insert into fgroup values(seq_fgroup.NEXTVAL, 'friends', 'ccdd55',0);

--★시연아이디★ 기존 이웃 spring123
insert into friend
values(seq_friend.NEXTVAL, 'chloevergreen', 'summer123', '내친구들', 1, sysdate,0); 


insert into friend
values(seq_friend.NEXTVAL, 'aa1212', 'summer123', '친구들', 1,sysdate,0); 

insert into friend
values(seq_friend.NEXTVAL, 'ccdd55', 'spring123', '친구들', 1,sysdate,0); 

--spring123의 친구 lovely4750
insert into friend
values(seq_friend.NEXTVAL, 'spring123', 'aa1212', '친구들', 1,sysdate,0); 
------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
select* from friend

--bom->summer 이웃
--insert into FOLLOWING values (seq_following.NEXTVAL, 'bom', 'summer', '20160912' );

insert into friend
values(seq_friend.NEXTVAL, 'aa1212', 'summer123', '친구들', 1,sysdate,0); 

insert into fsetting values(seq_fsetting.NEXTVAL, 'bom', 0);

insert into fgroup values(seq_fgroup.NEXTVAL, '친구들', 'bbb123',0);

--summer<->aaa 서로이웃
update member set m_action =1 where m_id='bbb123'
insert into friend
values(seq_friend.NEXTVAL, 'summer', 'bbb123', 'sgroup', 2,sysdate,0); 
insert into friend
values(seq_friend.NEXTVAL, 'aaa', 'summer', 'agroup', 2,sysdate,0);

insert into fsetting values(seq_fsetting.NEXTVAL, 'aaa', 0);
insert into fsetting values(seq_fsetting.NEXTVAL, 'summer', 0);

insert into fgroup values(seq_fgroup.NEXTVAL, 'sgroup', 'summer',0);
insert into fgroup values(seq_fgroup.NEXTVAL, 'agroup', 'aaa',0);
insert into fgroup values(seq_fgroup.NEXTVAL, 'adorable', 'bom',0);
--summer->c 이웃
--insert into FOLLOWING values (seq_following.NEXTVAL, 'summer', 'c', '20160914' );

insert into friend
values(seq_friend.NEXTVAL, 'summer', 'c', 'myg', 1,sysdate,0); 

insert into fsetting values(seq_fsetting.NEXTVAL, 'c', 0);

insert into fgroup values(seq_fgroup.NEXTVAL, 'myg', 'c',0);



--1. 이웃 맺기 테이블(일방적으로 이루어짐)
--2016.09.18 following table삭제
/*
select * from dblfollowing
delete FRIEND where fnd_seq=7

drop table following
cascade constraint;

drop sequence seq_following;

create table following(
	fol_seq number(8) primary key, 		
	fol_send varchar2(50) not null, 	
	fol_receive varchar2(50) not null, 	
	fol_date date not null			
);
create sequence seq_following 
start with 1 increment by 1; 

alter table following
add constraint fk_fol_send foreign key(fol_send)
references member(m_id);

alter table following
add constraint fk_fol_receive foreign key(fol_receive)
references member(m_id);
*/

