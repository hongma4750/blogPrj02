package sist.co.Controller;


import java.io.File;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.List;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/*import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.DefaultTextProducer;*/
import sist.co.Model.FUpUtil;
import sist.co.Model.SendEmail;
import sist.co.Model.SistMemberVO;
import sist.co.Model.SistMessage;
import sist.co.Model.YesMember;
import sist.co.Service.SistMemberService;



@Controller
public class SistMemberController { 
	
	private static final Logger logger = LoggerFactory.getLogger(SistMemberController.class);
	 
	@Autowired
	SistMemberService sistMemberService;

	@RequestMapping(value="index.do",method=RequestMethod.GET)
	public String index(Model model){
		logger.info("환영합니다. index.do 실행중");
		return "index.tiles";
	}
	
	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) throws Exception{
		logger.info("현재 login.do 실행중");
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(512);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);
		
		
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAF.do",method=RequestMethod.POST)
	public String loginAF(SistMemberVO vo, HttpServletRequest request, Model model) throws Exception{
		logger.info("loginAF.do 실행중");
		
		//비밀번호 복호화
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__");
		
		if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
        	String password = decryptRsa(privateKey, vo.getM_pw());
            
        	System.out.println("pw : "+password);
        	vo.setM_pw(getMD5(password));

        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
        
        // --hj: id, pw 들어옴. 이상없음
        //-- db sal문 이상없음
        //hj: 복호화 과정에서 문젠가..
		SistMemberVO memvo = sistMemberService.login(vo);
		System.out.println("memvo:"+memvo); //----hj: 이거 null나온다
		int count = sistMemberService.getId(vo); // --hj:count는 1이라고 제대로 나옴
		
		String no_login="회원의 아이디가 비활성화 상태이거나 등록되지 않은 아이디 입니다.";
		
		if(count>0){
			if(memvo == null){
				request.getSession().setAttribute("no_login", no_login);
				return "redirect:login.do";
			}else{
				request.getSession().setAttribute("login", memvo);
				
				//DAO 작업!!!그리고 등록!!!!
				
				//SistMessage 선언
				SistMessage sm = new SistMessage();
				sm.setMessage_receiver(vo.getM_id());		//sistmember 인스턴스의 id를 sistmessage receiver로 등록한다.
				
				//메세지 숫자 계산
				int myMessageCount = sistMemberService.countMyMessage(sm);	//receiver == 로그인 아이디 and read != 1(읽지않음) and del != 1 (삭제x)
				
				//메세지 리스트
				List<SistMessage> newMyMessageList = sistMemberService.selectNewMessage(sm);
				
				//세션에 등록		--> 이후 매초마다 새로운걸로 갱신해야됨
				request.getSession().setAttribute("myMessageCount", myMessageCount);
				request.getSession().setAttribute("newMyMessageList", newMyMessageList);
				
				return "redirect:index.do";
			}
		}else{
			no_login="등록되지 않은 아이디 입니다.";
			request.getSession().setAttribute("no_login", no_login);
			return "redirect:login.do";
		}
		
		
	}
	
	@RequestMapping(value="regi.do",method=RequestMethod.GET)
	public String regi(HttpServletRequest request, Model model) throws Exception{
		logger.info("regi.do 실행중");
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(512);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);
		
		
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAF.do",method=RequestMethod.POST)
	public String regiAF(HttpServletRequest request,SistMemberVO vo, Model model) throws Exception{
		logger.info("regiAF.do 실행중");

		String b_year = request.getParameter("b_year");
		String b_month = request.getParameter("b_month");
		String b_day = two(request.getParameter("b_day"));
		
		String m_birthday = b_year+b_month+b_day;

		vo.setM_birthday(m_birthday);
		
		//비밀번호 복호화
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__");
		
		if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
        	String password = decryptRsa(privateKey, vo.getM_pw());
            
        	System.out.println("pw : "+password);
        	vo.setM_pw(getMD5(password));
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }

		sistMemberService.insertMember(vo);
		
		SendEmail send = new SendEmail(vo.getM_id(), vo.getM_email());
		

		return "index.tiles";
	}
	
	
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model){
		logger.info("logout.do 실행중 ");
		
		request.getSession().invalidate();
		
		return "index.tiles";
	}
	
	@RequestMapping(value="idfind.do",method=RequestMethod.GET)
	public String idfind(HttpServletRequest request, Model model){
		logger.info("idfind.do 실행중");
		
		String menu = request.getParameter("menu");
		model.addAttribute("menu",menu);
		return "idfind.tiles";
	}
	
	@RequestMapping(value="find_id_ok.do", method=RequestMethod.GET)
	public String find_id_ok(HttpServletRequest request, Model model){
		logger.info("find_id_ok.do 실행중");
		
		String menu = request.getParameter("menu");
		model.addAttribute("menu",menu);
		
		return "find_id_ok.tiles";
	}
	
	@RequestMapping(value="pwfind.do", method=RequestMethod.GET)
	public String pwfind(HttpServletRequest request, Model model){
		logger.info("pwfind.do 실행중");
		
		String menu = request.getParameter("menu");
		
		
		model.addAttribute("menu",menu);
		
		return "pwfind.tiles";
	}
	
	@RequestMapping(value="find_pw_se.do", method=RequestMethod.GET)
	public String find_pw_se(HttpServletRequest request, Model model) throws Exception{
		logger.info("find_pw_se.do 실행중");
		
		String menu = request.getParameter("menu");
		String m_id = request.getParameter("m_id");
		
		model.addAttribute("menu",menu);
		model.addAttribute("m_id",m_id);
	
	
		return "find_pw_se.tiles";
	}
	
	@RequestMapping(value="find_pw_ok.do", method=RequestMethod.GET)
	public String find_pw_ok(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception{
		logger.info("find_pw_ok.do 실행중");
		
		String menu = request.getParameter("menu");
		model.addAttribute("menu",menu);
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(512);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);


		return "find_pw_ok.tiles";
	}
	
	@RequestMapping(value="changePW.do", method=RequestMethod.POST)
	public String changePW(HttpServletRequest request, Model model, SistMemberVO vo) throws Exception{
		logger.info("changePW 실행중");
		
		
		
		//비밀번호 복호화
				HttpSession session = request.getSession();
				PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
				session.removeAttribute("__rsaPrivateKey__");
				
				if (privateKey == null) {
		            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		        }
		        try {
		        	String password = decryptRsa(privateKey, vo.getM_pw());
		            
		        	System.out.println("pw : "+password);
		        	vo.setM_pw(getMD5(password));
		        } catch (Exception ex) {
		            throw new ServletException(ex.getMessage(), ex);
		        }
		        
		        
		 //비밀번호 변경
		        System.out.println("id = "+vo.getM_id()+" , pw = "+vo.getM_pw());
		        sistMemberService.changePW(vo);       
		        
		 return "index.tiles";
		
	}
	

	@RequestMapping(value="myPage.do", method=RequestMethod.GET)
	public String myPage(Model model){
		logger.info("myPage.do 실행중");
		
		return "myPage.tiles";
	}
	
	@RequestMapping(value="myProfile.do", method=RequestMethod.GET)
	public String myProfile(Model model){
		logger.info("myProfile.do 실행중");
		
		return "myProfile.tiles";
	}
	
	@RequestMapping(value="myInfo.do", method=RequestMethod.GET)
	public String myInfo(Model model){
		logger.info("myInfo.do 실행중");
		
		return "myInfo.tiles";
	}
	
	@RequestMapping(value="userInfo.do",method=RequestMethod.GET)
	public String userInfo(Model model){
		logger.info("userInfo.do 실행중");
		
		return "userInfo.tiles";
	}
	
	@RequestMapping(value="blogInfo.do",method=RequestMethod.GET)
	public String blogInfo(Model model){
		logger.info("blogInfo.do 실행중");
		
		return "blogInfo.tiles";
	}
	
	
	@RequestMapping(value="idUsePhone.do",method=RequestMethod.GET)
	@ResponseBody
	public YesMember idUsePhone(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("idUsePhone.do 실행중");

		SistMemberVO vos = sistMemberService.idUsePhone(vo);
		
		YesMember yes = new YesMember();
		
		if(vos != null){
			yes.setMessage("Suc");
			request.getSession().setAttribute("find_user_id",vos);
		}else {
			yes.setMessage("Fai");
		}
		
		return yes;
	}
	
	@RequestMapping(value="idUseEmail.do",method=RequestMethod.GET)
	@ResponseBody
	public YesMember idUseEmail(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("idUseEmail 실행중");
		
		SistMemberVO vos = sistMemberService.idUseEmail(vo);
		
		YesMember yes = new YesMember();
		
		if(vos != null){
			yes.setMessage("Suc");

			String my_confirmNum = request.getParameter("my_confirmNum");
			System.out.println("my_confirmNum = "+my_confirmNum);
			
			request.getSession().setAttribute("find_user_id",vos);
			
			
			//이메일 전송
			
			SendEmail send = new SendEmail(my_confirmNum, vo.getM_email(),0);
			
			
		}else {
			yes.setMessage("Fai");
		}
		
		return yes;
		
		
	}
	
	@RequestMapping(value="pwUsePhone.do",method=RequestMethod.GET)
	@ResponseBody
	public YesMember pwUsePhone(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("pwUsePhone.do 실행");
		
		SistMemberVO vos = sistMemberService.pwUsePhone(vo);
		
		YesMember yes = new YesMember();
		
		if(vos != null){
			yes.setMessage("Suc");
			request.getSession().setAttribute("find_user_pw",vos);	
		}else {
			yes.setMessage("Fai");
		}
		
		return yes;
		
	}
	
	@RequestMapping(value="pwUseEmail.do",method=RequestMethod.GET)
	@ResponseBody
	public YesMember pwUseEmail(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("pwUseEmail 실행중");
		
		SistMemberVO vos = sistMemberService.pwUseEmail(vo);
		
		YesMember yes = new YesMember();
		
		if(vos != null){
			yes.setMessage("Suc");

			String my_confirmNum = request.getParameter("my_confirmNum");
			System.out.println("my_confirmNum = "+my_confirmNum);
			
			request.getSession().setAttribute("find_user_pw",vos);
			
			//이메일 전송
			
			SendEmail send = new SendEmail(my_confirmNum, vo.getM_email(),1);

		}else {
			yes.setMessage("Fai");
		}
		
		return yes;
		
	}
	
	
	
	@RequestMapping(value="changeName.do",method=RequestMethod.GET)
	public String changeName(SistMemberVO vo , HttpServletRequest request, Model model) throws Exception{
		logger.info("changeName실행");
		
		
		sistMemberService.changeName(vo);
		SistMemberVO vos = sistMemberService.selectId(vo);
		
		request.getSession().setAttribute("login", vos);
		
		return "myInfo.tiles";

	}
	
	@RequestMapping(value="changeEmail.do",method=RequestMethod.GET)
	public String changeEmail(SistMemberVO vo, HttpServletRequest request, Model model) throws Exception{
		logger.info("changeEmail실행");
		
		
		sistMemberService.changeEmail(vo);
		SistMemberVO vos = sistMemberService.selectId(vo);
		
		request.getSession().setAttribute("login", vos);
		
		return "myInfo.tiles";
	}
	
	@RequestMapping(value="changePhone.do",method=RequestMethod.GET)
	public String changePhone(SistMemberVO vo, HttpServletRequest request, Model model) throws Exception{
		logger.info("changePhone실행");
		
		
		sistMemberService.changePhone(vo);
		SistMemberVO vos = sistMemberService.selectId(vo);
		
		request.getSession().setAttribute("login", vos);
		
		return "myInfo.tiles";
		
	}
	
	
	@RequestMapping(value="myProfile.do",method=RequestMethod.POST)
	public String myProfile(SistMemberVO vo, HttpServletRequest request,
			@RequestParam(value="fileload", required=false)
			MultipartFile fileload, Model model) throws Exception {
		logger.info("myProfile 실행중");
		
		
			vo.setM_photo(fileload.getOriginalFilename());
			
			String fupload = request.getServletContext().getRealPath("/upload");
			logger.info("fupload : " + fupload);
			
			String f = vo.getM_photo();
			
				
			String newFile = FUpUtil.getNewFile(f);
			
			String savePath = fupload+"/"+newFile;
			String[] ex = savePath.split("wtpwebapps");
			
			logger.info(fupload+ "/" + newFile);
			
			vo.setM_photo(ex[1]);
			
			try{		
				File file = new File(fupload+ "/" + newFile);		
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	
				sistMemberService.myProfile(vo);
				logger.info("pdsupload success");
				
			}catch(IOException e){
				logger.info("pdsupload fail!");
			}
			
			SistMemberVO vos = sistMemberService.selectId(vo);
			request.getSession().setAttribute("login", vos);
			
			return "myPage.tiles";
	}
	
	@RequestMapping(value="myPw.do",method=RequestMethod.GET)
	public String myPw(HttpServletRequest request, Model model) throws Exception{
		logger.info("myPw 실행중");
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(512);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);

		return "myPw.tiles";
	}
	
	@RequestMapping(value="checkPw.do",method=RequestMethod.POST)
	@ResponseBody
	public YesMember checkPw(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("checkPW.do 실행중");
		
		
		//비밀번호 복호화
				HttpSession session = request.getSession();
				PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
				
				
				if (privateKey == null) {
		            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		        }
		        try {
		        	String password = decryptRsa(privateKey, vo.getM_pw());
		            
		        	System.out.println("pw : "+password);
		        	vo.setM_pw(getMD5(password));
		        } catch (Exception ex) {
		            throw new ServletException(ex.getMessage(), ex);
		        }
		        
		        System.out.println("id = "+vo.getM_id()+" , pw = "+vo.getM_pw());
		        int count = sistMemberService.checkPw(vo);
				
				YesMember yes = new YesMember();
				
				if(count > 0 ){
					yes.setMessage("Suc");
				}else {
					yes.setMessage("Fai");
				}
				
				return yes;
       
	}
	
	@RequestMapping(value="finalChange.do",method=RequestMethod.POST)
	public String finalChange(HttpServletRequest request, SistMemberVO vo, Model model) throws Exception{
		logger.info("finalChange.do 실행중");
		
		//비밀번호 복호화
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		
		
		if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
        	String password = decryptRsa(privateKey, vo.getM_pw());
            
        	System.out.println("pw : "+password);
        	vo.setM_pw(getMD5(password));
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
        
        sistMemberService.changePW(vo);
        
        return "index.tiles";
		
	}
	
	@RequestMapping(value="checkNewMessage.do", method=RequestMethod.GET)
	@ResponseBody
	public int checkNewMessage(HttpServletRequest request, SistMemberVO vo , Model model) throws Exception{
		logger.info("checkNewMessage.do 이동중");
		
		SistMessage sm = new SistMessage();
		sm.setMessage_receiver(request.getParameter("m_id"));
		
		System.out.println("id = "+vo.getM_id());
		
		int checkMyNewMessage = sistMemberService.countMyMessage(sm);
		
		System.out.println("newMessage count : "+checkMyNewMessage);
		return checkMyNewMessage;

	}
	
	
	@RequestMapping(value="sendMessage.do",method={RequestMethod.GET,RequestMethod.POST})
	public String sendMessage(HttpServletRequest request, Model model) throws Exception {
		logger.info("sendMessage.do 실행중");
		
		String fndid = request.getParameter("fndid");
		
		System.out.println("fndid : "+fndid);
		
		SistMemberVO vo = new SistMemberVO();
		vo.setM_id(fndid);
		
		SistMemberVO fndInfo = sistMemberService.selectId(vo);
		
		
		model.addAttribute("fndInfo",fndInfo);
		return "sendMessage.tiles";
	}
	
	@RequestMapping(value="sendMessageAF.do",method={RequestMethod.GET,RequestMethod.POST})
	public void sendMessageAF(SistMessage sm, Model model) throws Exception {
		logger.info("sendMessageAF.do 실행중");
		
		System.out.println("sender : "+sm.getMessage_sender()+" , receiver : "+sm.getMessage_receiver());
		
		
		sistMemberService.sendMessageAF(sm);
		
	}
	
	@RequestMapping(value="changeNewMessage.do", method=RequestMethod.GET)
	@ResponseBody
	public void changeNewMessage(HttpServletRequest request, SistMemberVO vo , Model model) throws Exception{
		logger.info("checkNewMessage.do 이동중");
		
		SistMessage sm = new SistMessage();
		sm.setMessage_receiver(request.getParameter("m_id"));
		
		System.out.println("id = "+vo.getM_id());
		
		int myMessageCount = sistMemberService.countMyMessage(sm);
		//메세지 리스트
		List<SistMessage> newMyMessageList = sistMemberService.selectNewMessage(sm);
		
		//세션에 등록		--> 이후 매초마다 새로운걸로 갱신해야됨
		request.getSession().setAttribute("myMessageCount", myMessageCount);
		request.getSession().setAttribute("newMyMessageList", newMyMessageList);
	}
	
	
	
	

	
	
	
	
	
	
	
	
	public String two(String msg){
		return msg.length()>2? msg:"0"+msg;
	}
	
	@RequestMapping(value="getId.do", method=RequestMethod.POST)
	@ResponseBody
	public YesMember getID(SistMemberVO vo , Model model) throws Exception{
		logger.info("getID.do 이동중");
		
		System.out.println("m_id = "+vo.getM_id());
		
		int count = sistMemberService.getId(vo);
		
		YesMember yes = new YesMember();
		
		if(count > 0 ){
			yes.setMessage("Suc");
		}else {
			yes.setMessage("Fai");
		}
		
		return yes;
		
	}
	
	@RequestMapping(value="sendemail.do", method=RequestMethod.GET)
	public String sendemail(HttpServletRequest request, Model model){
		logger.info("sendemail.do 실행중");
		
		String m_id = request.getParameter("m_id");
		
		sistMemberService.updateActionMember(m_id);
		
		return "index.tiles";
	}
	
	//전달 받은 암호화된 비밀번호 복호화
	 private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
	        System.out.println("will decrypt : " + securedValue);
	        Cipher cipher = Cipher.getInstance("RSA");
	        byte[] encryptedBytes = hexToByteArray(securedValue);
	        cipher.init(Cipher.DECRYPT_MODE, privateKey);
	        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
	        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
	        return decryptedValue;
	    }
	 
	 public static byte[] hexToByteArray(String hex) {
	        if (hex == null || hex.length() % 2 != 0) {
	            return new byte[]{};
	        }

	        byte[] bytes = new byte[hex.length() / 2];
	        for (int i = 0; i < hex.length(); i += 2) {
	            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
	            bytes[(int) Math.floor(i / 2)] = value;
	        }
	        return bytes;
	    }
	 
	//전달 받은 암호화된 비밀번호 복호화
	 
	 
	 //디비 넣을때 암호화
	 private String getMD5( String strVal ){
		 StringBuffer sb = new StringBuffer();
	  try{
	   byte[] digest = java.security.MessageDigest.getInstance("MD5").digest( strVal.getBytes() );
	   sb.setLength(0);
		   for( int i = 0; i < digest.length; i++ ) { 
		    sb.append( Integer.toString( ( digest[i] & 0xf0) >> 4, 16 ) ); 
		    sb.append( Integer.toString( digest[i] & 0x0f, 16 ) );
		   }
	   return sb.toString();
	  }catch( Exception ex ){
	   return "";
	  }
	  
	 }
	 
	
	
	
}