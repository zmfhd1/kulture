package users;

import java.util.List;

public interface UsersService {
	public List<StudyInfoVO> UsersList();
	public StudyInfoVO deleteBoard();
	public String getTitle();
	public List<StudyInfoVO> getSearchList();
	public List<StudyInfoVO> StudyinfoList();
	public List<StudyInfoVO> getWord(String title, String member_id);
//	public boardDelete(String delete);
	public void boardDelete(String string);
//	public List<UsersVO> getWord(String word);
}
