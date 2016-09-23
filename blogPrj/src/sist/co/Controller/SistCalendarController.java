package sist.co.Controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.Model.SistMemberVO;
import sist.co.Service.SistCalendarService;
import sist.co.help.CalendarUtil;
import sist.co.help.myCal;
import sist.co.Model.SistCalendarParam;
import sist.co.Model.SistCalendarDTO;

@Controller
public class SistCalendarController {
   private static final Logger logger = LoggerFactory.getLogger(SistCalendarController.class);
   
   @Autowired
   private SistCalendarService sistCalendarService; 
   
   
   @RequestMapping(value="calendar.do", method={RequestMethod.GET, RequestMethod.POST})
   public String calendar(HttpServletRequest request, myCal mycal, Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController calendar " + new Date());
      /*System.out.println(login.id);*/
      
      mycal.calculate();
      
      // 클릭한 날짜 값 취득
      // 우선 url에 있는 날짜 값을 calendar.jsp에서 찍어서 확인한다 그 후에 안되면 여기서 날짜 넘기는 값 다시 전달해서 datepicker 세팅한다.
      
      // 자신의 정보 취득
      String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
            
      String yyyyMm = CalendarUtil.yyyymm(mycal.getYear(), mycal.getMonth());
      SistCalendarDTO caldto = new SistCalendarDTO();
      caldto.setSch_id(id);
      caldto.setSch_startdate(yyyyMm);
      
      List<SistCalendarDTO> clist = sistCalendarService.getCalendarList(caldto);
      
      /*List<SistCalendarDTO> callist = sistCalendarService.getSchQuickView(caldto);*/
      
      
      model.addAttribute("clist", clist);
      model.addAttribute("doc_title", "캘린더");
      model.addAttribute("mycal", mycal);
      
      
      return "calendar.tiles";
   }
   
   /* 일정 퀵뷰 */
   @RequestMapping(value="sch_quick_view.do", method={RequestMethod.GET, RequestMethod.POST})
   
   public  @ResponseBody SistCalendarDTO sch_quick_view(HttpServletRequest request, Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController sch_quick_view " + new Date());      
      
      // 일정 글 번호 취득
      String getSch_writenum= request.getParameter("sch_writenum");
      int num = Integer.parseInt(getSch_writenum);

      // 아이디 취득
      String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
            
      
      SistCalendarDTO caldto = new SistCalendarDTO();
      
      caldto.setSch_id(id);
      caldto.setSch_writenum(num);
      
      
      SistCalendarDTO qdto = sistCalendarService.getSchQuickView(caldto);
      System.out.println("번호는 " + num);
      
      qdto.getSch_title();
      
      System.out.println(qdto);
      model.addAttribute("doc_title", "캘린더");
      model.addAttribute("qdto", qdto);
      /*Map<String, List<SistCalendarDTO>> map = new HashMap<String, List<SistCalendarDTO>>();
      map.put("my", qdto);*/
      
      return (SistCalendarDTO)qdto;
   }
   
   
   /* 일정 상세보기 */
   @RequestMapping(value="sch_update.do", method={RequestMethod.GET, RequestMethod.POST})
   public String sch_update(SistCalendarDTO scal, Model model) throws Exception{
      logger.info("SistCalendarController sch_update ");
      
      model.addAttribute("doc_title", "일정 수정하기");                  
      SistCalendarDTO sch_dto = sistCalendarService.getSch(scal);
      
      System.out.println("번호는 " + sch_dto.toString());
      
      model.addAttribute("scal", sch_dto);
      
      return "sch_update.tiles";
   }
   
   // 일정, 약속쓰기 페이지 이동
   @RequestMapping(value="schwrite.do", method={RequestMethod.GET, RequestMethod.POST})
   public String schwrite(HttpServletRequest request, myCal mycal, Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController schwrite " + new Date());
      
      mycal.calculate();
      
      String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
      
      String yyyyMm = CalendarUtil.yyyymm(mycal.getYear(), mycal.getMonth());
      SistCalendarDTO caldto = new SistCalendarDTO();
      caldto.setSch_id(id);
      caldto.setSch_rdate(yyyyMm);
      
      model.addAttribute("doc_title", "일정, 약속 쓰기");
      
      model.addAttribute("mycal", mycal);
      return "schwrite.tiles";
   }
   
   // 일정, 약속쓰기 after
   @RequestMapping(value="schwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
   public String schwriteAf(HttpServletRequest request, SistCalendarParam calparam, Model model)throws Exception{
      logger.info("CalendarController schwriteAf " + new Date());
      
      String SyyyyMmdd = CalendarUtil.yyyymmdd(calparam.getSyear(), calparam.getSmonth(), calparam.getSday());
      String EyyyyMmdd = CalendarUtil.yyyymmdd(calparam.getEyear(), calparam.getEmonth(), calparam.getEday());
      
      SistCalendarDTO caldto = new SistCalendarDTO(
            calparam.getSch_id(),
            calparam.getSch_title(),
            calparam.getSch_star(),
            calparam.getSch_location(),
            SyyyyMmdd,
            calparam.getSch_starttime(),
            EyyyyMmdd,
            calparam.getSch_endtime(),

            calparam.getSch_allday(),
            calparam.getSch_public(),
            calparam.getSch_sticker(),
            calparam.getSch_content(),
            calparam.getSch_docname(),
            calparam.getSch_alarm()
            );
      sistCalendarService.writeSchedule(caldto);
      model.addAttribute("year", calparam.getYear());
      model.addAttribute("month", calparam.getMonth());
      
      return "forward:/calendar.do"; 
   }
   
   /* 일정  수정 -> detail 겸 수정페이지가 한 몸임 */
   @RequestMapping(value="sch_detail.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String sch_detail(HttpServletRequest request, Model model)throws Exception{
      logger.info("CalendarController sch_detail " + new Date());
      
      // 일정 글 번호 취득
      String getSch_writenum= request.getParameter("sch_writenum");
      int num = Integer.parseInt(getSch_writenum);

      String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
            
      SistCalendarDTO caldto = new SistCalendarDTO();
            
      caldto.setSch_id(id);
      caldto.setSch_writenum(num);            
            
      SistCalendarDTO qdto = sistCalendarService.getSchQuickView(caldto);
      System.out.println("번호는 " + num);
            
      System.out.println(qdto);
      model.addAttribute("doc_title", "캘린더");
      model.addAttribute("qdto", qdto);
      
      return "redirect:/sch_detail.tiles"; 
   }
   
   
   /* 일정  수정 after */
   @RequestMapping(value="sch_updateAf.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String sch_updateAf(HttpServletRequest request, Model model, SistCalendarParam calparam, SistCalendarDTO sdto)throws Exception{
      logger.info("CalendarController sch_updateAf.do " + new Date());
      
      // 일정 글 번호 취득
      String getSch_writenum= request.getParameter("sch_writenum");
      int num = Integer.parseInt(getSch_writenum);
      System.out.println("수정ㅇ된 ㄴ벌호:"+num);
      
      String SyyyyMmdd = CalendarUtil.yyyymmdd(calparam.getSyear(), calparam.getSmonth(), calparam.getSday());
      String EyyyyMmdd = CalendarUtil.yyyymmdd(calparam.getEyear(), calparam.getEmonth(), calparam.getEday());
      
      sdto.setSch_startdate(SyyyyMmdd);
      sdto.setSch_enddate(EyyyyMmdd);
      
      sistCalendarService.updateSchedule(sdto);
      System.out.println("자료는 " + sdto.toString());
   
      model.addAttribute("year", calparam.getYear());
      model.addAttribute("month", calparam.getMonth());
      
      int year = calparam.getSyear();
      int months = calparam.getSmonth();
      
      
      return "redirect:/calendar.do?year="+year+"&month="+months; 
   }
   
   /* 일정 삭제 */
   @RequestMapping(value="sch_delete.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String sch_delete(HttpServletRequest request, SistCalendarParam calparam)throws Exception{
      logger.info("CalendarController sch_delete.do ");
      
      String year= request.getParameter("syear");
      String month= request.getParameter("smonth");
      
      String getSch_writenum= request.getParameter("sch_writenum");
      int sch_writenum = Integer.parseInt(getSch_writenum);
      sistCalendarService.deleteSchedule(sch_writenum);
      
      return "redirect:/calendar.do?year="+year+"&month="+month; 
   }
   
   
   // 설정 페이지 이동
   @RequestMapping(value="setting.do", method={RequestMethod.GET, RequestMethod.POST})
   public String setting(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController setting " + new Date());
      return "setting.tiles";
   }
   
   // 기본 설정 페이지 이동
   @RequestMapping(value="default_setting.do", method={RequestMethod.GET, RequestMethod.POST})
   public String default_setting(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController default_setting " + new Date());
      return "default_setting.tiles";
   }
   
   // 일정 설정 페이지 이동   
   @RequestMapping(value="sch_setting.do", method={RequestMethod.GET, RequestMethod.POST})
   public String sch_setting(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController sch_setting " + new Date());
      return "sch_setting.tiles";
   }
   
   // 알람 설정 페이지 이동
   @RequestMapping(value="alarm_setting.do", method={RequestMethod.GET, RequestMethod.POST})
   public String alarm_setting(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController alarm_setting " + new Date());
      return "alarm_setting.tiles";
   }
   
   // 달력 만들기 페이지 이동
   @RequestMapping(value="makecalendar.do", method={RequestMethod.GET, RequestMethod.POST})
   public String makecalendar(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController makecalendar " + new Date());
      return "makecalendar.tiles";
   }
   
   // 공유 달력 만들기 페이지 이동
   @RequestMapping(value="make_sharecalendar.do", method={RequestMethod.GET, RequestMethod.POST})
   public String make_sharecalendar(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController make_sharecalendar " + new Date());
      return "make_sharecalendar.tiles";
   }
   
   // 공유 달력 만들기 페이지 이동
   @RequestMapping(value="search_cal.do", method={RequestMethod.GET, RequestMethod.POST})
   public String search_cal(Model model)throws Exception{
      logger.info("환영합니다 SistCalendarController search_cal " + new Date());
      return "search_cal.tiles";
   }
}