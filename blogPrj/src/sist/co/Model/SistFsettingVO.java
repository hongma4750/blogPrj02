package sist.co.Model;

import java.io.Serializable;
/*

--4. 이웃 기본 설정 테이블
drop table fsetting
cascade constraint;

drop sequence seq_fsetting;

create table fsetting(
	fset_seq number primary key,		-- seq 
	fset_myid varchar2(50),		-- 내 아이디
	fset_sendchk number default 0	-- 서로 이웃 받기0 / 안받기1 여부
);
create sequence seq_fsetting 
start with 1 increment by 1; 

alter table fsetting
add constraint fk_fset_myid foreign key(fset_myid)
references member(m_id);

 */

public class SistFsettingVO {
	
	private int fset_seq;     //seq 
	private String fset_myid; //내 아이디
	private int fset_sendchk; //서로 이웃 받기 / 안받기 여부
	
	public SistFsettingVO() {
	}
	
	public int getFset_seq() {
		return fset_seq;
	}
	public void setFset_seq(int fset_seq) {
		this.fset_seq = fset_seq;
	}
	public String getFset_myid() {
		return fset_myid;
	}
	public void setFset_myid(String fset_myid) {
		this.fset_myid = fset_myid;
	}
	public int getFset_sendchk() {
		return fset_sendchk;
	}
	public void setFset_sendchk(int fset_sendchk) {
		this.fset_sendchk = fset_sendchk;
	}
	@Override
	public String toString() {
		return "SistFsettingVO [fset_seq=" + fset_seq + ", fset_myid=" + fset_myid + ", fset_sendchk=" + fset_sendchk
				+ "]";
	}
	
	

}
