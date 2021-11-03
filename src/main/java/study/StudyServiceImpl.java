package study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import users.StudyInfoVO;

@Service("studyservice")
public class StudyServiceImpl implements StudyService {	
	@Autowired
	StudyDAO dao;
	@Override
	public void saveStudy(StudyInfoVO vo) {
		dao.saveStudy(vo);
	}

	@Override
	public List<StudyInfoVO> studyList() {
		List<StudyInfoVO> list = dao.studyList();
		return list; 
	}

	@Override
	public void updateStudy(StudyInfoVO vo) {
		dao.updateStudy(vo);		
	}

	//제목 누르면 글쓰기 페이지 불러오는거
	@Override
	public List<StudyInfoVO> studyList2(String title, String member_id) {
		List<StudyInfoVO> list2 = dao.studyList2(title, member_id);
		return list2; 
	}
	
	
}
