package sist.co.Model;

import java.io.Serializable;
/*
--5. 이웃 그룹 테이블
drop table fgroup
cascade constraint;

drop sequence seq_fgroup;

create table fgroup(
	fg_seq number primary key,		-- seq
	fg_groupname varchar2(50),		-- 그룹명
	fg_myid varchar2(50)		-- 내 아이디
);
create sequence seq_fgroup 
start with 1 increment by 1; 

alter table fgroup
add constraint fk_fg_myid foreign key(fg_myid)
references member(m_id);

 */
public class SistFgroupVO {
	
	private int fg_seq;           //seq
	private String fg_groupname;  //그룹명
	private String fg_myid;       //내 아이디
	
	public SistFgroupVO() {
	}
	
	public int getFg_seq() {
		return fg_seq;
	}
	public void setFg_seq(int fg_seq) {
		this.fg_seq = fg_seq;
	}
	public String getFg_groupname() {
		return fg_groupname;
	}
	public void setFg_groupname(String fg_groupname) {
		this.fg_groupname = fg_groupname;
	}
	public String getFg_myid() {
		return fg_myid;
	}
	public void setFg_myid(String fg_myid) {
		this.fg_myid = fg_myid;
	}

	@Override
	public String toString() {
		return "SistFgroupVO [fg_seq=" + fg_seq + ", fg_groupname=" + fg_groupname + ", fg_myid=" + fg_myid + "]";
	}

}
