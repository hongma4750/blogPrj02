package sist.co.Model;

import java.io.Serializable;
/*
--5. 이웃 그룹 테이블
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

 */
public class SistFgroupVO {
	
	private int fg_seq;           //seq
	private String fnd_groupname;  //그룹명
	private String fnd_myid;       //내 아이디
	private int fg_openchk;         //공개0 / 비공개1
	
	public SistFgroupVO() {
	}
	
	public int getFg_seq() {
		return fg_seq;
	}
	public void setFg_seq(int fg_seq) {
		this.fg_seq = fg_seq;
	}

	public String getFnd_groupname() {
		return fnd_groupname;
	}

	public void setFnd_groupname(String fnd_groupname) {
		this.fnd_groupname = fnd_groupname;
	}

	public String getFnd_myid() {
		return fnd_myid;
	}

	public void setFnd_myid(String fnd_myid) {
		this.fnd_myid = fnd_myid;
	}

	public int getFg_openchk() {
		return fg_openchk;
	}

	public void setFg_openchk(int fg_openchk) {
		this.fg_openchk = fg_openchk;
	}

	@Override
	public String toString() {
		return "SistFgroupVO [fg_seq=" + fg_seq + ", fnd_groupname=" + fnd_groupname + ", fnd_myid=" + fnd_myid
				+ ", fg_openchk=" + fg_openchk + "]";
	}
	
}
