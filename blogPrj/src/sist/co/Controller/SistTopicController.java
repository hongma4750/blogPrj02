package sist.co.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistTopicDTO;
import sist.co.Model.SistTopicPageDTO;
import sist.co.Service.SistCalendarService;
import sist.co.Service.SistTopicService;

@Controller
public class SistTopicController {
	private static final Logger logger = LoggerFactory.getLogger(SistMemberController.class);
	
	@Autowired
	private SistTopicService sistTopicService;
	
	//주제별글보기_전체
	@RequestMapping(value="topiclist.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topiclistALL(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. topiclist.do 실행중!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		// 최신순 저장
		request.getSession().setAttribute("likes", 1);
		
		SistBlogDTO bdto = new SistBlogDTO();
		
		List<SistBlogDTO> blist = sistTopicService.getTopicListAll(bdto);
		model.addAttribute("blist", blist);
		
		//페이지 수
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
						
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
								
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		
					
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageListMainAll(pageDto);
		model.addAttribute("topicPageList",topicPageList);	
		
		return "topiclist.tiles";
	}
	
	
	// [메인]주제별 글보기-전체-공감순
	@RequestMapping(value="topiclistlike.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topiclistlike(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. topiclistlike.do 실행중");
		
		String likes = request.getParameter("likes");
		
		
		if( likes != null) {
			request.getSession().setAttribute("likes", likes);
			System.out.println("공감순 여부"+likes);
		}
		
		
		
		SistBlogDTO bdto = new SistBlogDTO();
		
		List<SistBlogDTO> blist = sistTopicService.getTopicListAll(bdto);
		model.addAttribute("blist", blist);
		
		//페이지 수
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
						
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
								
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		
					
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageListMainAllLike(pageDto);
		model.addAttribute("topicPageList",topicPageList);	
		
		
		return "topiclist.tiles";
	}
	
	
	
	//주제별글보기_항목별
	@RequestMapping(value="topiclist1.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topiclist(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. topiclist1.do 실행중!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		// 최신순 저장
		request.getSession().setAttribute("likes", 1);
		
		String t_num = request.getParameter("t_seq");
		
		if( t_num != null) {
			System.out.println("number=======" + t_num);
			int t_seq = Integer.parseInt(t_num);
			request.getSession().setAttribute("num", t_seq);
		}
		
		int number =  (int) request.getSession().getAttribute("num");
		
		List<SistTopicDTO> blist = sistTopicService.getTopicList(number);
		model.addAttribute("blist", blist);
		
		System.out.println("numbers=======" + number);
		
		
		//페이지 수
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
					
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
						
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		pageDto.setT_seq(number);
				
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageListAll(pageDto);
		model.addAttribute("topicPageList",topicPageList);		
		
		return "topiclist1.tiles";
	}	
	
	
	
	// [메인]주제별 글보기-항목별-공감순
	@RequestMapping(value="topiclistlike1.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topiclistlike1(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. topiclistlike1.do 실행중!");
		String likes = request.getParameter("likes");
		
		if( likes != null) {
			request.getSession().setAttribute("likes", likes);
			System.out.println("공감순 여부"+likes);
		}
		
		int number =  (int) request.getSession().getAttribute("num");
		
		List<SistTopicDTO> blist = sistTopicService.getTopicList(number);
		model.addAttribute("blist", blist);
		
		System.out.println("numbers=======" + number);
		
		
		//페이지 수
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
					
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
						
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		pageDto.setT_seq(number);
				
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageList(pageDto);
		model.addAttribute("topicPageList",topicPageList);		
		
		
		return "topiclist1.tiles";
	}	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////
	// nav바 주목받는 글보기
	@RequestMapping(value="topic.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topic(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. 주목 받는 글 topic");
		
		
		String cate_num = request.getParameter("cate");
		System.out.println("cate=" + cate_num);
		
		int cate = Integer.parseInt(cate_num);		
		request.getSession().setAttribute("cate", cate);
		
		int number =  (int) request.getSession().getAttribute("cate");
		
		
		//페이지 수
		
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
				
				
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
				
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		pageDto.setT_seq(number);
		
		
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageList(pageDto);
		model.addAttribute("topicPageList",topicPageList);
		
		
		List<SistTopicDTO> blist = sistTopicService.getTopicListNav(number);
		model.addAttribute("blist", blist);
		
		
		// 세션에 카테고리 num 저장				
		System.out.println("세션에 저장된 번호 "+ request.getSession().getAttribute("cate"));
		
		
		return "topic.tiles";
	}
	
	
	// 탭에서 클릭한 주목받는 글보기
		@RequestMapping(value="topic1.do",method={RequestMethod.GET,RequestMethod.POST})
		public String topic1(Model model, HttpServletRequest request)throws Exception{
			logger.info("환영합니다.탭으로 클린한 주목 받는 글 topic ");
			
			int number =  (int) request.getSession().getAttribute("cate");
			System.out.println("세션에 받아온 번호 "+number);
			
			
			
			//페이지 수
			String pageobj = request.getParameter("page");
			int currentpage;
			if (pageobj == null) {
				currentpage = 1;
			} else {
				currentpage = Integer.parseInt(pageobj);
			}
										
			int page01 = (currentpage - 1) * 5 + 1;
			int page02 = currentpage * 5;
					
			SistTopicPageDTO pageDto = new SistTopicPageDTO();
			pageDto.setPage01(page01);
			pageDto.setPage02(page02);
			pageDto.setT_seq(number);
			
			
			List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageList(pageDto);
			model.addAttribute("topicPageList",topicPageList);
			
			
			List<SistTopicDTO> blist = sistTopicService.getTopicListNav(number);
			model.addAttribute("blist", blist);
			
			return "topic.tiles";
		}
	
	
		
	// nav바 전체 글보기
	@RequestMapping(value="topicall.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topicall(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. topicall.do  nav바 전체 글보기");

		int number =  (int) request.getSession().getAttribute("cate");
		/*
		System.out.println("세션에 받아온 번호 "+number);
		*/
		
		//페이지 수
		String pageobj = request.getParameter("page");
		int currentpage;
		if (pageobj == null) {
			currentpage = 1;
		} else {
			currentpage = Integer.parseInt(pageobj);
		}
				
				
		int page01 = (currentpage - 1) * 5 + 1;
		int page02 = currentpage * 5;
				
		SistTopicPageDTO pageDto = new SistTopicPageDTO();
		pageDto.setPage01(page01);
		pageDto.setPage02(page02);
		pageDto.setT_seq(number);
		
		
		List<SistTopicPageDTO> topicPageList = sistTopicService.getPointChargePageListAll(pageDto);
		model.addAttribute("topicPageList",topicPageList);
		
		List<SistTopicDTO> blist = sistTopicService.getTopicListNavAll(number);
		model.addAttribute("blist", blist);
		
		return "topicall.tiles";
	}
//////////////////////////////////////////////////////////////////스팟 시작
	
	// 오늘의 top 글
	@RequestMapping(value="todaytop.do",method={RequestMethod.GET,RequestMethod.POST})
	public String todaytop(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. todaytop.do  오늘의 톱!");
		
		String t_num = request.getParameter("t_seq");
		int t_seq = Integer.parseInt(t_num);
		
		List<SistTopicDTO> toplist = sistTopicService.getTopList(t_seq);
		model.addAttribute("toplist", toplist);
		return "index.tiles";
	}
	
	
////////////////////////////////////////////////////////////////// 메인 검색
	@RequestMapping(value="search.do",method={RequestMethod.GET,RequestMethod.POST})
	public String search(Model model, HttpServletRequest request)throws Exception{
		logger.info("환영합니다. todaytop.do  검색");
		
		String con = request.getParameter("srh_con");
		String op = request.getParameter("srh_op");
		System.out.println("검색 내용은 con " + con);
		System.out.println("검색 옵션은 op " + op);
		
		if( con != null) {
			request.getSession().setAttribute("search_con", con);
			System.out.println("세션에 저장될 검색 내용 "+con);
		}
		
		// 입력해서 검색할 경우
		if(op != null && con != null){
			if(op.equals("post")){
				SistTopicDTO srhbdto = new SistTopicDTO();
				srhbdto.setSearchval(con);
				
				List<SistTopicDTO> sblist = sistTopicService.getSearchPost(srhbdto);
				model.addAttribute("sblist", sblist);
			}
			
			
			if(op.equals("blog")){
					SistTopicDTO srhbdto = new SistTopicDTO();
					srhbdto.setSearchval(con);
					
					List<SistTopicDTO> sblist = sistTopicService.getSearchBlog(srhbdto);
					model.addAttribute("sblist", sblist);
			}
			
			
			if(op.equals("nicknid")){
				SistTopicDTO srhbdto = new SistTopicDTO();
				srhbdto.setSearchval(con);
				
				List<SistTopicDTO> sblist = sistTopicService.getSearchPost(srhbdto);
				model.addAttribute("sblist", sblist);
			}
		}
		
		
		// 탭 버튼으로 검색할 경우
		if(op != null && con==null){
			if(op.equals("post")){
				
				String s_con =  (String) request.getSession().getAttribute("search_con");
				System.out.println("세션값으로 검색할 내용 "+s_con );
				
				SistTopicDTO srhbdto = new SistTopicDTO();
				srhbdto.setSearchval(s_con);
				
				List<SistTopicDTO> sblist = sistTopicService.getSearchPost(srhbdto);
				model.addAttribute("sblist", sblist);
			}
			
			if(op.equals("blog")){
				
				String s_con =  (String) request.getSession().getAttribute("search_con");
				System.out.println("세션값으로 검색할 내용 "+s_con );
				
				SistTopicDTO srhbdto = new SistTopicDTO();
				srhbdto.setSearchval(s_con);
					
				List<SistTopicDTO> sblist = sistTopicService.getSearchBlog(srhbdto);
				model.addAttribute("sblist", sblist);
			}			
			
			if(op.equals("nicknid")){
				
				String s_con =  (String) request.getSession().getAttribute("search_con");
				System.out.println("세션값으로 검색할 내용 "+s_con );
				
				SistTopicDTO srhbdto = new SistTopicDTO();
				srhbdto.setSearchval(s_con);
				
				List<SistTopicDTO> sblist = sistTopicService.getSearchPost(srhbdto);
				model.addAttribute("sblist", sblist);
			}
		}
		
		return "search.tiles";
	}
}
