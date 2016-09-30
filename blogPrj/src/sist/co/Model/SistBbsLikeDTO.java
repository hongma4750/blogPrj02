package sist.co.Model;

import java.sql.Timestamp;

/*
select * from bbs_like;

DROP TABLE bbs_like
CASCADE CONSTRAINT;

create table bbs_like(
	like_seq number not null,
	m_id varchar2(50) not null,
	bolg_title varchar2(50), --원래 not null인데 지금 블로그정보 안했으니까
	bbs_seq number not null,
	like_date date,
	primary key(like_seq)
);


create sequence seq_bbslike
start with 1 increment by 1;

drop sequence seq_bbslike;
  

alter table bbs_like
add constraint fk_bbslike_id foreign key(m_id)
references member(m_id);


*/

public class SistBbsLikeDTO {
	private int like_seq;
	private String m_id;
	private String blog_title;
	private int bbs_seq;
	private Timestamp like_date;
	
	public SistBbsLikeDTO(){}

	public SistBbsLikeDTO(int like_seq, String m_id,int bbs_seq,Timestamp like_date){
		this.like_seq = like_seq;
		this.m_id = m_id;
		this.bbs_seq = bbs_seq;
		this.like_date = like_date;
	}

	public int getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public Timestamp getLike_date() {
		return like_date;
	}

	public void setLike_date(Timestamp like_date) {
		this.like_date = like_date;
	}
	
	

}
