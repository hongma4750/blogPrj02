package sist.co.Model;

public class SistBlogComListDTO {
	private int com_seq;
	private int bbs_seq;
	
	private String com_content;
	private String m_id;
	private String m_photo;
	
	private int com_ref;	// 부모글
	private int com_step;	// 답글의 순서
	private int com_depth; 	// 답글의 깊이

	private int com_del;
	private int com_parent;
	private String com_date;
	
	
	
	
	public SistBlogComListDTO(){}
	
	public SistBlogComListDTO(int com_seq,int bbs_seq,String com_content,String m_id,String m_photo,
			int com_ref,int com_step,int com_depth,int com_del,int com_parent,String com_date){
		this.com_seq = com_seq;
		this.bbs_seq = bbs_seq;
		this.com_content = com_content;
		this.m_id = m_id;
		this.m_photo = m_photo;
		this.com_ref = com_ref;
		this.com_step = com_step;
		this.com_depth = com_depth;
		this.com_del = com_del;
		this.com_parent = com_parent;
		this.com_date = com_date;
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

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
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

	@Override
	public String toString() {
		return "SistBlogComListDTO [com_seq=" + com_seq + ", bbs_seq=" + bbs_seq + ", com_content=" + com_content
				+ ", m_id=" + m_id + ", m_photo=" + m_photo + ", com_ref=" + com_ref + ", com_step=" + com_step
				+ ", com_depth=" + com_depth + ", com_del=" + com_del + ", com_parent=" + com_parent + ", com_date="
				+ com_date + "]";
	}


	
	
	


}
