package sist.co.Service.Imple;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.Model.SistBlog;
import sist.co.Model.SistMemberVO;
import sist.co.Model.SistMessage;
import sist.co.Service.SistMemberDAO;
import sist.co.Service.SistMemberService;

 


@Service
public class SistMemberImpl implements SistMemberService{

	@Autowired 
	SistMemberDAO sistMemberDAO;

	@Override
	@Transactional(readOnly=true)		//읽기전용 세팅
	public SistMemberVO login(SistMemberVO member) throws Exception {
		return sistMemberDAO.login(member);
	}

	@Override
	public boolean insertMember(SistMemberVO membervo) throws Exception {
		
		return sistMemberDAO.insertMember(membervo);
	}
	@Override
	public void createTable(HashMap map) {
		sistMemberDAO.createTable(map);
		
	}

	@Override
	public int getId(SistMemberVO vo) throws Exception{
		// TODO Auto-generated method stub
		return sistMemberDAO.getId(vo);
	}

	@Override
	public void updateActionMember(String m_id) {
		// TODO Auto-generated method stub
		sistMemberDAO.updateActionMember(m_id);
	}

	@Override
	public SistMemberVO idUsePhone(SistMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sistMemberDAO.idUsePhone(vo);
	}

	@Override
	public SistMemberVO idUseEmail(SistMemberVO vo) throws Exception {

		return sistMemberDAO.idUseEmail(vo);
	}

	@Override
	public SistMemberVO pwUsePhone(SistMemberVO vo) throws Exception {
		return sistMemberDAO.pwUsePhone(vo);
	}

	@Override
	public SistMemberVO pwUseEmail(SistMemberVO vo) throws Exception {
		return sistMemberDAO.pwUseEmail(vo);
	}

	@Override
	public void changeName(SistMemberVO vo) throws Exception {
		sistMemberDAO.changeName(vo);
	}

	@Override
	public SistMemberVO selectId(SistMemberVO vo) throws Exception {
		return sistMemberDAO.selectId(vo);
	}

	@Override
	public void changeEmail(SistMemberVO vo) throws Exception {
		sistMemberDAO.changeEmail(vo);
	}

	@Override
	public void changePhone(SistMemberVO vo) throws Exception {
		sistMemberDAO.changePhone(vo);
	}

	@Override
	public void myProfile(SistMemberVO vo) throws Exception {
		sistMemberDAO.myProfile(vo);
	}

	@Override
	public void changePW(SistMemberVO vo) throws Exception {
		sistMemberDAO.changePW(vo);
	}

	@Override
	public int checkPw(SistMemberVO vo) throws Exception {
		
		return (int) sistMemberDAO.checkPw(vo);
	}

	@Override
	public int countMyMessage(SistMessage sm) throws Exception {
		return (int) sistMemberDAO.countMyMessage(sm);
	}

	@Override
	public List selectNewMessage(SistMessage sm) throws Exception {
		// TODO Auto-generated method stub
		return sistMemberDAO.selectNewMessage(sm);
	}
	
	
	
	
	
	
	
	
	@Override
	public List selectAllMessage(SistMessage sm) throws Exception {
		return sistMemberDAO.selectAllMessage(sm);
	}

	@Override
	public void sendMessageAF(SistMessage sm) throws Exception {
		sistMemberDAO.sendMessageAF(sm);
	}
	
	@Override
	public SistMessage detailMessage(int message_seq) throws Exception {
		// TODO Auto-generated method stub
		return sistMemberDAO.detailMessage(message_seq);
	}
	
	@Override
	public void updateMessageRead(int message_seq) throws Exception {
		sistMemberDAO.updateMessageRead(message_seq);
		
	}
	
	@Override
	public void deleteMessage(int message_seq) throws Exception {
		sistMemberDAO.deleteMessage(message_seq);
		
	}

	@Override
	public List getPointChargePageList(SistMessage sm) throws Exception {
		// TODO Auto-generated method stub
		return sistMemberDAO.getPointChargePageList(sm);
	}
	@Override
	public void allDelteMessage(SistMessage sm) throws Exception {
		sistMemberDAO.allDelteMessage(sm);
		
	}
	
	@Override
	public void seeAllMessage(SistMessage sm) throws Exception {
		sistMemberDAO.seeAllMessage(sm);
		
	}
	
	@Override
	public void insertBlog(SistBlog sb) throws Exception {
		sistMemberDAO.insertBlog(sb);
		
	}
	
	@Override
	public void updateBlog(SistBlog sb) throws Exception {
		sistMemberDAO.updateBlog(sb);
		
	}

	
	
	
	
	
	
	

	
	//ssunhj: getmember
		@Override
		public SistMemberVO getmember(String m_id) throws Exception {
			return sistMemberDAO.getmember(m_id);
		}

		

		

		

		
		

		

		

		

	
	
	
}