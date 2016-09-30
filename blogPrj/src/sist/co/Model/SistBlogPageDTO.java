package sist.co.Model;

public class SistBlogPageDTO {

	private int bbs_seq;
	private String m_id;
	private int bbs_ca_seq;
	private String bbs_title;
	private String bbs_content;
	
	private String bbs_img;
	private int poll_seq;
	private int topic_seq;
	private int bbs_hid;
	private int bbs_comchk ;
	private int bbs_likechk;
	private int bbs_scrapchk;
	private String bbs_date;
	
	private int page01;
	private int page02;
	
	public SistBlogPageDTO(){}
	

	
	public int getBbs_seq() {
		return bbs_seq;
	}
	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getBbs_ca_seq() {
		return bbs_ca_seq;
	}
	public void setBbs_ca_seq(int bbs_ca_seq) {
		this.bbs_ca_seq = bbs_ca_seq;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_img() {
		return bbs_img;
	}
	public void setBbs_img(String bbs_img) {
		this.bbs_img = bbs_img;
	}
	public int getPoll_seq() {
		return poll_seq;
	}
	public void setPoll_seq(int poll_seq) {
		this.poll_seq = poll_seq;
	}
	public int getTopic_seq() {
		return topic_seq;
	}
	public void setTopic_seq(int topic_seq) {
		this.topic_seq = topic_seq;
	}
	public int getBbs_hid() {
		return bbs_hid;
	}
	public void setBbs_hid(int bbs_hid) {
		this.bbs_hid = bbs_hid;
	}
	public int getBbs_comchk() {
		return bbs_comchk;
	}
	public void setBbs_comchk(int bbs_comchk) {
		this.bbs_comchk = bbs_comchk;
	}
	public int getBbs_likechk() {
		return bbs_likechk;
	}
	public void setBbs_likechk(int bbs_likechk) {
		this.bbs_likechk = bbs_likechk;
	}
	public int getBbs_scrapchk() {
		return bbs_scrapchk;
	}
	public void setBbs_scrapchk(int bbs_scrapchk) {
		this.bbs_scrapchk = bbs_scrapchk;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
		this.bbs_date = bbs_date;
	}



	public int getPage01() {
		return page01;
	}



	public void setPage01(int page01) {
		this.page01 = page01;
	}



	public int getPage02() {
		return page02;
	}



	public void setPage02(int page02) {
		this.page02 = page02;
	}



	@Override
	public String toString() {
		return "SistBlogPageDTO [bbs_seq=" + bbs_seq + ", m_id=" + m_id + ", bbs_ca_seq=" + bbs_ca_seq + ", bbs_title="
				+ bbs_title + ", bbs_content=" + bbs_content + ", bbs_img=" + bbs_img + ", poll_seq=" + poll_seq
				+ ", topic_seq=" + topic_seq + ", bbs_hid=" + bbs_hid + ", bbs_comchk=" + bbs_comchk + ", bbs_likechk="
				+ bbs_likechk + ", bbs_scrapchk=" + bbs_scrapchk + ", bbs_date=" + bbs_date + ", page01=" + page01
				+ ", page02=" + page02 + "]";
	}
	
	
}
