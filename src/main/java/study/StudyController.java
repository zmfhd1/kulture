package study;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.MemberService;
import member.MemberVO;
import users.StudyInfoVO;
import users.UsersService;

@Controller
public class StudyController {	
	
	@Autowired
	@Qualifier("studyservice")
	StudyService studyservice;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	UsersService userservice;
	
	@RequestMapping("study")
	public String studyall() {
		return "/study/service_css";
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
	
	//제목누르면 글쓰기 페이지로 이동
	/*
	@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
	public ModelAndView gotoStudy(@ModelAttribute StudyInfoVO vo, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<StudyInfoVO> list = studyservice.studyList2(vo);
		mv.addObject("result", list);
		mv.setViewName("/study/aboutstudy"); 
		return mv;
	}*/
	
	//제목누르면 글쓰기 페이지로 이동
		@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
		public ModelAndView gotoStudy(String title, HttpSession session, HttpServletResponse response) throws Exception{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String member_id = (String)session.getAttribute("id");//리턴타입이 object라서 형변환 필요
			ModelAndView mv = new ModelAndView();
			if(member_id.equals("admin")) {
				out.println("<script>alert('Error : Member's Privacy!')");
				out.println("history.back()");
				//out.println("location.reload()");
				out.println("</script>");
				out.close();
				List<StudyInfoVO> studyinfolist = userservice.StudyinfoList(member_id);
				//mv.addObject("studyinfolist", out);
				mv.setViewName("/list/studylist");
				return mv;
			}else {
				List<StudyInfoVO> list = studyservice.studyList2(title, member_id);
				mv.addObject("result", list);
				mv.setViewName("/study/aboutstudy"); 
				return mv;
			}
		}
		
	
	//메모내용 수정
	@RequestMapping(value = "/updatestudy", method = RequestMethod.POST)
	public ModelAndView saveStudy2(StudyInfoVO vo) throws Exception{
		ModelAndView mv = new ModelAndView();
		studyservice.updateStudy(vo); 
		mv.addObject("msg", "Edited!");
		mv.setViewName("/study/updatememo_css");
		return mv;
	}
	
	//제목 눌렀을 때 저장된 내용 나오는 메모페이지
	@RequestMapping(value="/aboutstudy", method = RequestMethod.GET)
	public String AboutStudy() {
		return "/study/aboutstudy";

	}

	
	

}
