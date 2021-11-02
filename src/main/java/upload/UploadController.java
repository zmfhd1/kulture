package upload;
import java.io.File;
import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
    
    @RequestMapping("/upload")
    public String form()
    {
        return "/upload/upload";
    }
    
    @RequestMapping("/result")
    @ResponseBody
    public String result(MultipartFile file1) throws IOException{ //MultipartFile객체를 사용해 jsp에서 받은 파일을 전송받는다.
    	
		String filename1 = file1.getOriginalFilename(); //전송받은 파일명 얻기
		String savepath = "C:/Users/JS/Desktop/";
		File serverfile1 = new File(savepath + filename1);//파일객체 생성
		file1.transferTo(serverfile1);//원하는위치에 파일 생성
		return filename1;
    }
}
