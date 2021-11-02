package stt;

import java.io.File;
import java.io.IOException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class STTController {
	@Autowired
	STTService sttservice;
	
	@RequestMapping("/stt")
	public String serviceForm() {
		return "/stt/sttinput";
	}
	
	//upload파일 저장 후 파일명 전달
    @RequestMapping("/uploadresult")
    @ResponseBody
    public String uploadResult(MultipartFile file1) throws IOException{ //MultipartFile객체를 사용해 jsp에서 받은 파일을 전송받는다.
    	
		String filename1 = file1.getOriginalFilename(); //전송받은 파일명 얻기
		String savepath = "C:/Users/JS/Desktop/";
		File serverfile1 = new File(savepath + filename1);//파일객체 생성
		file1.transferTo(serverfile1);//원하는위치에 파일 생성
		return filename1;
    }
    
    //sttservice 결과 출력
    @RequestMapping("/sttservice")
    @ResponseBody
    public String sttService(String file) {    	
    	String response = sttservice.test(file); //test함수 결과는 {"text":"결과"} 형태로 출력된다.    	
		JSONObject obj = new JSONObject(response);
		String text = (String)obj.get("text");
		System.out.println(text); 	
    	return response;
    }    
	
}
