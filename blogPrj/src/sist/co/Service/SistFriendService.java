package sist.co.Service;

import java.util.List;


import sist.co.Model.SistBlog;

import sist.co.Model.SistBlogDTO;

import sist.co.Model.SistDblFollowingVO;
import sist.co.Model.SistFgroupVO;
import sist.co.Model.SistFriendParamVO;
import sist.co.Model.SistFriendVO;
import sist.co.Model.SistFsettingVO;
import sist.co.Model.SistMemberVO;

public interface SistFriendService {
	
	//이웃 수
	public int cntfriend(String myid) throws Exception;
	
	//이웃 한명
	public SistFriendVO getFriend(String myid) throws Exception;

	//이웃들 정보가져오기
	public List<SistFriendVO> getFriends(String myid) throws Exception;
	
	//이웃목록만
	public List<SistFriendVO> get1FolFriends(String myid) throws Exception;
	
	//서로이웃목록만
	public List<SistFriendVO> get2FolFriends(String myid) throws Exception;

	//해당 이웃의 이웃 정보 가져오기
	public List<SistFriendVO> gettheFofFriends(SistFriendVO fnd) throws Exception;
	//모든 이웃의 이웃 정보 가져오기(myid로추출)
	public List<SistFriendVO> getAllFofFriends(String myid) throws Exception;

	//그룹조회
	public List<SistFgroupVO> getGroups(String myid) throws Exception;

	//그룹추가
	public boolean addGroup(SistFgroupVO group) throws Exception;
	
	//그룹이동
	public boolean moveGroup(SistFriendVO friend)throws Exception;

	//이웃추가
	public boolean addFriend(SistFriendVO friend) throws Exception;
	
	//이웃 삭제
	public boolean delFriend(SistFriendVO friend) throws Exception;

	//서로이웃팔로잉추가
	public boolean addDblFollowing(SistDblFollowingVO dblfol) throws Exception;
	
	//내가받은 서로이웃신청 조회
	public List<SistDblFollowingVO> getReceiveDblFols(String myid) throws Exception;
	
	//내가 보낸 서로이웃팔로잉
	public List<SistDblFollowingVO> getSendDblFols(String myid) throws Exception;
	
	//서로이웃신청 취소
	public boolean delsendfol(int seq) throws Exception;
	
	//서로이웃팔로잉 수락
	public boolean acceptDblFols(int seq) throws Exception;
	
	//팔로잉조회
	public SistDblFollowingVO get2fol(int seq) throws Exception;
	

	
	
	//hongma:
	SistBlog selectBlog(String m_id) throws Exception;

	//서로이웃신청 미확인한 수
	public int cntR_2Fol(String m_id) throws Exception;
	
	//getGroupbyFriends
	public List<SistFriendVO> getGroupbyFriends(String m_id) throws Exception;
	
	//모든블로그리스트
	public List<SistBlogDTO> getAllBlogList() throws Exception;
	
	//검색 / 페이징
	public List<SistFriendVO> getFriendPagingList(SistFriendParamVO param) throws Exception;


}
