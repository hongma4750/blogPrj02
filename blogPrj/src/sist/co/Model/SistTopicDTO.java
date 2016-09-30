package sist.co.Model;

public class SistTopicDTO {
	private int t_seq;
	private int topic_seq;
	private String t_name;
	
	
	private int bbs_seq;
	private String m_id;
	private int bbs_ca_seq;
	private String bbs_title;
	private String bbs_content;
	
	private String bbs_img;
	private int poll_seq;
	private int bbs_hid;
	private int bbs_comchk ;
	private int bbs_likechk;
	private int bbs_scrapchk;
	private String bbs_date;
	
	// 공감 사용
	private int bbs_like_count;
	

	//페이징
	private int page01;
	private int page02; 
	
	//검색
	private String searchval;
	
	public SistTopicDTO(){}
	
	
	public SistTopicDTO(int t_seq, int topic_seq, String t_name, int bbs_seq, String m_id, int bbs_ca_seq,
			String bbs_title, String bbs_content, String bbs_img, int poll_seq, int bbs_hid, int bbs_comchk,
			int bbs_likechk, int bbs_scrapchk, String bbs_date, int bbs_like_count,
			int page01, int page02,
			String searchval) {
		super();
		this.t_seq = t_seq;
		this.topic_seq = topic_seq;
		this.t_name = t_name;
		this.bbs_seq = bbs_seq;
		this.m_id = m_id;
		this.bbs_ca_seq = bbs_ca_seq;
		this.bbs_title = bbs_title;
		this.bbs_content = bbs_content;
		this.bbs_img = bbs_img;
		this.poll_seq = poll_seq;
		this.bbs_hid = bbs_hid;
		this.bbs_comchk = bbs_comchk;
		this.bbs_likechk = bbs_likechk;
		this.bbs_scrapchk = bbs_scrapchk;
		this.bbs_date = bbs_date;
		this.bbs_like_count = bbs_like_count;
		
		this.page01 = page01;
		this.page02 = page02;
		
		this.searchval = searchval;
	}


	public SistTopicDTO(int t_seq, int topic_seq, String t_name) {
		super();
		this.t_seq = t_seq;
		this.topic_seq = topic_seq;
		this.t_name = t_name;
	}


	public int getT_seq() {
		return t_seq;
	}


	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}


	public int getTopic_seq() {
		return topic_seq;
	}


	public void setTopic_seq(int topic_seq) {
		this.topic_seq = topic_seq;
	}


	public String getT_name() {
		return t_name;
	}


	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	

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
	

	public int getBbs_like_count() {
		return bbs_like_count;
	}


	public void setBbs_like_count(int bbs_like_count) {
		this.bbs_like_count = bbs_like_count;
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

	
	

	public String getSearchval() {
		return searchval;
	}


	public void setSearchval(String searchval) {
		this.searchval = searchval;

	}


	@Override
	public String toString() {
		return "SistTopicDTO [t_seq=" + t_seq + ", topic_seq=" + topic_seq + ", t_name=" + t_name + "]";
	}
	
	
}
