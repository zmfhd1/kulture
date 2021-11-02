package contents;

import java.util.ArrayList;
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("contentservice")
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	ContentsDAO dao;
	
	public List<ContentsVO> contentsList() {
		List<ContentsVO> list = dao.contentsList();
		return list;

	}


	@Override
	public ArrayList<ContentsVO> contentsOne() {
		ArrayList<ContentsVO> title = dao.contentsOne();
		return title;
	}


	@Override
	public List<ContentsVO> titleList(String content_title) {
		List<ContentsVO> list = dao.titleList(content_title);
		return list;
	}


	
	

}
        

