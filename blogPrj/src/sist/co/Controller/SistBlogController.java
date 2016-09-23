package sist.co.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistLikePeopleDTO;
import sist.co.Model.SistMemberVO;
import sist.co.Service.SistBlogService;
import sist.co.Service.SistMemberService;



@Controller
public class SistBlogController {
	
	private static final Logger logger = LoggerFactory.getLogger(SistBlogController.class);
	 
	@Autowired
	SistBlogService sistBlogService;
	
	@Autowired
	SistMemberService sistMemberService;
	
	/*블로그 기본 화면. 전체 리스트를 볼 수 있다.*/
	@RequestMapping(value="blog.do", method={RequestMethod.GET, RequestMethod.POST})
	public String blog(SistBlogDTO blog,HttpServletRequest request, Model model) throws Exception{
		logger.info("welcome SistBlogController blog");
		
		//로그인 한 아이디. 세션에서 불러오기
		SistMemberVO log_data =(SistMemberVO)request.getSession().getAttribute("login");
		//String lid = log_data.getM_id();
		//request.getSession().setAttribute("lid", lid); //세션에는 lid로 저장
		
		//친구 블로그 아이디
		String fid = request.getParameter("fid")==null?"":request.getParameter("fid"); //맨 처음 넘어올때
		/*--------아이디만 가져오는게 아니라 여기에 getmember도 해야함.id로 프로필때문에 -----------------------*/
		SistMemberVO finfo = sistMemberService.getmember(fid);
		//친구 아이디 정보들 저장되어있음
		request.getSession().setAttribute("finfo", finfo);
		
		//내 블로그일때
		if(log_data.getM_id().equals(finfo.getM_id())|| log_data.getM_id() == finfo.getM_id()){
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(log_data.getM_id());
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);
			
		}else if(!log_data.getM_id().equals(finfo.getM_id())||log_data.getM_id() != finfo.getM_id()){ //다른사람 블로그일때
			//bbs list
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(finfo.getM_id());
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);
		}else if(fid.equals("")||fid.equals(null)||fid.equals("null")||fid==null||fid=="null"){ //fid안들어왔을때 예외처리
			//bbs list
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(log_data.getM_id());
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);
		}else{
			System.out.println("fid,log_id 달라.잘못들어왔어");
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(finfo.getM_id());
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);
		}
		
		
		
		//StringUtils.defaultIfEmpty(fid, StringUtils.EMPTY);
		/*String getfid = (String)request.getSession().getAttribute("fid");*/
		//fid가 null인 경우
		//1.친구 블로그 중에 처음 넘어온 상태 아님.아까 넘어왔음. 세션에 친구 아이디 저장되어있는 상태
		//2.자기 블로그에 온 경우
/*		if(fid.equals("")||fid.equals(null)||fid.equals("null")||fid==null||fid=="null"){ 
			//1. 친구 블로그 안에서 이동하는중
			//아직 blog.do로 다른 메소드 갔다가 돌아오는 경우 없음
			
			//2. myblog
			//bbs list
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(log_id);
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);
			
		}else{
			//1.맨 처음 여기 블로그로 넘어올때. fid 담겨있음. 세션에 저장하기
			//2.자기 블로그 아님
			request.getSession().setAttribute("fid", fid);
			
			//bbs list
			List<SistBlogDTO> bloglist = sistBlogService.getBlogList(fid);
			model.addAttribute("bloglist",bloglist);
			
			//like list
			List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
			model.addAttribute("likelist",likelist);
			
			//like show list => get only 1 value
			List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
			model.addAttribute("likerest",likerest);

		}*/
	/*	SistMemberVO Blog_mem = sistBlogService.selectMember(request.getParameter("blog_id"));
		SistBlogInfo info = sistBlogService.selectBlog()
		
		
				request.getSession().setAttribute("blog_emm, arg1);
*/		
		/*request.getSession().getAttribute("blog_id");*/
		

		return "blog.tiles";
		
	}
	
	/*글쓰기 페이지로 이동*/
	@RequestMapping(value="bbswrite.do",method=RequestMethod.GET)
	public String bbswrite(Model model){
		logger.info("welcome SistBlogController bbswrite");
		return "bbswrite.tiles";
	}
	
	/*글쓴거 db에 넣기*/
	@RequestMapping(value="bbswriteAf.do",method=RequestMethod.POST)
	public String bbswriteAf(SistBlogDTO blog,Model model)throws Exception{
		logger.info("welcome SistBlogController bbswriteAf");
/*		
		System.out.println("seq: "+ blog.getBbs_seq());
		System.out.println("m_id: "+ blog.getM_id());
		System.out.println("bbs_ca_seq : "+ blog.getBbs_ca_seq());
		System.out.println("bbs_title : "+ blog.getBbs_title());
		System.out.println("bbs_content: "+ blog.getBbs_content());
		System.out.println("bbs_hid : "+ blog.getBbs_hid());
		System.out.println("bbs_comchk : "+ blog.getBbs_comchk());
		System.out.println("bbs_likechk : "+ blog.getBbs_likechk());
		System.out.println("bbs_scrapchk  : "+ blog.getBbs_scrapchk());
	*/	
		sistBlogService.writeBBS(blog);
		
		return "redirect:/blog.do?fid="+blog.getM_id();
	}
	
	/*게시물 수정페이지로 이동*/
	@RequestMapping(value="bbsupdate.do",method={RequestMethod.GET, RequestMethod.POST})
	public String bbsupdate(SistBlogDTO blog,Model model) throws Exception{
		logger.info("welcome SistBlogController bbsupdate");
		
		SistBlogDTO bdto = sistBlogService.getBBS(blog);
		model.addAttribute("d_blog",bdto);
		
		return "bbsupdate.tiles";
	}
	
	/*게시물 수정*/
	@RequestMapping(value="bbsupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsupdateAf(SistBlogDTO blog,Model model){
		logger.info("welcome SistBlogController bbsupdateAf");
		
		sistBlogService.updateBBS(blog);		
		
		return "redirect:/blog.do?fid="+blog.getM_id();
	}
	
	/*게시물 삭제*/
	@RequestMapping(value="bbsdel.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsdel(int bbs_seq,String m_id,Model model){
		logger.info("welcome SistBlogController bbsdel");
		
		System.out.println("m_id:"+m_id);
		sistBlogService	.delBBS(bbs_seq);
		
		return "redirect:/blog.do?fid="+m_id;
	}
	
	/* 블로그 내의 검색페이지로 이동*/
	@RequestMapping(value="blogsearch.do",method=RequestMethod.GET)
	public String blogsearch(Model model){
		logger.info("welcome SistBlogController blogsearch");
		return "blogsearch.tiles";
	}
	
	/* 앨범형 블로그로 이동 */
	@RequestMapping(value="pictype.do",method=RequestMethod.GET)
	public String pictype(Model model){
		logger.info("welcome SistBlogController pictype");
		return "pictype.tiles";
	}
	

	/*블로그형 게시판 상세페이지*/
	@RequestMapping(value="BbbsDetail.do",method=RequestMethod.GET)
	public String BbbsDetail(HttpServletRequest request,SistBlogDTO blog, Model model) throws Exception{
		logger.info("welcome SistBlogController BbbsDetail");
		SistBbsLikeDTO like = new SistBbsLikeDTO();
		
		SistBlogDTO blogdto = sistBlogService.getBBS(blog);
		
		String m_id = request.getParameter("log_id"); //로그인한사람 아이디
		like.setM_id(m_id);
		like.setBbs_seq(blog.getBbs_seq());
		
		//total view => bbs list
		List<SistBlogDTO> bloglist = sistBlogService.getBlogList(m_id);
		model.addAttribute("bloglist",bloglist);
		
		/*like heart 1 :heart, 0:heart-o*/
		int sym = sistBlogService.symox(like);
		model.addAttribute("sym",sym);
		
		//like count
		int likecount = sistBlogService.likeCount(blog.getBbs_seq());
		model.addAttribute("likecount",likecount);
		model.addAttribute("blogdto",blogdto);
		
		//like people list
		List<SistLikePeopleDTO> peoplelist = sistBlogService.getLikePeople(blog.getBbs_seq());
		model.addAttribute("peoplelist",peoplelist);
		
		return "BbbsDetail.tiles";
	}
	
	

	/*앨범형 게시판 상세 페이지*/
	@RequestMapping(value="PbbsDetail.do",method=RequestMethod.GET)
	public String PbbsDetail(Model model){
		logger.info("welcome SistBlogController PbbsDetail");
		return "PbbsDetail.tiles";
	}
	

	/*투표 팝업 페이지*/
	@RequestMapping(value="poll_pop.do",method=RequestMethod.GET)
	public String poll_pop(Model model){
		logger.info("welcome SistBlogController poll_pop");
		return "poll_pop.tiles";
	}
	
	
/*blog_like///////////////////////////////*/
	
	//like add or del
	@RequestMapping(value="bbs_like.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int bbs_like(HttpServletRequest request, Model model){
		logger.info("welcome SistBlogController bbs_like");
		
		//ajax에서 받아온 정보들
		String m_id = request.getParameter("m_id");
		String obbs_seq= request.getParameter("bbs_seq");
		
	
		/*bbs_seq값이 안넘어왔으면*/
		if(obbs_seq == null||obbs_seq.equals("")){
			System.out.println("bbs_seq媛믪씠 �븞�뱾�뼱�솕�쑝");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			

			//ajax에서 받아온 param값 추가
			SistBbsLikeDTO like = new SistBbsLikeDTO();
			like.setM_id(m_id);
			like.setBbs_seq(bbs_seq);
			
			
			/*해당 게시물 seq를 해당 회원이 공감 눌렀는지 db에서 확인한다*/
			/*있으면 1 없으면 0*/
			int ssym = sistBlogService.symox(like);
			model.addAttribute("ssym",ssym);
			
			if(ssym == 1){//좋아요 이미 눌렀으면
				//좋아요 테이블에서 해당 컬럼 삭제
				sistBlogService.delBbsLike(like);
			}else{//좋아요 안눌었으면
				/*blog_like add*/
				sistBlogService.addBbsLike(like);
			}
			
			//좋아요 수
			int likecount = sistBlogService.likeCount(bbs_seq);
			model.addAttribute("likecount",likecount);

			/*ajax에  결과값으로 공감수 return해준다*/
			return likecount;
		}
		
		
	}
	
	//add heart
	@RequestMapping(value="bbs_heart.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int bbs_heart(HttpServletRequest request, Model model){
		logger.info("welcome SistBlogController bbs_heart");
		
		//ajax에서 받아온 정보들
		String m_id = request.getParameter("m_id");
		String obbs_seq= request.getParameter("bbs_seq");
		
	
		/*bbs_seq값이 안넘어왔으면*/
		if(obbs_seq == null||obbs_seq.equals("")){
			System.out.println("bbs_seq媛믪씠 �븞�뱾�뼱�솕�쑝");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			
			//ajax에서 받아온 param값 추가
			SistBbsLikeDTO like = new SistBbsLikeDTO();
			like.setM_id(m_id);
			like.setBbs_seq(bbs_seq);
			
			
			/*있으면 1 없으면 0*/
			int ssym = sistBlogService.symox(like);
			model.addAttribute("ssym",ssym);

			/*	하트 처리하기위해 0 or 1반환*/
			return ssym;
		}
		
		
	}
	
	//get like count
	@RequestMapping(value="likecount.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int likecount(HttpServletRequest request, Model model){
		logger.info("welcome SistBlogController likecount");
		
		//ajax�뿉�꽌 諛쏆븘�삩 �젙蹂대뱾
		String obbs_seq= request.getParameter("bbs_seq");
		
	
		/*bbs_seq媛믪씠 �븞�꽆�뼱�솕�쑝硫�*/
		if(obbs_seq == null||obbs_seq.equals("")){
			System.out.println("bbs_seq媛믪씠 �븞�뱾�뼱�샂");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			
			//醫뗭븘�슂 �닔
			int startcount = sistBlogService.likeCount(bbs_seq);
			model.addAttribute("startcount",startcount);
			
			//System.out.println("startcount"+startcount);

		/*	�븯�듃 泥섎━�븯湲곗쐞�빐 0 or 1諛섑솚*/
			return startcount;
		}
		
		
	}
	
	
	
	//login(id)한 사람의 아이디가 db에 있는지 검사. 있으면 1(꽉찬하트), 없으면 0(빈하트)
	@RequestMapping(value="likeheart.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int likeheart(HttpServletRequest request, Model model){
		logger.info("welcome SistBlogController likeheart");
		
		//ajax에서 받아온 정보들
		String m_id = request.getParameter("m_id");
		String obbs_seq= request.getParameter("bbs_seq");
		
	
		/*bbs_seq값이 안넘어왔으면*/
		if(obbs_seq == null||obbs_seq.equals("")){
			System.out.println("bbs_seq媛믪씠 �븞�뱾�뼱�솕�쑝");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			
			//ajax�뿉�꽌 諛쏆븘�삩 param媛� 異붽�
			SistBbsLikeDTO like = new SistBbsLikeDTO();
			like.setM_id(m_id);
			like.setBbs_seq(bbs_seq);
			
			
			/*있으면 1 없으면 0*/
			int hsym = sistBlogService.symox(like);
			model.addAttribute("hsym",hsym);
			
			//System.out.println("hsym:"+hsym);


			/*	하트 처리하기위해 0 or 1반환*/
			return hsym;
		}
		
	}	
	

	//ajax: like people list
	@RequestMapping(value="likepeople.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<SistLikePeopleDTO> likepeople(HttpServletRequest request, Model model) throws Exception{
		logger.info("welcome SistBlogController likepeopleList");
		
		//get ajax data 
		String obbs_seq= request.getParameter("bbs_seq");


		int bbs_seq = Integer.parseInt(obbs_seq);
		
		//like people list
		List<SistLikePeopleDTO> peoplelist = sistBlogService.getLikePeople(bbs_seq);
		model.addAttribute("peoplelist",peoplelist);	
		model.addAttribute("pleng",peoplelist.size());

		return peoplelist;
		
		
	}	
	
	
	
}