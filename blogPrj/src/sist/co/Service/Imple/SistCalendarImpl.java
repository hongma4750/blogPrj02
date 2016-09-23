package sist.co.Service.Imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.Model.SistCalendarDTO;
import sist.co.Service.SistCalendarDAO;
import sist.co.Service.SistCalendarService;

@Service
public class SistCalendarImpl implements SistCalendarService{

   @Autowired
   private SistCalendarDAO sistCalendarDAO;
   
   /* 캘린더 리스트 */
   @Override
   public List<SistCalendarDTO> getCalendarList(SistCalendarDTO fcal) throws Exception {
      return sistCalendarDAO.getCalendarList(fcal);
   }
   
   /* 퀵 뷰 상세보기 */
   @Override
   public SistCalendarDTO getSchQuickView(SistCalendarDTO scal) throws Exception {      
      return sistCalendarDAO.getSchQuickView(scal);
   }
   
   /* 일정 상세보기 */
   @Override
   public SistCalendarDTO getSch(SistCalendarDTO scal) throws Exception {
      return sistCalendarDAO.getSch(scal);
   }

   /* 일정 쓰기 */
   @Override
   public boolean writeSchedule(SistCalendarDTO sdto) throws Exception {
      return sistCalendarDAO.writeSchedule(sdto);
   }

   /* 일정 수정 */
   @Override
   public void updateSchedule(SistCalendarDTO sdto) throws Exception {
      sistCalendarDAO.updateSchedule(sdto);      
   }

   /* 일정 삭제 */
   @Override
   public void deleteSchedule(int sch_writenum) throws Exception {
      sistCalendarDAO.deleteSchedule(sch_writenum);
   }

   
   

}