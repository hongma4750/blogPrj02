package sist.co.Model;

import java.sql.Timestamp;

public class SistMessage {
	
	private int message_seq;
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private Timestamp message_date;
	private int message_read;
	private int message_del;
	
	private String m_name;
	private String m_photo;
	
	private int page01;
	private int page02;
	
	private int current_page;
	
	public SistMessage() {
		// TODO Auto-generated constructor stub
	}

	public int getMessage_seq() {
		return message_seq;
	}

	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Timestamp getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Timestamp message_date) {
		this.message_date = message_date;
	}

	public int getMessage_read() {
		return message_read;
	}

	public void setMessage_read(int message_read) {
		this.message_read = message_read;
	}

	public int getMessage_del() {
		return message_del;
	}

	public void setMessage_del(int message_del) {
		this.message_del = message_del;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
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
	
	

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}

	@Override
	public String toString() {
		return "SistMessage [message_seq=" + message_seq + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_content=" + message_content + ", message_date=" + message_date
				+ ", message_read=" + message_read + ", message_del=" + message_del + ", m_name=" + m_name
				+ ", m_photo=" + m_photo + ", page01=" + page01 + ", page02=" + page02 + "]";
	}

	
	

	
	

}