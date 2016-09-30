package sist.co.Service.Imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import sist.co.Model.SistBlog;

import sist.co.Model.SistBlogDTO;

import sist.co.Model.SistDblFollowingVO;
import sist.co.Model.SistFgroupVO;
import sist.co.Model.SistFriendParamVO;
import sist.co.Model.SistFriendVO;
import sist.co.Model.SistFsettingVO;
import sist.co.Model.SistMemberVO;
import sist.co.Service.SistFriendDAO;
import sist.co.Service.SistFriendService;

@Service
public class SistFriendImpl implements SistFriendService {
	
	@Autowired
	SistFriendDAO sistFriendDAO;

	//이웃수
	@Override
	@Transactional
	public int cntfriend(String myid) throws Exception {
		return sistFriendDAO.cntfriend(myid);
	}

	//이웃 한명
	@Override
	@Transactional
	public SistFriendVO getFriend(String myid) throws Exception {

		return sistFriendDAO.getFriend(myid);
	}

	//전체 이웃들 정보가져오기	
	@Override
	@Transactional
	public List<SistFriendVO> getFriends(String myid) throws Exception {

		return sistFriendDAO.getFriends(myid);
	}
	
	//이웃만 
	@Override
	public List<SistFriendVO> get1FolFriends(String myid) throws Exception {
		return sistFriendDAO.get1FolFriends(myid);
	}
	
	//서로이웃만 
	@Override
	public List<SistFriendVO> get2FolFriends(String myid) throws Exception {
		return sistFriendDAO.get2FolFriends(myid);
	}

	//해당 이웃의 이웃
	@Override
	@Transactional
	public List<SistFriendVO> gettheFofFriends(SistFriendVO fnd) throws Exception {

		return sistFriendDAO.gettheFofFriends(fnd);
	}

	//모든 이웃의 이웃(myid로추출)
	@Override
	@Transactional
	public List<SistFriendVO> getAllFofFriends(String myid) throws Exception {

		return sistFriendDAO.getAllFofFriends(myid);
	}

	//그룹조회
	@Override
	@Transactional
	public List<SistFgroupVO> getGroups(String myid) throws Exception {

		return sistFriendDAO.getGroups(myid);
	}

	//그룹추가
	@Override
	@Transactional
	public boolean addGroup(SistFgroupVO group) throws Exception {

		return sistFriendDAO.addGroup(group);
	}

	//그룹이동
	@Override
	@Transactional
	public boolean moveGroup(SistFriendVO friend) throws Exception {
		return sistFriendDAO.moveGroup(friend);
	}

	//친구추가
	@Override
	@Transactional
	public boolean addFriend(SistFriendVO friend) throws Exception {

		return sistFriendDAO.addFriend(friend);
	}
	
	//이웃삭제
	@Override
	@Transactional
	public boolean delFriend(SistFriendVO friend) throws Exception {
		return sistFriendDAO.delFriend(friend);
	}

	//서로이웃팔로잉추가
	@Override
	@Transactional
	public boolean addDblFollowing(SistDblFollowingVO dblfol) throws Exception {
		return sistFriendDAO.addDblFollowing(dblfol);
	}

	//내가받은 서로이웃신청 조회
	@Override
	@Transactional
	public List<SistDblFollowingVO> getReceiveDblFols(String myid) throws Exception {
		return sistFriendDAO.getReceiveDblFols(myid);
	}

	//내가 보낸 서로이웃신청 조회
	@Override
	@Transactional
	public List<SistDblFollowingVO> getSendDblFols(String myid) throws Exception {
		return sistFriendDAO.getSendDblFols(myid);
	}

	//서로이웃 신청 취소
	@Override
	@Transactional
	public boolean delsendfol(int seq) throws Exception {
		
		return sistFriendDAO.delsendfol(seq);
	}

	//서로이웃 수락
	@Override
	@Transactional
	public boolean acceptDblFols(int seq) throws Exception {
		return sistFriendDAO.acceptDblFols(seq);
	}

	//팔로잉조회
	@Override
	@Transactional
	public SistDblFollowingVO get2fol(int seq) throws Exception {
	
		return sistFriendDAO.get2fol(seq);
	}

	//hongma:
	@Override
	public SistBlog selectBlog(String m_id) throws Exception {
		return sistFriendDAO.selectBlog(m_id);
	}


	//getGroupbyFriends
	@Override
	@Transactional
	public List<SistFriendVO> getGroupbyFriends(String m_id) throws Exception {
		return sistFriendDAO.getGroupbyFriends(m_id);
	}
	
	//서로이웃신청 수
	@Override
	@Transactional
	public int cntR_2Fol(String m_id) throws Exception {
		return sistFriendDAO.cntR_2Fol(m_id);
	}

	//모든블로그리스트
	@Override
	@Transactional
	public List<SistBlogDTO> getAllBlogList() throws Exception {
		
		return sistFriendDAO.getAllBlogList();
	}
	
	//검색 / 페이징
	@Override
	@Transactional
	public List<SistFriendVO> getFriendPagingList(SistFriendParamVO param) throws Exception {
		return sistFriendDAO.getFriendPagingList(param);
	}
	
	
}
