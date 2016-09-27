package sist.co.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistBlogPageDTO;
import sist.co.Model.SistLikePeopleDTO;

@Repository
public class SistBlogDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String ns = "SistBlogBbs.";
	
	public boolean writeBBS(SistBlogDTO blog) throws Exception{
		sqlSession.insert(ns+"writeBBS",blog);
		return true;
	}
	
	public List<SistBlogDTO> getBlogList(String m_id) throws Exception{
		List<SistBlogDTO> bloglist = new ArrayList<SistBlogDTO>();
		bloglist = sqlSession.selectList(ns+"getBlogList",m_id);
		return bloglist;
	}
	
	public SistBlogDTO getBBS(SistBlogDTO blog)throws Exception{
		blog = sqlSession.selectOne(ns+"getBBS",blog);
		return blog;
	}
	
	public void updateBBS(SistBlogDTO blog){
		sqlSession.update(ns+"updateBBS",blog);
	}
	
	public void delBBS(int bbs_seq){
		sqlSession.delete(ns+"delBBS",bbs_seq);
	}
	
	/*add blog_like*/
	public boolean addBbsLike(SistBbsLikeDTO like){
		sqlSession.insert(ns+"addBbsLike", like);
		return true;
	}
	
	public int likeCount(int bbs_seq){
		int likecount = sqlSession.selectOne(ns+"likeCount",bbs_seq);
		return likecount;
	}
	
	public int symox(SistBbsLikeDTO like){
		return (int)sqlSession.selectOne(ns+"symox",like);
		
	}
	
	public void delBbsLike(SistBbsLikeDTO like){
		sqlSession.delete(ns+"delBbsLike",like);
	}
	
	//like list
	public List<SistBbsLikeDTO> getLikeList() throws Exception{
		List<SistBbsLikeDTO> likelist = new ArrayList<SistBbsLikeDTO>();
		likelist = sqlSession.selectList(ns+"getLikeList");
		return likelist;
	}
	
	public List<SistBlogDTO> getLikeallow() throws Exception{
		List<SistBlogDTO> bloglist = new ArrayList<SistBlogDTO>();
		bloglist = sqlSession.selectList(ns+"getLikeallow");
		return bloglist;
	}
	
	public List<SistLikePeopleDTO> getLikePeople(int bbs_seq) throws Exception{
		List<SistLikePeopleDTO> peoplelist = new ArrayList<SistLikePeopleDTO>();
		peoplelist = sqlSession.selectList(ns+"getLikePeople",bbs_seq);
		return peoplelist;
	}
	
	
	
	//hongma:취중코딩
	public List<SistBlogPageDTO> getPointChargePageList(SistBlogPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargePageList",pageDto);
	}
	//hongma:검색
	public List<SistBlogDTO> selectBlogSearch(SistBlogDTO blogDto) throws Exception{
		return sqlSession.selectList(ns+"selectBlogSearch",blogDto);
	}
	//hongma:검색 페이징
	public List<SistBlogPageDTO> getPointChargeSearchPageList(SistBlogPageDTO pageDto) throws Exception{
		return sqlSession.selectList(ns+"getPointChargeSearchPageList",pageDto);
	}
	
}