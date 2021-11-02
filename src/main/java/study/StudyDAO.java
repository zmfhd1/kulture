package study;

import java.util.List;

public interface StudyDAO {	
	public void saveStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList();	
	public String getStudyId();
}
