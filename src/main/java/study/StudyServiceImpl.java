package study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public String getStudyId() {
		String result = dao.getStudyId();
		return result;
	}
}
