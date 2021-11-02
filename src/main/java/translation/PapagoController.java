package translation;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PapagoController {
	
	@Autowired
	PapagoService papagoservice;
	
	@RequestMapping("/papagoservice")
	@ResponseBody
	public String stttopapago(String text) {
		String result = papagoservice.test(text);
		System.out.println(result);
		return result;
	}

}
