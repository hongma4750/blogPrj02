package sist.co.Model;

import java.io.Serializable;
import java.sql.Timestamp;

/*

--3. 이웃 테이블

select * from friend

drop table friend
cascade constraint;

drop sequence seq_friend;

create table friend(
	fnd_seq number primary key, 		-- seq
	fnd_myid varchar2(50), 		-- 내 아이디
	fnd_fndid varchar2(50),		-- 이웃 아이디
	fnd_groupname varchar2(50), 	-- 그룹명
	fnd_chk number not null, 		-- 이웃1 / 서로 이웃2 여부
	fnd_foldate date not null, --이웃,서로이웃 추가일
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

 */

public class SistFriendVO {
	
	private int fnd_seq; 		 //seq
	private String fnd_myid;     //내 아이디
	private String fnd_fndid;    //이웃 아이디
	private String fnd_groupname;//그룹명
	private int fnd_chk;	     //이웃 / 서로 이웃 여부
	private Timestamp fnd_foldate;//이웃,서로이웃 추가일
	private int fnd_newAlert;    //새글알림
	
	public SistFriendVO() {
	}

	public int getFnd_seq() {
		return fnd_seq;
	}

	public void setFnd_seq(int fnd_seq) {
		this.fnd_seq = fnd_seq;
	}

	public String getFnd_myid() {
		return fnd_myid;
	}

	public void setFnd_myid(String fnd_myid) {
		this.fnd_myid = fnd_myid;
	}

	public String getFnd_fndid() {
		return fnd_fndid;
	}

	public void setFnd_fndid(String fnd_fndid) {
		this.fnd_fndid = fnd_fndid;
	}

	public String getFnd_groupname() {
		return fnd_groupname;
	}

	public void setFnd_groupname(String fnd_groupname) {
		this.fnd_groupname = fnd_groupname;
	}

	public int getFnd_chk() {
		return fnd_chk;
	}

	public void setFnd_chk(int fnd_chk) {
		this.fnd_chk = fnd_chk;
	}

	public Timestamp getFnd_foldate() {
		return fnd_foldate;
	}

	public void setFnd_foldate(Timestamp fnd_foldate) {
		this.fnd_foldate = fnd_foldate;
	}

	public int getFnd_newAlert() {
		return fnd_newAlert;
	}

	public void setFnd_newAlert(int fnd_newAlert) {
		this.fnd_newAlert = fnd_newAlert;
	}

	@Override
	public String toString() {
		return "SistFriendVO [fnd_seq=" + fnd_seq + ", fnd_myid=" + fnd_myid + ", fnd_fndid=" + fnd_fndid
				+ ", fnd_groupname=" + fnd_groupname + ", fnd_chk=" + fnd_chk + ", fnd_foldate=" + fnd_foldate
				+ ", fnd_newAlert=" + fnd_newAlert + "]";
	}

}
