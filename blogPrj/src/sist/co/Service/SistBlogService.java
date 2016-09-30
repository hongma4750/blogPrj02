package sist.co.Service;

import java.util.List;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogComDTO;
import sist.co.Model.SistBlogComListDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistBlogPageDTO;
import sist.co.Model.SistLikePeopleDTO;

public interface SistBlogService {
	
	//blog bbs
	boolean writeBBS(SistBlogDTO blog)throws Exception;
	List<SistBlogDTO> getBlogList(String m_id)throws Exception;
	SistBlogDTO getBBS(SistBlogDTO blog)throws Exception;
	void updateBBS(SistBlogDTO blog);
	void delBBS(int bbs_seq);
	
	/*blog_like/////////////////*/
	public boolean addBbsLike(SistBbsLikeDTO like); //add blog_like
	public int likeCount(int bbs_seq);
	public int symox(SistBbsLikeDTO like);
	public void delBbsLike(SistBbsLikeDTO like);
	public void likeplus(int bbs_seq);
	public void likeminus(int bbs_seq);
	public List<SistBbsLikeDTO> getLikeList() throws Exception;
	public List<SistBlogDTO> getLikeallow() throws Exception;
	public List<SistLikePeopleDTO> getLikePeople(int bbs_seq) throws Exception;
	
	
	//hongma:취중입니다.
	List<SistBlogPageDTO> getPointChargePageList(SistBlogPageDTO pageDto) throws Exception;
	//검색
	List<SistBlogDTO> selectBlogSearch(SistBlogDTO blogDto) throws Exception;
	//검색 페이징
	List<SistBlogPageDTO> getPointChargeSearchPageList(SistBlogPageDTO pageDto) throws Exception;
	//카테고리 안에 있는 게시글 삭제
	void deleteAllBbsInCategory (int ca_seq) throws Exception;
	
		
	//hj:집중중입니다.
	/*댓글//////////////////////////////////////////////////////*/
	boolean bbscomment(SistBlogComDTO bbscom)throws Exception;
	List<SistBlogComListDTO> getreplyList(int bbs_seq)throws Exception;

	//대댓글 밀고 삽입하기
	void rereply(SistBlogComDTO bbscom) throws Exception;
	
	//댓글 수정하기
	void modicom(SistBlogComDTO bbscom) throws Exception;
	
	//댓글 삭제하기
	void delcom(int com_seq)throws Exception;
	//댓글 수(삭제 안된거)
	int viewcomsu(int bbs_seq)throws Exception;
	
	
	
	
}