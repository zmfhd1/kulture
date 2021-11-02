package study;

import java.util.List;

public interface StudyService {	
	public void saveStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList();
	public String getStudyId();
}
