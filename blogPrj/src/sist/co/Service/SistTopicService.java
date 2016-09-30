
package sist.co.Service;

import java.util.List;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistTopicDTO;
import sist.co.Model.SistTopicPageDTO;

public interface SistTopicService {
	/* 메인에 뿌릴 항목 전체 */
	public List<SistBlogDTO> getTopicListAll(SistBlogDTO bdto)throws Exception;
	
	/* 메인에 뿌릴 항목별 */
	public List<SistTopicDTO> getTopicList(int t_seq)throws Exception;
	
	/* nav바 클릭 주목 받는 글 항목별 */
	public List<SistTopicDTO> getTopicListNav(int t_seq)throws Exception;
	
	/* nav바 클릭 전체 글 보기 */
	public List<SistTopicDTO> getTopicListNavAll(int t_seq)throws Exception;

/*	// 페이징 메인 항목별
	public List<SistTopicPageDTO> getPointChargePageListMain(SistTopicPageDTO pageDto) throws Exception;
*/
	// 페이징 메인 전체 글 공감순
	public List<SistTopicPageDTO> getPointChargePageListMainAllLike(SistTopicPageDTO pageDto) throws Exception;
	
	// 페이징 메인 전체 글
	public List<SistTopicPageDTO> getPointChargePageListMainAll(SistTopicPageDTO pageDto) throws Exception;
	
	/* nav 페이징 */
	List<SistTopicPageDTO> getPointChargePageList(SistTopicPageDTO pageDto) throws Exception;
	
	// nav바 페이징 전체 글 
	public List<SistTopicPageDTO> getPointChargePageListAll(SistTopicPageDTO pageDto) throws Exception;
	
	
	
	
	// 스팟 
	// 오늘의 탑 글 보기
	public List<SistTopicDTO> getTopList(int t_seq)throws Exception;
	
	
	/* -----------------------------------------------------------------------------------------------*/
	// 검색
	// 포스트 검색
	public List<SistTopicDTO> getSearchPost(SistTopicDTO srhbdto)throws Exception;
	// 블로그 검색
	public List<SistTopicDTO> getSearchBlog(SistTopicDTO srhbdto)throws Exception;
}
