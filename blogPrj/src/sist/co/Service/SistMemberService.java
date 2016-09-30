package sist.co.Service;

import java.util.HashMap;
import java.util.List;

import sist.co.Model.SistBlog;
import sist.co.Model.SistCategory;
import sist.co.Model.SistMemberVO;
import sist.co.Model.SistMessage;

public interface SistMemberService {
	 
	//로그인
	SistMemberVO login(SistMemberVO member)throws Exception;
	
	//회원가입
	boolean insertMember(SistMemberVO membervo) throws Exception;
	
	int getId(SistMemberVO vo) throws Exception;
	
	void createTable(HashMap map);
	
	void updateActionMember(String m_id);
	
	SistMemberVO idUsePhone(SistMemberVO vo)throws Exception;
	
	SistMemberVO idUseEmail(SistMemberVO vo) throws Exception;
	
	SistMemberVO pwUsePhone(SistMemberVO vo) throws Exception;
	
	SistMemberVO pwUseEmail(SistMemberVO vo) throws Exception;
	
	void changeName(SistMemberVO vo) throws Exception;
	
	SistMemberVO selectId(SistMemberVO vo) throws Exception;
	
	void changeEmail(SistMemberVO vo) throws Exception;
	
	void changePhone(SistMemberVO vo) throws Exception;
	
	void myProfile(SistMemberVO vo) throws Exception;
	
	void changePW(SistMemberVO vo) throws Exception;
	
	int checkPw(SistMemberVO vo) throws Exception;
	
	int countMyMessage(SistMessage sm ) throws Exception;
	
	List selectNewMessage(SistMessage sm) throws Exception;
	
	
	SistMessage detailMessage(int message_seq) throws Exception;
	
	void updateMessageRead(int message_seq) throws Exception;
	
	void deleteMessage(int message_seq) throws Exception;
	
	void sendMessageAF(SistMessage sm) throws Exception;
	
	List getPointChargePageList (SistMessage sm) throws Exception;
	
	void allDelteMessage (SistMessage sm) throws Exception;
	
	void seeAllMessage (SistMessage sm) throws Exception;
	
	List selectAllMessage(SistMessage sm) throws Exception;

	
	void insertBlog(SistBlog sb) throws Exception;
	
	void updateBlog(SistBlog sb) throws Exception;
	
	//hongma: cateogry
	void insertCategory (SistCategory sc) throws Exception;
	
	List<SistCategory> selectCategory (SistCategory sc ) throws Exception;
	
	void insertElseCategory (SistCategory sc) throws Exception;
	
	void insertChildCategory (SistCategory sc) throws Exception;
	
	SistCategory selectOneCategory (int ca_seq) throws Exception;
	
	void deleteOneCategory (int ca_seq) throws Exception;
	
	int countChild (int ca_seq) throws Exception;
	
	List<SistCategory> selectAllChildCategory (int ca_seq) throws Exception;
	
	void updateParentCategory (SistCategory sc) throws Exception;
	
	void updateToParentCategory (SistCategory sc) throws Exception;
	
	void updateAnotherChild (SistCategory sc) throws Exception;

	void updateToChildCategory (SistCategory sc) throws Exception;
	
	
	//ssunhj: getmember
	SistMemberVO getmember(String m_id)throws Exception;
	
	
	//ajax paing
	List<SistMessage> selectMessagePaging (SistMessage sm) throws Exception;

}