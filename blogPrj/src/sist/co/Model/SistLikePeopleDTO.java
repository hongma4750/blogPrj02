package sist.co.Model;

import java.sql.Timestamp;

/*
조인문. 현재는 member, bbs_like 두개 조인 상태
		SELECT BLIKE.LIKE_DATE,MEM.M_ID,MEM.M_NAME FROM BBS_LIKE BLIKE, MEMBER MEM
		WHERE BBS_SEQ=#{bbs_seq} AND BLIKE.M_ID=MEM.M_ID
		
		
추후에 blog 테이블까지 조인 할 계획
*/


public class SistLikePeopleDTO {
	private String m_id;
	private String m_name;
	private String blog_title;
	private Timestamp like_date;
	
	public SistLikePeopleDTO(){}

	public SistLikePeopleDTO(String m_id,String m_name,Timestamp like_date){
		this.m_id = m_id;
		this.m_name = m_name;
		this.like_date = like_date;
	}
	
	public SistLikePeopleDTO(String m_id,String m_name,String blog_title,Timestamp like_date){
		this.m_id = m_id;
		this.m_name = m_name;
		this.blog_title = blog_title;
		this.like_date = like_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public Timestamp getLike_date() {
		return like_date;
	}

	public void setLike_date(Timestamp like_date) {
		this.like_date = like_date;
	}

}