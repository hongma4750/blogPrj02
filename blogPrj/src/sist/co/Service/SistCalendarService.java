package sist.co.Service;

import java.util.List;

import sist.co.Model.SistCalendarDTO;

public interface SistCalendarService {
   /* 캘린더 리스트 */
   public List<SistCalendarDTO> getCalendarList(SistCalendarDTO fcal)throws Exception;
   
   /* 퀵 뷰 상세보기 */
   public SistCalendarDTO getSchQuickView(SistCalendarDTO scal)throws Exception;
   
   /* 일정 상세보기 */
   public SistCalendarDTO getSch(SistCalendarDTO scal)throws Exception;
   
   /* 일정 쓰기 */
   public boolean writeSchedule(SistCalendarDTO sdto) throws Exception;
   
   /* 일정 수정 */
   public void updateSchedule(SistCalendarDTO sdto) throws Exception;
   
   /* 일정 삭제 */
   public void deleteSchedule(int sch_writenum) throws Exception;
}