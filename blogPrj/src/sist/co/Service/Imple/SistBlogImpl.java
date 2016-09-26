package sist.co.Service.Imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.Model.SistBbsLikeDTO;
import sist.co.Model.SistBlogDTO;
import sist.co.Model.SistBlogPageDTO;
import sist.co.Model.SistLikePeopleDTO;
import sist.co.Service.SistBlogDAO;
import sist.co.Service.SistBlogService;

@Service
public class SistBlogImpl implements SistBlogService {

	@Autowired
	private SistBlogDAO sistBlogDao;
	
	//블로그 글쓰기
	@Override
	@Transactional
	public boolean writeBBS(SistBlogDTO blog) throws Exception {
		// TODO Auto-generated method stub
		return sistBlogDao.writeBBS(blog);
	}

	//블로그bbs 전체리스트(아이디별)
	@Override
	@Transactional(readOnly=true)
	public List<SistBlogDTO> getBlogList(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return sistBlogDao.getBlogList(m_id);
	}

	//seq에 맞는 블로그 bbs게시물 가져오기
	@Override
	@Transactional(readOnly=true)
	public SistBlogDTO getBBS(SistBlogDTO blog) throws Exception {
		return sistBlogDao.getBBS(blog);
	}
	
	//블로그 bbs 게시물 수정
	@Override
	@Transactional
	public void updateBBS(SistBlogDTO blog){
		sistBlogDao.updateBBS(blog);	
	}

	//블로그 bbs 게시물 삭제
	@Override
	public void delBBS(int bbs_seq) {
		sistBlogDao.delBBS(bbs_seq);	
	}
	
	
	/*blog_like/////////////////*/
	/*add blog_like*/
	@Override
	public boolean addBbsLike(SistBbsLikeDTO like) {
		// TODO Auto-generated method stub
		return sistBlogDao.addBbsLike(like);
	}

	@Override
	public int likeCount(int bbs_seq) {
		// TODO Auto-generated method stub
		return sistBlogDao.likeCount(bbs_seq);
	}

	@Override
	@Transactional(readOnly=true)
	public int symox(SistBbsLikeDTO like) {
		return sistBlogDao.symox(like);
	}

	@Override
	public void delBbsLike(SistBbsLikeDTO like) {
		sistBlogDao.delBbsLike(like);
		
	}

	@Override
	public List<SistBbsLikeDTO> getLikeList() throws Exception {
		return sistBlogDao.getLikeList();
	}

	@Override
	public List<SistBlogDTO> getLikeallow() throws Exception {
		return sistBlogDao.getLikeallow();
	}

	@Override
	public List<SistLikePeopleDTO> getLikePeople(int bbs_seq) throws Exception {
		return sistBlogDao.getLikePeople(bbs_seq);
	}

	
	
	
	
	//홍마
	@Override
	public List<SistBlogPageDTO> getPointChargePageList(SistBlogPageDTO pageDto) throws Exception {
		return sistBlogDao.getPointChargePageList(pageDto);
	}
	
	
	

}