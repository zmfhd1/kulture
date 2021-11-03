package study;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import users.StudyInfoVO;

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
	public void updateStudy(StudyInfoVO vo) {
		dao.updateStudy(vo);
		
	}

	@Override
	public List<StudyInfoVO> studyList2(String title, String member_id) {
		return dao.studyList2(title, member_id);
		
	}
	

	

}
