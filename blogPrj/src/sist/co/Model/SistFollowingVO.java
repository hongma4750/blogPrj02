package sist.co.Model;

import java.sql.Timestamp;
import java.io.Serializable;

/*

--1. 이웃 맺기 테이블(일방적으로 이루어짐)
drop table following
cascade constraint;

drop sequence seq_following;

create table following(
	fol_seq number primary key, 		-- seq
	fol_send varchar2(50) not null, 	-- 신청한 사람
	fol_receive varchar2(50) not null, 	-- 신청 받은 사람
	fol_date date 			-- 신청일
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

public class SistFollowingVO {
	
	int fol_seq; 		//seq
	String fol_send;    //신청한 사람
	String fol_receive; //신청 받은 사람
	Timestamp fol_date; //신청일
	
	public SistFollowingVO() {
	}
	
	public int getFol_seq() {
		return fol_seq;
	}
	public void setFol_seq(int fol_seq) {
		this.fol_seq = fol_seq;
	}
	public String getFol_send() {
		return fol_send;
	}
	public void setFol_send(String fol_send) {
		this.fol_send = fol_send;
	}
	public String getFol_receive() {
		return fol_receive;
	}
	public void setFol_receive(String fol_receive) {
		this.fol_receive = fol_receive;
	}
	public Timestamp getFol_date() {
		return fol_date;
	}
	public void setFol_date(Timestamp fol_date) {
		this.fol_date = fol_date;
	}
	
	@Override
	public String toString() {
		return "SistFollowingVO [fol_seq=" + fol_seq + ", fol_send=" + fol_send + ", fol_receive=" + fol_receive
				+ ", fol_date=" + fol_date + "]";
	}
	
	

}
