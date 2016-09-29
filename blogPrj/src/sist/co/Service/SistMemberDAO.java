package sist.co.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistBlog;
import sist.co.Model.SistCategory;
import sist.co.Model.SistMemberVO;
import sist.co.Model.SistMessage;

@Repository
public class SistMemberDAO {
 
	@Autowired	//DI
	private SqlSession sqlSession;		//DI가 무엇인가~?   new 생성자를 생략할수있습니다
	
	private String ns = "SistMember.";
	
	
	public SistMemberVO login(SistMemberVO member) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"login", member);
	}

	public boolean insertMember(SistMemberVO membervo) throws Exception{
		sqlSession.insert(ns+"insertMember", membervo);
		return true;
		
	}
	
	public int getId(SistMemberVO vo) throws Exception {
		return (int)sqlSession.selectOne(ns+"getId", vo);
	}
	
	public void createTable(HashMap map){
		sqlSession.update(ns+"createTable",map);
	}
	
	public void updateActionMember(String m_id){
		sqlSession.update(ns+"updateActionMember",m_id);
	}
	
	public SistMemberVO idUsePhone(SistMemberVO vo) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"idUsePhone",vo);
	}
	
	public SistMemberVO idUseEmail(SistMemberVO vo) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"idUseEmail",vo);
	}
	
	public SistMemberVO pwUsePhone(SistMemberVO vo) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"pwUsePhone",vo);
	}
	
	public SistMemberVO pwUseEmail(SistMemberVO vo) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"pwUseEmail",vo);
	}
	
	public void changeName(SistMemberVO vo) throws Exception{
		sqlSession.update(ns+"changeName",vo);
	}
	
	public SistMemberVO selectId(SistMemberVO vo) throws Exception{
		return (SistMemberVO) sqlSession.selectOne(ns+"selectId",vo);
	}
	
	public void changeEmail(SistMemberVO vo) throws Exception {
		sqlSession.update(ns+"changeEmail",vo);
	}
	
	public void changePhone(SistMemberVO vo) throws Exception {
		sqlSession.update(ns+"changePhone",vo);
	}
	
	public void myProfile(SistMemberVO vo) throws Exception {
		sqlSession.update(ns+"myProfile",vo);
	}
	
	public void changePW(SistMemberVO vo) throws Exception{
		sqlSession.update(ns+"changePW",vo);
	}
	
	public int checkPw(SistMemberVO vo) throws Exception{
		return (int) sqlSession.selectOne(ns+"checkPw",vo);
	}
	
	public int countMyMessage(SistMessage sm ) throws Exception{
		return (int) sqlSession.selectOne(ns+"countMyMessage",sm);			
	}
	
	public List selectNewMessage(SistMessage sm) throws Exception{
		List<SistMessage> myNewMessage = new ArrayList<SistMessage>();
		myNewMessage = sqlSession.selectList(ns+"selectNewMessage",sm);
		return myNewMessage;
	}
	
	
	
	public List selectAllMessage(SistMessage sm) throws Exception{
		return sqlSession.selectList(ns+"selectAllMessage",sm);
	}
	
	public void sendMessageAF(SistMessage sm) throws Exception{
		sqlSession.insert(ns+"sendMessageAF",sm);
	}
	
	public SistMessage detailMessage(int message_seq) throws Exception{
		return sqlSession.selectOne(ns+"detailMessage",message_seq);
	}
	
	public void updateMessageRead(int message_seq) throws Exception{
		sqlSession.update(ns+"updateMessageRead",message_seq);
	}
	
	public void deleteMessage(int message_seq) throws Exception{
		sqlSession.update(ns+"deleteMessage",message_seq);
	}
	
	public List<SistMessage> getPointChargePageList(SistMessage sm) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageList",sm);
	}
	
	public void allDelteMessage (SistMessage sm) throws Exception{
		sqlSession.update(ns+"allDelteMessage",sm);
	}
	
	public void seeAllMessage (SistMessage sm) throws Exception{
		sqlSession.update(ns+"seeAllMessage",sm);
	}
	
	public void insertBlog(SistBlog vo) throws Exception{
		sqlSession.insert(ns+"insertBlog",vo);
	}
	
	public void updateBlog(SistBlog sb) throws Exception{
		sqlSession.update(ns+"updateBlog",sb);
	}
	
	//hongma: 카테고리
	public void insertCategory (SistCategory sc) throws Exception{
		sqlSession.insert(ns+"insertCategory",sc);
	}
	
	public List<SistCategory> selectCategory (SistCategory sc ) throws Exception{
		return sqlSession.selectList(ns+"selectCategory",sc);
	}
	
	public void insertElseCategory (SistCategory sc) throws Exception{
		sqlSession.insert(ns+"insertElseCategory",sc);
	}
	
	public void insertChildCategory (SistCategory sc) throws Exception{
		sqlSession.insert(ns+"insertChildCategory",sc);
	}
	
	public SistCategory selectOneCategory (int ca_seq) throws Exception{
		return sqlSession.selectOne(ns+"selectOneCategory",ca_seq);
	}
	
	public void deleteOneCategory (int ca_seq) throws Exception{
		sqlSession.delete(ns+"deleteOneCategory", ca_seq);
	}
	
	public int countChild (int ca_seq) throws Exception{
		return sqlSession.selectOne(ns+"countChild",ca_seq);
	}
	
	public List<SistCategory> selectAllChildCategory (int ca_seq) throws Exception{
		return sqlSession.selectList(ns+"selectAllChildCategory",ca_seq);
	}
	
	public void updateParentCategory (SistCategory sc) throws Exception{
		sqlSession.update(ns+"updateParentCategory",sc);
	}
	
	public void updateToParentCategory (SistCategory sc) throws Exception{
		sqlSession.update(ns+"updateToParentCategory",sc);
	}
	
	public void updateAnotherChild (SistCategory sc) throws Exception{
		sqlSession.update(ns+"updateAnotherChild",sc);
	}
	
	public void updateToChildCategory (SistCategory sc) throws Exception{
		sqlSession.update(ns+"updateToChildCategory",sc);
	}
	
	
	//ssunhj: getmember
	public SistMemberVO getmember(String m_id)throws Exception{
		//SistMemberVO memvo = new SistMemberVO();
		return (SistMemberVO) sqlSession.selectOne(ns+"getmember",m_id);
		
	}
	
	public List<SistMessage> selectMessagePaging (SistMessage sm) throws Exception{
		return sqlSession.selectList(ns+"selectMessagePaging",sm);
	}
		

		
		
	
}