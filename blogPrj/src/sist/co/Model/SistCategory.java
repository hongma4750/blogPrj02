package sist.co.Model;

public class SistCategory {

	
	private int ca_seq;
	private String m_id;
	private int ca_ref;
	private int ca_step;
	private int ca_depth;
	private String ca_name;
	private int ca_hidden;
	private int ca_parent;
	private int ca_view_type;
	
	
	public SistCategory() {
		// TODO Auto-generated constructor stub
	}


	public int getCa_seq() {
		return ca_seq;
	}


	public void setCa_seq(int ca_seq) {
		this.ca_seq = ca_seq;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getCa_ref() {
		return ca_ref;
	}


	public void setCa_ref(int ca_ref) {
		this.ca_ref = ca_ref;
	}


	public int getCa_step() {
		return ca_step;
	}


	public void setCa_step(int ca_step) {
		this.ca_step = ca_step;
	}


	public int getCa_depth() {
		return ca_depth;
	}


	public void setCa_depth(int ca_depth) {
		this.ca_depth = ca_depth;
	}


	public String getCa_name() {
		return ca_name;
	}


	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}


	public int getCa_hidden() {
		return ca_hidden;
	}


	public void setCa_hidden(int ca_hidden) {
		this.ca_hidden = ca_hidden;
	}


	public int getCa_parent() {
		return ca_parent;
	}


	public void setCa_parent(int ca_parent) {
		this.ca_parent = ca_parent;
	}


	public int getCa_view_type() {
		return ca_view_type;
	}


	public void setCa_view_type(int ca_view_type) {
		this.ca_view_type = ca_view_type;
	}


	@Override
	public String toString() {
		return "SistCategory [ca_seq=" + ca_seq + ", m_id=" + m_id + ", ca_ref=" + ca_ref + ", ca_step=" + ca_step
				+ ", ca_depth=" + ca_depth + ", ca_name=" + ca_name + ", ca_hidden=" + ca_hidden + ", ca_parent="
				+ ca_parent + ", ca_view_type=" + ca_view_type + "]";
	}
	
	
}
