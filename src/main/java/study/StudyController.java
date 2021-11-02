package study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class StudyController {	
	
	@Autowired
	@Qualifier("studyservice")
	StudyService studyservice;
	
	@RequestMapping("study")
	public String studyall() {
		return "/study/service_css";
	}
	
	@RequestMapping("aboutstudy")
	public String AboutStudy() {
		return "/study/aboutstudy";
	}
	
	//메모 저장
	@RequestMapping(value = "/savestudy", method = RequestMethod.POST)
	public ModelAndView saveStudy(StudyInfoVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		studyservice.saveStudy(vo);
		mv.addObject("result", vo);	
		mv.setViewName("/study/service_css"); 
		return mv;
	}


}
