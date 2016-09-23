package sist.co.Model;

import java.io.Serializable;

/*
DROP TABLE CALWRITE
CASCADE CONSTRAINT;

DROP SEQUENCE SEQ_SIST_CALWRITE;

CREATE TABLE CALWRITE(
	sch_writenum number primary key,		-- seq
	sch_id varchar2(50) not null,			-- 작성자 이름
	sch_title varchar2(50) not null,		-- 캘린더 제목,
	sch_star number,						-- 매우중요:2, 보통중요:1, 안중요:1
	sch_location varchar2(50),				-- 장소
	sch_wdate varchar2(50) not null,		-- 날짜 입력
	sch_wtime varchar2(50),					-- 시간 입력 
	sch_rdate varchar2(50) not null,		-- 등록하는 날짜 입력
	sch_allday number,						-- 종일이면 1, 안 종일:0
	--sch_member varchar2(50),				-- 초대하는 친구
	sch_public number,						-- 공개:0, 비공개:1
	sch_sticker varchar2(150),				-- 스티커 이름
	sch_content varchar2(150),				-- 내용
	sch_docname varchar2(150),				-- 문서 이름
	sch_alarm varchar2(50) not null,		-- 스케쥴 알람 시간 
	sch_finish number						-- 스케쥴 완료:1, 비완료:0
);

CREATE SEQUENCE SEQ_SIST_CALWRITE
START WITH 1 INCREMENT BY 1;

ALTER TABLE CALWRITE
ADD CONSTRAINT FK_SIST_CALWRITE FOREIGN KEY(sch_id)
REFERENCES MEMBER(m_id);  
 */

public class SistCalendarDTO implements Serializable  {
	private int sch_writenum;			// seq
	private String sch_id;				// 작성자 이름
	private String sch_title;			// 캘린더 제목
	private int sch_star;				// 매우중요:2, 보통 중요:1, 안 중요: 0
	private String sch_location;		// 장소
	private String sch_startdate;		// 날짜 입력
	private String sch_starttime;		// 시간 입력
	private String sch_enddate;		// 날짜 입력
	private String sch_endtime;		// 시간 입력
	private String sch_rdate;			// 등록하는 날짜 입력
	private int sch_allday;				// 종일: 1, 기본:0	
	private int sch_public;				// 공개 여부, 공개:0, 비공개:1
	private String sch_sticker;			// 스티커 이름
	private String sch_content;			// 일정 내용
	private String sch_docname;			// 문서 이름
	private String sch_alarm;			// 스케쥴 알람 시간
	private int sch_finish;				// 스케쥴 완료:1, 비완료:2
	
	
	public SistCalendarDTO(){}

	
	public SistCalendarDTO(int sch_writenum, String sch_id, String sch_title, int sch_star, String sch_location,
			String sch_startdate, String sch_starttime, String sch_enddate, String sch_endtime, String sch_rdate,
			int sch_allday, int sch_public, String sch_sticker, String sch_content, String sch_docname,
			String sch_alarm, int sch_finish) {
		super();
		this.sch_writenum = sch_writenum;
		this.sch_id = sch_id;
		this.sch_title = sch_title;
		this.sch_star = sch_star;
		this.sch_location = sch_location;
		this.sch_startdate = sch_startdate;
		this.sch_starttime = sch_starttime;
		this.sch_enddate = sch_enddate;
		this.sch_endtime = sch_endtime;
		this.sch_rdate = sch_rdate;
		this.sch_allday = sch_allday;
		this.sch_public = sch_public;
		this.sch_sticker = sch_sticker;
		this.sch_content = sch_content;
		this.sch_docname = sch_docname;
		this.sch_alarm = sch_alarm;
		this.sch_finish = sch_finish;
	}


	/* 스케쥴 넣을 때 */
	public SistCalendarDTO(String sch_id, String sch_title, int sch_star, String sch_location,
			String sch_startdate, String sch_starttime, String sch_enddate, String sch_endtime,
			int sch_allday, int sch_public, String sch_sticker, String sch_content, String sch_docname,
			String sch_alarm) {
		super();
		this.sch_id = sch_id;
		this.sch_title = sch_title;
		this.sch_star = sch_star;
		this.sch_location = sch_location;
		this.sch_startdate = sch_startdate;
		this.sch_starttime = sch_starttime;
		this.sch_enddate = sch_enddate;
		this.sch_endtime = sch_endtime;
		this.sch_allday = sch_allday;
		this.sch_public = sch_public;
		this.sch_sticker = sch_sticker;
		this.sch_content = sch_content;
		this.sch_docname = sch_docname;
		this.sch_alarm = sch_alarm;
	}
		


	/* 달력 모양에서 칸안에 보여주는 것 */
	public SistCalendarDTO(String sch_id, String sch_title, int sch_star, String sch_startdate, String sch_starttime,
			String sch_enddate, String sch_endtime, String sch_sticker) {
		super();
		this.sch_id = sch_id;
		this.sch_title = sch_title;
		this.sch_star = sch_star;
		this.sch_startdate = sch_startdate;
		this.sch_starttime = sch_starttime;
		this.sch_enddate = sch_enddate;
		this.sch_endtime = sch_endtime;
		this.sch_sticker = sch_sticker;
	}

	
	/* 달력 칸 클릭했을 때 상세 팝업 */
	public SistCalendarDTO(String sch_id, String sch_title, String sch_location, String sch_startdate,
			String sch_starttime, String sch_enddate, String sch_endtime, String sch_alarm, int sch_finish) {
		super();
		this.sch_id = sch_id;
		this.sch_title = sch_title;
		this.sch_location = sch_location;
		this.sch_startdate = sch_startdate;
		this.sch_starttime = sch_starttime;
		this.sch_enddate = sch_enddate;
		this.sch_endtime = sch_endtime;
		this.sch_alarm = sch_alarm;
		this.sch_finish = sch_finish;
	}


	public int getSch_writenum() {
		return sch_writenum;
	}


	public void setSch_writenum(int sch_writenum) {
		this.sch_writenum = sch_writenum;
	}


	public String getSch_id() {
		return sch_id;
	}


	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}


	public String getSch_title() {
		return sch_title;
	}


	public void setSch_title(String sch_title) {
		this.sch_title = sch_title;
	}


	public int getSch_star() {
		return sch_star;
	}


	public void setSch_star(int sch_star) {
		this.sch_star = sch_star;
	}


	public String getSch_location() {
		return sch_location;
	}


	public void setSch_location(String sch_location) {
		this.sch_location = sch_location;
	}


	public String getSch_startdate() {
		return sch_startdate;
	}


	public void setSch_startdate(String sch_startdate) {
		this.sch_startdate = sch_startdate;
	}


	public String getSch_starttime() {
		return sch_starttime;
	}


	public void setSch_starttime(String sch_starttime) {
		this.sch_starttime = sch_starttime;
	}


	public String getSch_enddate() {
		return sch_enddate;
	}


	public void setSch_enddate(String sch_enddate) {
		this.sch_enddate = sch_enddate;
	}


	public String getSch_endtime() {
		return sch_endtime;
	}


	public void setSch_endtime(String sch_endtime) {
		this.sch_endtime = sch_endtime;
	}


	public String getSch_rdate() {
		return sch_rdate;
	}


	public void setSch_rdate(String sch_rdate) {
		this.sch_rdate = sch_rdate;
	}


	public int getSch_allday() {
		return sch_allday;
	}


	public void setSch_allday(int sch_allday) {
		this.sch_allday = sch_allday;
	}


	public int getSch_public() {
		return sch_public;
	}


	public void setSch_public(int sch_public) {
		this.sch_public = sch_public;
	}


	public String getSch_sticker() {
		return sch_sticker;
	}


	public void setSch_sticker(String sch_sticker) {
		this.sch_sticker = sch_sticker;
	}


	public String getSch_content() {
		return sch_content;
	}


	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}


	public String getSch_docname() {
		return sch_docname;
	}


	public void setSch_docname(String sch_docname) {
		this.sch_docname = sch_docname;
	}


	public String getSch_alarm() {
		return sch_alarm;
	}


	public void setSch_alarm(String sch_alarm) {
		this.sch_alarm = sch_alarm;
	}


	public int getSch_finish() {
		return sch_finish;
	}


	public void setSch_finish(int sch_finish) {
		this.sch_finish = sch_finish;
	}


	@Override
	public String toString() {
		return "SistCalendarDTO [sch_writenum=" + sch_writenum + ", sch_id=" + sch_id + ", sch_title=" + sch_title
				+ ", sch_star=" + sch_star + ", sch_location=" + sch_location + ", sch_startdate=" + sch_startdate
				+ ", sch_starttime=" + sch_starttime + ", sch_enddate=" + sch_enddate + ", sch_endtime=" + sch_endtime
				+ ", sch_rdate=" + sch_rdate + ", sch_allday=" + sch_allday + ", sch_public=" + sch_public
				+ ", sch_sticker=" + sch_sticker + ", sch_content=" + sch_content + ", sch_docname=" + sch_docname
				+ ", sch_alarm=" + sch_alarm + ", sch_finish=" + sch_finish + "]";
	}
	

}