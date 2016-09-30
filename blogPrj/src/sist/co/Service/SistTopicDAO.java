
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
import sist.co.Model.SistTopicPageDTO;
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
	
	
/*	// 페이징 메인 항목별
	public List<SistTopicPageDTO> getPointChargePageListMain(SistTopicPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageListMain",pageDto);
	}*/
	
	// 페이징 메인 전체 글 공감순
	public List<SistTopicPageDTO> getPointChargePageListMainAllLike(SistTopicPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageListMainAllLike",pageDto);
	}
	
	
	// 페이징 메인 전체 글
	public List<SistTopicPageDTO> getPointChargePageListMainAll(SistTopicPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageListMainAll",pageDto);
	}
	
	// nav바 페이징 주목받는 글
	public List<SistTopicPageDTO> getPointChargePageList(SistTopicPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageList",pageDto);
	}
	
	// nav바 페이징 전체 글 
	public List<SistTopicPageDTO> getPointChargePageListAll(SistTopicPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageListAll",pageDto);
	}
	
	/*------------------------------------------------------------------------------------------------*/
	
	// 오늘의 탑 글 보기
	public List<SistTopicDTO> getTopList(int t_seq)throws Exception{
		
		List<SistTopicDTO> toplist = new ArrayList<SistTopicDTO>();
		return toplist = sqlSession.selectList(ns + "getTopList", t_seq);
	}
	
	
	
	/* -----------------------------------------------------------------------------------------------*/
	// 검색
	// 포스트 검색
	public List<SistTopicDTO> getSearchPost(SistTopicDTO srhbdto)throws Exception{
		List<SistTopicDTO> sblist = new ArrayList<SistTopicDTO>();
		return sblist = sqlSession.selectList(ns+"getSearchPost", srhbdto);
	}
	
	// 블로그 검색
	public List<SistTopicDTO> getSearchBlog(SistTopicDTO srhbdto)throws Exception{
		List<SistTopicDTO> sblist = new ArrayList<SistTopicDTO>();
		return sblist = sqlSession.selectList(ns+"getSearchBlog", srhbdto);
	}

}
