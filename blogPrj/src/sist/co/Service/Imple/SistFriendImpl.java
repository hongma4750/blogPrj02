package sist.co.Service.Imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.Model.SistDblFollowingVO;
import sist.co.Model.SistFgroupVO;
import sist.co.Model.SistFriendVO;
import sist.co.Model.SistFsettingVO;
import sist.co.Model.SistMemberVO;
import sist.co.Service.SistFriendDAO;
import sist.co.Service.SistFriendService;

@Service
public class SistFriendImpl implements SistFriendService {
	
	@Autowired
	SistFriendDAO sistFriendDAO;

	//이웃 한명
	@Override
	@Transactional
	public SistFriendVO getFriend(String myid) throws Exception {

		return sistFriendDAO.getFriend(myid);
	}

	//이웃들 정보가져오기	
	@Override
	@Transactional
	public List<SistFriendVO> getFriends(String myid) throws Exception {

		return sistFriendDAO.getFriends(myid);
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

	//친구추가
	@Override
	@Transactional
	public boolean addFriend(SistFriendVO friend) throws Exception {

		return sistFriendDAO.addFriend(friend);
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


	
}
