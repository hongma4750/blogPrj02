package sist.co.Controller;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.apache.tomcat.util.net.SSLImplementation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.net.aso.s;
import sist.co.Model.SistBlog;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistDblFollowingVO;
import sist.co.Model.SistFgroupVO;
import sist.co.Model.SistFollowingVO;
import sist.co.Model.SistFriendParamVO;
import sist.co.Model.SistFriendVO;
import sist.co.Model.SistFsettingVO;
import sist.co.Model.SistMemberVO;
import sist.co.Service.SistBlogService;
import sist.co.Service.SistFriendDAO;
import sist.co.Service.SistFriendService;
import sist.co.Service.SistMemberService;
import sist.co.Service.SistTopicService;

@Controller
public class SistFriendController {
	
	private static final Logger logger = LoggerFactory.getLogger(SistMemberController.class);
	
	@Autowired
	SistFriendService sistFriendService; 
	@Autowired
	SistTopicService sistTopicService;

	/*//주제별글보기_전체
	@RequestMapping(value="topiclist.do",method={RequestMethod.GET,RequestMethod.POST})
	public String topiclist(HttpServletRequest request,Model model){
		logger.info("환영합니다. topiclist.do 실행중");

		return "topiclist.tiles";
	}*/


	//이웃 소식_전체
	@RequestMapping(value="fnewslist.do",method={RequestMethod.GET,RequestMethod.POST})
	public String fnewslist(HttpServletRequest request,String myid, Model model) throws Exception{

		logger.info("환영합니다. fnewslist.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//서로이웃신청수
		int cnt = sistFriendService.cntR_2Fol(id);

		if(cnt>=0){
			model.addAttribute("cnt", cnt);
		}

		//서로이웃 신청 알림 내역
		List<SistDblFollowingVO> Rfolist = sistFriendService.getReceiveDblFols(id);
		if(Rfolist!=null){
			model.addAttribute("Rfolist", Rfolist);
		}

		//랜덤으로 이웃 한명 조회
		SistFriendVO fnd = sistFriendService.getFriend(id);

		if(fnd!=null){

			System.out.println(fnd.toString());
			model.addAttribute("fnd", fnd);


			//내 이웃의 이웃 추천
			List<SistFriendVO> fofflist = sistFriendService.gettheFofFriends(fnd);
			System.out.println(fofflist.toString());
			model.addAttribute("fofflist", fofflist);

		}

		//로그인 계정의 이웃들
		List<SistFriendVO> flist = sistFriendService.getFriends(id);

		System.out.println(flist.toString());
		model.addAttribute("flist", flist);

		//모든블로그리스트
		List<SistBlogDTO> blog= sistFriendService.getAllBlogList();
		model.addAttribute("blog", blog);



		return "fnewslist.tiles";
	}

	//이웃 소식_새글보기	
	@RequestMapping(value="newlist.do",method={RequestMethod.GET,RequestMethod.POST})
	public String newlist(HttpServletRequest request, String myid, Model model) throws Exception{
		logger.info("환영합니다. newlist.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//서로이웃신청수
		int cnt = sistFriendService.cntR_2Fol(id);
		
		//서로이웃 신청 알림 내역
		List<SistDblFollowingVO> Rfolist = sistFriendService.getReceiveDblFols(id);
		if(Rfolist!=null){
			model.addAttribute("Rfolist", Rfolist);
		}

		if(cnt>=0){
			model.addAttribute("cnt", cnt);
		}

		//로그인 계정의 이웃들
		List<SistFriendVO> flist = sistFriendService.getFriends(id);

		System.out.println(flist.toString());
		model.addAttribute("flist", flist);

		//모든블로그리스트
		List<SistBlogDTO> blog= sistFriendService.getAllBlogList();
		model.addAttribute("blog", blog);

		return "newlist.tiles";
	}

	//이웃 소식_이웃의이웃	
	@RequestMapping(value="foffriendlist.do",method={RequestMethod.GET,RequestMethod.POST})
	public String foffriendlist(HttpServletRequest request,String myid, Model model) throws Exception{
		logger.info("환영합니다. foffriendlist.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//서로이웃신청수
		int cnt = sistFriendService.cntR_2Fol(id);
		
		//서로이웃 신청 알림 내역
		List<SistDblFollowingVO> Rfolist = sistFriendService.getReceiveDblFols(id);
		if(Rfolist!=null){
			model.addAttribute("Rfolist", Rfolist);
		}

		if(cnt>=0){
			model.addAttribute("cnt", cnt);
		}

		//로그인 계정의 이웃들
		List<SistFriendVO> flist = sistFriendService.getFriends(id);
		System.out.println(flist.toString());
		model.addAttribute("flist", flist);


		for(int i=0;i<flist.size();i++){


			//내 이웃의 이웃
			List<SistFriendVO> fofflist = sistFriendService.gettheFofFriends(flist.get(i));

			System.out.println(fofflist.toString());
			model.addAttribute("fofflist", fofflist);

		}



		return "foffriendlist.tiles";
	}

	//이웃 소식_이웃목록	
	@RequestMapping(value="friends.do",method={RequestMethod.GET,RequestMethod.POST})
	public String friends(HttpServletRequest request,String myid, Model model)throws Exception{
		logger.info("환영합니다. friends.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//서로이웃신청수
		int cnt = sistFriendService.cntR_2Fol(id);
		
		//서로이웃 신청 알림 내역
		List<SistDblFollowingVO> Rfolist = sistFriendService.getReceiveDblFols(id);
		if(Rfolist!=null){
			model.addAttribute("Rfolist", Rfolist);
		}

		if(cnt>=0){
			model.addAttribute("cnt", cnt);
		}

		//전체친구목록
		List<SistFriendVO> flist = sistFriendService.getFriends(id);
		System.out.println(flist.toString());
		model.addAttribute("flist", flist);

		//이웃목록만get1FolFriends
		List<SistFriendVO> flistF1 = sistFriendService.get1FolFriends(id);
		System.out.println(flistF1.toString());
		model.addAttribute("flistF1", flistF1);

		//서로이웃목록만get2FolFriends
		List<SistFriendVO> flistF2 = sistFriendService.get1FolFriends(id);
		System.out.println(flistF2.toString());
		model.addAttribute("flistF2", flistF2);

		return "friends.tiles";
	}

	//이웃추가 팝업_이웃,서로이웃 선택	
	@RequestMapping(value="addfriend.do",method={RequestMethod.GET,RequestMethod.POST})
	public String addfriend(Model model){
		logger.info("환영합니다. addfriend.do 실행중");

		return "addfriend.tiles";
	}

	//이웃추가 팝업_이웃그룹 선택
	@RequestMapping(value="addfollowGroup.do",method={RequestMethod.GET,RequestMethod.POST})
	public String addfollowGroup(HttpServletRequest request, String myid, Model model) throws Exception{
		logger.info("환영합니다. addfollowGroup.do 실행중");

		//로그인 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		System.out.println(glist.toString());

		model.addAttribute("glist", glist);

		return "addfollowGroup.tiles";
	}

	/*//그룹추가
	@RequestMapping(value="addGroup.do",method={RequestMethod.GET,RequestMethod.POST})
	public String addGroupAF(HttpServletRequest request, SistFgroupVO group, String myid, Model model) throws Exception{
		logger.info("환영합니다. addGroupAF.do 실행중");

		//그룹추가(그룹추가한 경우만 추가되야함)
		System.out.println(group.toString());
		sistFriendService.addGroup(group);

		return "redirect:addGroup.do";
	}*/

	//이웃추가AF
	@RequestMapping(value="addfriendAF.do",method={RequestMethod.GET,RequestMethod.POST})
	public String addfriendAF(HttpServletRequest request,SistFgroupVO group,SistFriendVO friend, String myid, Model model) throws Exception{
		logger.info("환영합니다. addfriendAF.do 실행중");

		//로그인 정보취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		System.out.println(id);

		//이웃추가
		System.out.println("이웃추가:"+friend.toString());
		sistFriendService.addFriend(friend);

		//그룹추가(그룹추가한 경우만 추가되야함)
		System.out.println("그룹추가:"+group.toString());
		sistFriendService.addGroup(group);

		return "index.tiles";
	}


	//서로이웃 추가
	@RequestMapping(value="adddblfollowGroup.do", method={RequestMethod.GET,RequestMethod.POST})
	public String adddblfollowGroup (HttpServletRequest request, Model model) throws Exception{
		logger.info("환영합니다. adddblfollowGroup.do 실행중");

		//로그인 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		model.addAttribute("glist", glist);

		return "adddblfollowGroup.tiles";
	}

	//서로이웃추가AF
	@RequestMapping(value="adddblfriendAF.do", method={RequestMethod.GET,RequestMethod.POST})
	public String adddblfriendAF (HttpServletRequest request, SistFgroupVO group, SistDblFollowingVO dblfol, String myid, Model model) throws Exception{
		logger.info("환영합니다. adddblfriendAF.do 실행중");

		//로그인 정보취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		System.out.println(id);

		//서로이웃팔로잉 추가
		System.out.println(dblfol.toString());
		sistFriendService.addDblFollowing(dblfol);

		//그룹추가(그룹추가한 경우만 추가되야함)
		System.out.println("그룹추가:"+group.toString());
		sistFriendService.addGroup(group);

		return "index.tiles";
	}


	//이웃관리홈
			@RequestMapping(value="settingmain.do",method={RequestMethod.GET,RequestMethod.POST})
			public String settingmain(HttpServletRequest request, Model model) throws Exception{
				logger.info("환영합니다. settingmain.do 실행중");
				
				model.addAttribute("sideMenu","blogInfo");
				
				SistBlog sb = sistFriendService.selectBlog(request.getParameter("m_id"));
				
				request.getSession().setAttribute("blogInfo", sb);
				return "settingmain.tiles";
			}
	//이웃관리_메인
	@RequestMapping(value="settinghome.do",method={RequestMethod.GET,RequestMethod.POST})
	public String settinghome(Model model){
		logger.info("환영합니다. settinghome.do 실행중");
		return "settinghome.tiles";
	}

	//이웃관리와탭
	@RequestMapping(value="setTabCon.do",method={RequestMethod.GET,RequestMethod.POST})
	public String setTabCon(Model model){
		logger.info("환영합니다. setTabCon.do 실행중");
		return "setTabCon.tiles";
	}


	//탭1_열린이웃(메뉴1)
	@RequestMapping(value="openfriend.do",method={RequestMethod.GET,RequestMethod.POST})
	public String openfriend(HttpServletRequest request, String myid, Model model) throws Exception{
		logger.info("환영합니다. openfriend.do 실행중");


		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//id의 친구목록
		List<SistFriendVO> flist = sistFriendService.getFriends(id);
		System.out.println(flist.toString());
		model.addAttribute("flist", flist);
		
		//친구 수
		int fcnt = sistFriendService.cntfriend(id);
		if(fcnt>=0){ //0보다가 같거나 크면
			model.addAttribute("fcnt", fcnt);
		}

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		model.addAttribute("glist", glist);

		return "openfriend.tiles";
	}
	//그룹이동AF
	@RequestMapping(value="moveGroupAF.do",method={RequestMethod.GET,RequestMethod.POST})
	public String moveGroupAF(HttpServletRequest request,SistFgroupVO group,SistFriendVO friend, String myid, Model model) throws Exception{
		logger.info("환영합니다. moveGroupAF.do 실행중");

		//여러명 수정은?
		//그룹이동
		sistFriendService.moveGroup(friend);
		System.out.println(friend.toString());

		return "redirect:openfriend.do";
	}
	//친구삭제AF 
	@RequestMapping(value="delFriendAF.do",method={RequestMethod.GET,RequestMethod.POST})
	public String delFriendAF(HttpServletRequest request,SistFgroupVO group,SistFriendVO friend, String myid, Model model) throws Exception{
		logger.info("환영합니다. delFriendAF.do 실행중");

        //여러명 삭제는? 	
		sistFriendService.delFriend(friend);
		System.out.println(friend.toString());

		return "redirect:openfriend.do";
	}	



	//탭2_이웃그룹(메뉴1)
	@RequestMapping(value="friendgroup.do",method={RequestMethod.GET,RequestMethod.POST})
	public String friendgroup(Model model){
		logger.info("환영합니다. friendgroup.do 실행중");
		return "friendgroup.tiles";
	}

	//탭3_이웃순서(메뉴1)
	@RequestMapping(value="friendseq.do",method={RequestMethod.GET,RequestMethod.POST})
	public String friendseq(HttpServletRequest request, Model model)throws Exception{
		logger.info("환영합니다. friendseq.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//id의 친구목록
		List<SistFriendVO> flist = sistFriendService.getFriends(id);
		System.out.println(flist.toString());
		model.addAttribute("flist", flist);

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		model.addAttribute("glist", glist);

		return "friendseq.tiles";
	}


	//메뉴2_나를 추가한 이웃
	@RequestMapping(value="setfollower.do",method={RequestMethod.GET,RequestMethod.POST})
	public String setfollower(Model model){
		logger.info("환영합니다. setfollower.do 실행중");
		return "setfollower.tiles";
	}


	//탭1_받은신청(메뉴3)
	@RequestMapping(value="f_receive.do",method={RequestMethod.GET,RequestMethod.POST})
	public String f_receive(HttpServletRequest request, Model model) throws Exception{

		logger.info("환영합니다. f_receive.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//받은 이웃신청 목록
		List<SistDblFollowingVO> Rfolist = sistFriendService.getReceiveDblFols(id);
		model.addAttribute("Rfolist", Rfolist);
		System.out.println(Rfolist.toString());





		return "f_receive.tiles";
	}
	//탭2_보낸신청(메뉴3)
	@RequestMapping(value="f_send.do",method={RequestMethod.GET,RequestMethod.POST})
	public String f_send(HttpServletRequest request, Model model) throws Exception{
		logger.info("환영합니다. f_send.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//받은 이웃신청 목록
		List<SistDblFollowingVO> Sfolist = sistFriendService.getSendDblFols(id);
		model.addAttribute("Sfolist", Sfolist);
		System.out.println(Sfolist.toString());

		return "f_send.tiles";
	}
	//탭3_안내메시지(메뉴3)


	//서로이웃신청 수락
	@RequestMapping (value="acceptDblfol.do",method={RequestMethod.GET,RequestMethod.POST})
	public String acceptDblfol(HttpServletRequest request,Model model)throws Exception{
		logger.info("환영합니다. acceptDblfol.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		model.addAttribute("glist", glist);

		return "acceptDblfol.tiles";
	}
	//서로이웃신청 수락Sucs
	@RequestMapping (value="acceptSucs.do",method={RequestMethod.GET,RequestMethod.POST})
	public String acceptSucs(SistFgroupVO group,HttpServletRequest request,Model model)throws Exception{
		logger.info("환영합니다. acceptSucs.do 실행중");

		//해당seq
		String sseq=request.getParameter("seq");
		int seq=Integer.parseInt(sseq);
		System.out.println(seq);
		String gname = request.getParameter("fnd_groupname");


		//수락
		sistFriendService.acceptDblFols(seq);
		//햬땅SEQ DTO
		SistDblFollowingVO fvo = sistFriendService.get2fol(seq);


		//보낸친구추가
		SistFriendVO sfriend = new SistFriendVO();
		sfriend.setFnd_myid(fvo.getDf_send());
		sfriend.setFnd_fndid(fvo.getDf_receive());
		sfriend.setFnd_groupname(fvo.getFnd_groupname());
		sfriend.setFnd_chk(2);
		sistFriendService.addFriend(sfriend);

		//받은친구추가
		SistFriendVO rfriend = new SistFriendVO();
		rfriend.setFnd_myid(fvo.getDf_receive());
		rfriend.setFnd_fndid(fvo.getDf_send());
		rfriend.setFnd_groupname(gname);
		rfriend.setFnd_chk(2);
		sistFriendService.addFriend(rfriend);
		
		//그룹추가(그룹추가한 경우만 추가되야함)
		System.out.println("그룹추가:"+group.toString());
		sistFriendService.addGroup(group);

		//거절(팔로잉 거절)

		return "redirect:/f_receive.do";
	}

	//서로이웃신청 거절
	@RequestMapping (value="noDblfol.do",method={RequestMethod.GET,RequestMethod.POST})
	public String noDblfol(Model model){
		logger.info("환영합니다. noDblfol.do 실행중");
		return "noDblfol.tiles";
	}

	//관리기능_서로이웃받기 여부
	@RequestMapping (value="dblfollowchk.do",method={RequestMethod.GET,RequestMethod.POST})
	public String dblfollowchk(Model model){
		logger.info("환영합니다. dblfollowchk.do 실행중");
		return "dblfollowchkAF.do";
	}

	@RequestMapping (value="dblfollowchkAF.do",method={RequestMethod.GET,RequestMethod.POST})
	public String dblfollowchkAF(SistFsettingVO fset, Model model) throws Exception{
		logger.info("환영합니다. dblfollowchkAF.do 실행중");

		return "rediredct:/setfriendGroup.do";
	}

	//서로이웃 신청취소
	@RequestMapping (value="delsendfol.do",method={RequestMethod.GET,RequestMethod.POST})
	public String sendfoldel( HttpServletRequest request, Model model) throws Exception{
		logger.info("환영합니다. delsendfol.do 실행중");

		String sseq=request.getParameter("seq");
		int seq=Integer.parseInt(sseq);
		System.out.println(seq);

		sistFriendService.delsendfol(seq);

		return "redirect:/f_send.do";
	}

	//서로이웃받은 횟수(미확인건)
	/*@RequestMapping (value="cntR_2Fol.do",method={RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public int cntR_2Fol( HttpServletRequest request, Model model) throws Exception{
			logger.info("환영합니다. cntR_2Fol.do 실행중");

			//'로그인 한 사람' 정보 취득
			String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
			logger.info(id + "?? ");

			//서로이웃받은 횟수
			int cnt2Fol = sistFriendService.cntR_2Fol(id); 

			return cnt2Fol;
		}*/

	//로그인박스,이웃블로그 이웃목록div
	@RequestMapping (value="friendBlogDiv.do",method={RequestMethod.GET,RequestMethod.POST})
	public String friendBlogDiv(HttpServletRequest request,SistFriendParamVO param,Model model)throws Exception{
		logger.info("환영합니다. friendBlogDiv.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();

		//그룹조회
		List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
		glist = sistFriendService.getGroups(id);
		model.addAttribute("glist", glist);

		List<SistFriendVO> flist = sistFriendService.getFriendPagingList(param);
		System.out.println(param);
		model.addAttribute("flist", flist);

		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
	

		return "friendBlogDiv.tiles";
	}


	//로그인박스 서로이웃신청수
	@RequestMapping (value="alertCntDblFol.do",method={RequestMethod.GET,RequestMethod.POST})
	public String alertCntDblFol(HttpServletRequest request, Model model)throws Exception{
		logger.info("환영합니다. alertCntDblFol.do 실행중");

		//'로그인 한 사람' 정보 취득
		String id = ((SistMemberVO)request.getSession().getAttribute("login")).getM_id();
		logger.info(id + "?? ");
		int cnt=sistFriendService.cntR_2Fol(id);
		System.out.println(cnt);
		model.addAttribute("cnt", cnt);

		return "alertCntDblFol.tiles";
	}


}
