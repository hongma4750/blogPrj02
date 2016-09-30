package sist.co.Model;

public class SistBlog {
	
	private int blog_seq;
	private String m_id;
	private String blog_title;
	private String blog_nickname;
	private String blog_introduce;
	
	
	public SistBlog() {
		// TODO Auto-generated constructor stub
	}


	public int getBlog_seq() {
		return blog_seq;
	}


	public void setBlog_seq(int blog_seq) {
		this.blog_seq = blog_seq;
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


	public String getBlog_nickname() {
		return blog_nickname;
	}


	public void setBlog_nickname(String blog_nickname) {
		this.blog_nickname = blog_nickname;
	}


	public String getBlog_introduce() {
		return blog_introduce;
	}


	public void setBlog_introduce(String blog_introduce) {
		this.blog_introduce = blog_introduce;
	}


	@Override
	public String toString() {
		return "SistBlog [blog_seq=" + blog_seq + ", m_id=" + m_id + ", blog_title=" + blog_title + ", blog_nickname="
				+ blog_nickname + ", blog_introduce=" + blog_introduce + "]";
	}
	
	
	

}
