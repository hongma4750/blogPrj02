package sist.co.Model;

/*
 select * from bbs_comment;

DROP TABLE bbs_comment
CASCADE CONSTRAINT;

drop sequence seq_bbscomment;

create table bbs_comment(
	com_seq number not null,
	bbs_seq number not null,
	com_content varchar2(200) not null,
	m_id varchar2(50) not null,
	blog_nickname varchar2(50) not null,
	com_ref number not null,
	com_step number not null,
	com_depth number not null,
	com_del number not null,
	com_parent number not null,
	com_date date not null,
	primary key(com_seq)
);


create sequence seq_bbscomment
start with 1 increment by 1;

alter table bbs_comment
add constraint fk_bbscomment_id foreign key(m_id)
references member(m_id);
*/

public class SistBlogComDTO {
	private int com_seq;
	private int bbs_seq;
	
	private String com_content;
	private String m_id;
	private String blog_nickname;
	
	private int com_ref;	// 부모글
	private int com_step;	// 답글의 순서
	private int com_depth; 	// 답글의 깊이

	private int com_del;
	private int com_parent;
	private String com_date;
	
	
	public SistBlogComDTO(){}
	
	public SistBlogComDTO(int com_seq,int bbs_seq,String com_content,String m_id,String blog_nickname,
			int com_ref,int com_step,int com_depth,int com_del,int com_parent,String com_date){
		this.com_seq = com_seq;
		this.bbs_seq = bbs_seq;
		this.com_content = com_content;
		this.m_id = m_id;
		this.blog_nickname = blog_nickname;
		this.com_ref = com_ref;
		this.com_step = com_step;
		this.com_depth = com_depth;
		this.com_del = com_del;
		this.com_parent = com_parent;
		this.com_date = com_date;
	}
	
	public SistBlogComDTO(int bbs_seq,String com_content,String m_id,String blog_nickname){
		this.bbs_seq = bbs_seq;
		this.com_content = com_content;
		this.m_id = m_id;
		this.blog_nickname = blog_nickname;
	}


	public int getCom_seq() {
		return com_seq;
	}


	public void setCom_seq(int com_seq) {
		this.com_seq = com_seq;
	}


	public int getBbs_seq() {
		return bbs_seq;
	}


	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}


	public String getCom_content() {
		return com_content;
	}


	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getBlog_nickname() {
		return blog_nickname;
	}


	public void setBlog_nickname(String blog_nickname) {
		this.blog_nickname = blog_nickname;
	}


	public int getCom_ref() {
		return com_ref;
	}


	public void setCom_ref(int com_ref) {
		this.com_ref = com_ref;
	}


	public int getCom_step() {
		return com_step;
	}


	public void setCom_step(int com_step) {
		this.com_step = com_step;
	}


	public int getCom_depth() {
		return com_depth;
	}


	public void setCom_depth(int com_depth) {
		this.com_depth = com_depth;
	}


	public int getCom_del() {
		return com_del;
	}


	public void setCom_del(int com_del) {
		this.com_del = com_del;
	}


	public int getCom_parent() {
		return com_parent;
	}


	public void setCom_parent(int com_parent) {
		this.com_parent = com_parent;
	}

	public String getCom_date() {
		return com_date;
	}

	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}



	
	
	
	


}
