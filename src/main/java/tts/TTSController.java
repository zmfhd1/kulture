package tts;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TTSController {

	@Autowired
	TTSService ttsservice;
	
	@RequestMapping("/tts")
	public String serviceForm() {
		return "/tts/ttsinput";
	}
	
	@RequestMapping(value="/tts2", method=RequestMethod.POST)
	@ResponseBody
	public String ttsoutput(String input, int speed) throws IOException{ //String text
		String mp3file = ttsservice.test(input, speed);
		System.out.println(mp3file + "파일생성");
		return mp3file;
	}
	
}