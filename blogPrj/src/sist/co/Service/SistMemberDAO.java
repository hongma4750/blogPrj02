package sist.co.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}