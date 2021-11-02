package study;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
@Primary
public class StudyDAOImpl implements StudyDAO {
	
	@Autowired
	StudyDAO dao;
	
	@Override
	public void saveStudy(StudyInfoVO vo){
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
