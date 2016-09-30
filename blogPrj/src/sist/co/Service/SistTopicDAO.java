package sist.co.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistLikePeopleDTO;
import sist.co.Model.SistTopicDTO;
@Repository
public class SistTopicDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	String ns = "SistTopic.";
	
	/* 메인에 뿌릴 항목 전체 */
	public List<SistBlogDTO> getTopicListAll(SistBlogDTO bdto)throws Exception{
		List<SistBlogDTO> tlist = new ArrayList<SistBlogDTO>();
		return tlist = sqlSession.selectList(ns + "getTopicListAll");
	}
	
	/* 메인에 뿌릴 항목별 */
	public List<SistTopicDTO> getTopicList(int t_seq)throws Exception{
		List<SistTopicDTO> tolist = new ArrayList<SistTopicDTO>();
		return tolist = sqlSession.selectList(ns + "getTopicList", t_seq);
	}
	
	/* nav바 클릭 주목받는 글 항목별 */
	public List<SistTopicDTO> getTopicListNav(int t_seq)throws Exception{
		List<SistTopicDTO> topiclist = new ArrayList<SistTopicDTO>();
		return topiclist = sqlSession.selectList(ns + "getTopicList", t_seq);
	}
	
	/* nav바 클릭 전체 글 보기 */
	public List<SistTopicDTO> getTopicListNavAll(int t_seq)throws Exception{
		List<SistTopicDTO> topiclist = new ArrayList<SistTopicDTO>();
		return topiclist = sqlSession.selectList(ns + "getTopicListNavAll", t_seq);
	}
}
