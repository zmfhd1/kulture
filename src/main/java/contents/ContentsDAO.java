package contents;

import java.util.ArrayList;
import java.util.List; 

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContentsDAO {
	public List<ContentsVO> contentsList();
	
	public ArrayList<ContentsVO> contentsOne();
	public List<ContentsVO> titleList(String content_title);

	
}
