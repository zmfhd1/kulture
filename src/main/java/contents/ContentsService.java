package contents;

import java.util.ArrayList;
import java.util.List;

public interface ContentsService {
	/*전체정보 조회*/
	public List<ContentsVO> contentsList();
	public List<ContentsVO> titleList(String content_title);
	
	/*contents 타이틀 정보*/
	public ArrayList<ContentsVO> contentsOne();
}
