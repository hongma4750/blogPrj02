package sist.co.Service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistCalendarDTO;
import sist.co.Model.SistFriendVO;

@Repository
public class SistCalendarDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String ns = "SistCalendar.";
	
	/* 캘린더 리스트 */
	public List<SistCalendarDTO> getCalendarList(SistCalendarDTO fcal)throws Exception{
		List<SistCalendarDTO> callist = new ArrayList<SistCalendarDTO>();
		return callist = sqlSession.selectList(ns + "getCalendarList", fcal);
	}
	
	
	/* 퀵 뷰 상세보기 */
	public SistCalendarDTO getSchQuickView(SistCalendarDTO scal)throws Exception{
		scal = sqlSession.selectOne(ns + "getSchQuickView", scal);
		return scal;
	}

	/* 일정 상세보기 */
	public SistCalendarDTO getSch(SistCalendarDTO scal)throws Exception{
		scal = sqlSession.selectOne(ns + "getSch", scal);
		return scal;
	}
	
	/* 일정 쓰기 */
	public boolean writeSchedule(SistCalendarDTO sdto) throws Exception{
		sqlSession.insert(ns+"writeSchedule", sdto);
		return true;
	}
	
	/* 일정 수정 */
	public void updateSchedule(SistCalendarDTO sdto) throws Exception{
		sqlSession.update(ns+"updateSchedule", sdto);
	}
	
	/* 일정 삭제 */
	public void deleteSchedule(int sch_writenum) throws Exception{
		sqlSession.delete(ns+"deleteSchedule", sch_writenum);
	}
	
	/* 이웃목록 불러오기 */
	public List<SistFriendVO> getSch_invitee(SistFriendVO frd)throws Exception{
		List<SistFriendVO> frdlist = new ArrayList<SistFriendVO>();
		return frdlist = sqlSession.selectList(ns+"getSch_invitee", frd);
		
	}

}
