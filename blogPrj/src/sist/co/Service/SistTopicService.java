package sist.co.Service;

import java.util.List;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistTopicDTO;

public interface SistTopicService {
	/* 메인에 뿌릴 항목 전체 */
	public List<SistBlogDTO> getTopicListAll(SistBlogDTO bdto)throws Exception;
	
	/* 메인에 뿌릴 항목별 */
	public List<SistTopicDTO> getTopicList(int t_seq)throws Exception;
	
	/* nav바 클릭 주목 받는 글 항목별 */
	public List<SistTopicDTO> getTopicListNav(int t_seq)throws Exception;
	
	/* nav바 클릭 전체 글 보기 */
	public List<SistTopicDTO> getTopicListNavAll(int t_seq)throws Exception;
}
