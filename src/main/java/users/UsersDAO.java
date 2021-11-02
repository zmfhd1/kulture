package users;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UsersDAO {
	public List<StudyInfoVO> getUsersList();
	public String getTitle();
	public List<StudyInfoVO> getSearchList();
	public List<StudyInfoVO> getStudyinfoList();
	public List<StudyInfoVO> getWord(String title, String member_id);
	public void boardDelete(String title);
//	public List<UsersVO> getWord(String word);
}
