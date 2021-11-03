package study;

import java.util.List;

import users.StudyInfoVO;

public interface StudyDAO {	
	public void saveStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList();	
	public void updateStudy(StudyInfoVO vo);
	public List<StudyInfoVO> studyList2(String title, String member_id);	
}
