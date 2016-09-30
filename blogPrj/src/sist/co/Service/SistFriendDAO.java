package sist.co.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistDblFollowingVO;
import sist.co.Model.SistFgroupVO;
import sist.co.Model.SistFriendVO;
import sist.co.Model.SistFsettingVO;
import sist.co.Model.SistMemberVO;

@Repository
public class SistFriendDAO {
	@Autowired
	SqlSession sqlsession;
	
	private String ns = "SistFriend.";
	
	//나의 이웃한명
		public SistFriendVO getFriend(String myid) throws Exception{
			SistFriendVO f = new SistFriendVO();
			f = sqlsession.selectOne(ns+"getFriend", myid);
			return f;
		}

		//나의 이웃들 정보 가져오기
		public List<SistFriendVO> getFriends(String myid) throws Exception{
			
			List<SistFriendVO> flist = new ArrayList<SistFriendVO>();
			flist = sqlsession.selectList(ns+"getFriends", myid);
			
			return flist;
		}
		
		//해당 이웃의 이웃 정보 가져오기
		public List<SistFriendVO> gettheFofFriends(SistFriendVO fnd) throws Exception{
			List<SistFriendVO> fofflist = new ArrayList<SistFriendVO>();
			fofflist = sqlsession.selectList(ns+"gettheFofFriends", fnd);
			
			return fofflist;
		}
		
		//모든 이웃의 이웃 정보 가져오기(myid로추출)
		public List<SistFriendVO> getAllFofFriends(String myid) throws Exception{
			List<SistFriendVO> fofflist = new ArrayList<SistFriendVO>();
			fofflist = sqlsession.selectList(ns+"getAllFofFriends", myid);

			return fofflist;
		}
		
		//그룹조회
		public List<SistFgroupVO> getGroups(String myid) throws Exception{
			List<SistFgroupVO> glist = new ArrayList<SistFgroupVO>();
			glist = sqlsession.selectList(ns+"getGroups", myid);
			return glist;
		}
		
		//그룹추가
		public boolean addGroup(SistFgroupVO group)throws Exception{
			sqlsession.insert(ns+"addGroup", group);
			return true;
		}
		
		//이웃 추가
		public boolean addFriend(SistFriendVO friend) throws Exception{
			sqlsession.insert(ns +"addFriend", friend);
			return true;
		}
		
		//서로이웃팔로잉추가
		public boolean addDblFollowing(SistDblFollowingVO dblfol) throws Exception{
			sqlsession.insert(ns+"addDblFollowing", dblfol);
			return true;
		}
		
		//내가 받은 서로이웃팔로잉
		public List<SistDblFollowingVO> getReceiveDblFols(String myid) throws Exception{
			List<SistDblFollowingVO> dblfols = new ArrayList<SistDblFollowingVO>();
			dblfols = sqlsession.selectList(ns+"getReceiveDblFols", myid);
			return dblfols;
		}
	

}
