package sist.co.Controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import sist.co.Service.SistBlogService;



@Controller
public class SistBlogController {
	
	private static final Logger logger = LoggerFactory.getLogger(SistBlogController.class);
	 
	@Autowired
	SistBlogService sistBlogService;
	
	/*블로그 기본 화면. 전체 리스트를 볼 수 있다.*/
	@RequestMapping(value="blog.do", method={RequestMethod.GET, RequestMethod.POST})
	public String blog(SistBlogDTO blog,HttpServletRequest request, Model model) throws Exception{
		logger.info("welcome SistBlogController blog");
		
		//bbs list
		List<SistBlogDTO> bloglist = sistBlogService.getBlogList();
		model.addAttribute("bloglist",bloglist);
		
		//like list
		List<SistBbsLikeDTO> likelist = sistBlogService.getLikeList();
		model.addAttribute("likelist",likelist);
		
		//like show list
		List<SistBlogDTO> likerest = sistBlogService.getLikeallow();
		model.addAttribute("likerest",likerest);

		//좋아요 수
/*		int likecount = sistBlogService.likeCount(blog.getBbs_seq());
		model.addAttribute("likecount",likecount);*/
		
		
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
		
/*		System.out.println("seq: "+ blog.getBbs_seq());
		System.out.println("m_id: "+ blog.getM_id());
		System.out.println("bbs_ca_seq : "+ blog.getBbs_ca_seq());
		System.out.println("bbs_title : "+ blog.getBbs_title());
		System.out.println("bbs_content: "+ blog.getBbs_content());
		System.out.println("bbs_hid : "+ blog.getBbs_hid());
		System.out.println("bbs_comchk : "+ blog.getBbs_comchk());
		System.out.println("bbs_likechk : "+ blog.getBbs_likechk());
		System.out.println("bbs_scrapchk  : "+ blog.getBbs_scrapchk());*/
		
		sistBlogService.writeBBS(blog);
		
		return "redirect:/blog.do";
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
		
		return "redirect:/blog.do";
	}
	
	/*게시물 수정*/
	@RequestMapping(value="bbsdel.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsdel(int bbs_seq,Model model){
		logger.info("welcome SistBlogController bbsdel");
		
		sistBlogService	.delBBS(bbs_seq);
		
		return "redirect:/blog.do";
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
		
		String m_id = request.getParameter("log_id");
		like.setM_id(m_id);
		like.setBbs_seq(blog.getBbs_seq());
		
		/*해당 게시물에 좋아요 한거 있으면 1 없으면 0*/
		int sym = sistBlogService.symox(like);
		model.addAttribute("sym",sym);
		
		//좋아요 수
		int likecount = sistBlogService.likeCount(blog.getBbs_seq());
		model.addAttribute("likecount",likecount);
		model.addAttribute("blogdto",blogdto);
		
		//이 게시물에 공감 한 사람들
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
			System.out.println("bbs_seq값이 안들어왔으");
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
	            //bbs테이블에서 좋아요 count--해줌
	            sistBlogService.likeminus(bbs_seq);
	         }else{//좋아요 안눌렀으면
	            /*blog_like add*/
	            sistBlogService.addBbsLike(like);
	            //bbs테이블에서 좋아요 count++해준다
	            sistBlogService.likeplus(bbs_seq);
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
			System.out.println("bbs_seq값이 안들어왔으");
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

		/*	하트 처리하기위해 0 or 1반환*/
			return ssym;
		}
		
		
	}
	
	//get like count
	@RequestMapping(value="likecount.do",method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int likecount(HttpServletRequest request, Model model){
		logger.info("welcome SistBlogController likecount");
		
		//ajax에서 받아온 정보들
		String obbs_seq= request.getParameter("bbs_seq");
		
	
		/*bbs_seq값이 안넘어왔으면*/
		if(obbs_seq == null||obbs_seq.equals("")){
			System.out.println("bbs_seq값이 안들어옴");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			
			//좋아요 수
			int startcount = sistBlogService.likeCount(bbs_seq);
			model.addAttribute("startcount",startcount);
			
			//System.out.println("startcount"+startcount);

		/*	하트 처리하기위해 0 or 1반환*/
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
			System.out.println("bbs_seq값이 안들어왔으");
			return -1;
		}else{
			int bbs_seq = Integer.parseInt(obbs_seq);
			
			//ajax에서 받아온 param값 추가
			SistBbsLikeDTO like = new SistBbsLikeDTO();
			like.setM_id(m_id);
			like.setBbs_seq(bbs_seq);
			
			
			/*해당 게시물 seq를 해당 회원이 공감 눌렀는지 db에서 확인한다*/
			/*있으면 1 없으면 0*/
			int hsym = sistBlogService.symox(like);
			model.addAttribute("hsym",hsym);
			
			//System.out.println("hsym:"+hsym);

		/*	하트 처리하기위해 0 or 1반환*/
			return hsym;
		}
		
	}	
	
	
}