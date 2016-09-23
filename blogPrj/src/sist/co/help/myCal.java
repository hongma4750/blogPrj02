package sist.co.help;

import java.io.Serializable;
import java.util.Calendar;

public class myCal implements Serializable{
	private int year=-100;
	private int month=-100;
	private int day=-100;
	private int lastDay;
	private int dayOfweek;
	
	private int hour=0;
	private int min=0;
	
	Calendar cal = Calendar.getInstance();
	
	public myCal(){}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getLastDay() {
		return lastDay;
	}

	public void setLastDay(int lastDay) {
		this.lastDay = lastDay;
	}

	public int getDayOfweek() {
		return dayOfweek;
	}

	public void setDayOfweek(int dayofweek) {
		this.dayOfweek = dayofweek;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public Calendar getCal() {
		return cal;
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}

	@Override
	public String toString() {
		return "myCal [year=" + year + ", month=" + month + ", day=" + day + ", lastDay=" + lastDay + ", dayOfweek="
				+ dayOfweek + ", hour=" + hour + ", min=" + min + ", cal=" + cal + "]";
	}
	
	public void calculate(){
		if(month == 0){
			this.year--;		// 1년 전
			this.month = 12;	//	12월
		}else if(month == 13){
			this.year++;		// 1년 후
			this.month = 1;		// 1월
		}else if(month < 0){
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
			if(day < 0){
				day = cal.get(Calendar.DATE);
			}
		}
		
		cal.set(this.year, this.month-1, 1);	// year, month, date
		
		dayOfweek = cal.get(Calendar.DAY_OF_WEEK);	// 그 주의 일
		lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			
	}
	
}





/*
Calendar now = Calendar.getInstance();

 int year = now.get(Calendar.YEAR); // 년도를 리턴
 int month = now.get(Calendar.MONTH) + 1; // 월을 리턴
 int day = now.get(Calendar.DAY_OF_MONTH); // 일을 리턴
 int week = now.get(Calendar.DAY_OF_WEEK); // 요일을 리턴
 int amPm = now.get(Calendar.AM_PM); // 오전/오후를 리턴
 int hour = now.get(Calendar.HOUR); // 시를 리턴
 int minute = now.get(Calendar.MINUTE); // 분을 리턴
 int second = now.get(Calendar.SECOND); // 초를 리턴

*/




