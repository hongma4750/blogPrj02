package sist.co.Service.Imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistTopicDTO;
import sist.co.Service.SistTopicDAO;
import sist.co.Service.SistTopicService;
@Service
public class SistTopicImpl implements SistTopicService {
	
	@Autowired SistTopicDAO sistTopicDAO;
	
	/* 메인에 뿌릴 항목 전체 */
	@Override
	public List<SistBlogDTO> getTopicListAll(SistBlogDTO bdto) throws Exception {
		return sistTopicDAO.getTopicListAll(bdto);
	}
	
	/* 메인에 뿌릴 항목별 */
	@Override
	public List<SistTopicDTO> getTopicList(int t_seq)throws Exception {
		return sistTopicDAO.getTopicList(t_seq);
	}
	
	/* nav바 클릭 주목 받는 글 항목별 */
	@Override
	public List<SistTopicDTO> getTopicListNav(int t_seq) throws Exception {
		return sistTopicDAO.getTopicListNav(t_seq);
	}

	/* nav바 클릭 전체 글 보기 */
	@Override
	public List<SistTopicDTO> getTopicListNavAll(int t_seq) throws Exception {
		// TODO Auto-generated method stub
		return sistTopicDAO.getTopicListNavAll(t_seq);
	}

	
	
	
	
}
