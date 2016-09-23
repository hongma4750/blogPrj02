package sist.co.Model;


/*
select * from BLOG_BBS;

DROP TABLE blog_bbs
CASCADE CONSTRAINT;

create table blog_bbs(
	bbs_seq number not null, --seq
	m_id varchar2(50) not null,--회원id
	bbs_ca_seq number not null,--카테고리 seq
	bbs_title varchar2(200) not null,--글제목
	bbs_content varchar2(4000) not null,--글내용
	bbs_img varchar2(4000),--이미지 경로
	poll_seq number,--투표 seq
	topic_seq number,--주제분류 seq
	bbs_hid number not null,--공개 여부.전체공개(0),이웃공개(1),서로이웃공개(2),비공개(3)
	bbs_comchk number not null,--댓글 허용 여부(비허용 하면 안보임). 댓글허용(0), 댓글비허용(1)
	bbs_likechk number not null, --공감 허용 여부. 공감허용(0), 공감비허용(1)
	bbs_scrapchk number not null, --스크랩 허용 여부
	bbs_date date not null,
	primary key(bbs_seq)
);

create sequence seq_blogbbs
start with 1 increment by 1;

drop sequence seq_blogbbs;
  

alter table blog_bbs
add constraint fk_blogbbs_id foreign key(m_id)
references member(m_id);

select * from blog_bbs; 
 
 
 
 ----------------------------------
 
<insert id="writeBBS" parameterType="sist.co.Model.SistBlogDTO">
	INSERT INTO BLOG_BBS
			(BBS_SEQ, M_ID,BBS_CA_SEQ,BBS_TITLE,BBS_CONTENT,BBS_IMG,POLL_SEQ,TOPIC_SEQ,
			BBS_HID,BBS_COMCHK,BBS_LIKECHK,BBS_SCRAPCHK)
		VALUES(SEQ_BLOGBBS.NEXTVAL,#{m_id},#{bbs_ca_seq},#{bbs_title},#{bbs_content},#{bbs_img},
		#{poll_seq},#{topic_seq},#{bbs_hid},#{bbs_comchk},#{bbs_likechk},#{bbs_scrapchk})
</insert>
	
 
*/


public class SistBlogDTO {
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
	
	
	public SistBlogDTO(){}
	
	//필수입력부분
	public SistBlogDTO(int bbs_seq, String m_id, int bbs_ca_seq, String bbs_title, String bbs_content,
			int bbs_hid, int bbs_comchk, int bbs_likechk ,int bbs_scrapchk, String bbs_date){
		this.bbs_seq = bbs_seq;
		this.m_id = m_id;
		this.bbs_ca_seq = bbs_ca_seq;
		this.bbs_title = bbs_title;
		this.bbs_content = bbs_content;
		this.bbs_hid = bbs_hid;
		this.bbs_comchk = bbs_comchk;
		this.bbs_likechk = bbs_likechk;
		this.bbs_scrapchk = bbs_scrapchk;	
		this.bbs_date = bbs_date;
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
	
}
