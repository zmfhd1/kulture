package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import contents.ContentsService;
import contents.ContentsVO;
import users.StudyInfoVO;
import users.UsersService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	UsersService userservice;
	@Autowired
	ContentsService contentservice;
	//@Autowiredt
	//HttpSession session;
	
	//회원가입 get
	@RequestMapping(value = "/insertmember", method = RequestMethod.GET)
	public String insertMemberinfo() throws Exception{
		return "/member/signupform_css";
	}
	
	//회원가입 post
	@RequestMapping(value = "/insertmember", method = RequestMethod.POST)
	public ModelAndView insertMember(MemberVO vo) throws Exception{
		ModelAndView mv = new ModelAndView(); 
		//String email = email1+email2+email3;
		//System.out.println(email);
		service.insertMember(vo);
		mv.addObject("result", "회원가입 되셨습니다.");
		/*
		if(service.memberOne(vo.getId())!=null) {
			mv.addObject("result", "id 중복입니다. 다른 아이디 입력하세요");
		}else {
			service.insertMember(vo);
			mv.addObject("result", "회원가입 되셨습니다.");
		}*/
		mv.setViewName("/member/insertmember"); 
		return mv;
	}
	//아이디 중복 체크
    @RequestMapping("/idCheck")
    @ResponseBody
    public int IdCheck(String id) throws Exception {
        int count = 0;
        count = service.idCheck(id);
        return count;
    }
    
    //비밀번호 체크
    @RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
	public String pwChk() {
		return "/mypage/pwcheck_css";
	}
	
	//비밀번호 체크
	@RequestMapping(value="/pwCheck", method = RequestMethod.POST)
	public ModelAndView pwChk(@ModelAttribute MemberVO vo, HttpSession session)throws Exception{
		int count = service.pwCheck(vo);
		ModelAndView mv = new ModelAndView();
		if(count > 0) {//비밀번호 확인 완료
			mv.addObject("msg", "success");
			mv.setViewName("/mypage/updateform_css");
		}
		else {//비밀번호 오류
			mv.addObject("msg", "failure");
			mv.setViewName("/mypage/pwcheck_css");
		}
		return mv;
	}

	//회원정보 수정
	@RequestMapping(value="/updatemember", method = RequestMethod.GET)
	public String updateMember(HttpServletRequest req, Model model, MemberVO vo)throws Exception{
		HttpSession session = req.getSession();
		return "/member/updateform_css";
	}
	//회원정보 수정 POST
		@RequestMapping(value = "/updatemember", method = RequestMethod.POST)
		public ModelAndView updateMember(MemberVO vo) throws Exception{
			ModelAndView mv = new ModelAndView(); 
			service.updateMember(vo);
			mv.addObject("msg", "회원 수정 완료");
			mv.setViewName("/mypage/updatemember_css"); 
			return mv;
		}
	/*	
	//main화면
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public ModelAndView main() {
		List<StudyInfoVO> studyinfolist = userservice.StudyinfoList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("studyinfolist", studyinfolist);
		mv.setViewName("/login/main");
		return mv;
	}*/
	
	//main화면
		@RequestMapping(value="/main", method = RequestMethod.GET)
		public ModelAndView main() {
			ModelAndView mv = new ModelAndView();
			List<ContentsVO> contentslist = contentservice.contentsList();
			mv.addObject("contentslist", contentslist);
			mv.setViewName("/login/main_css");
			return mv;
		}
	
	//로그인
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public ModelAndView main(@ModelAttribute MemberVO vo, HttpSession session)throws Exception{
		boolean result = service.memberLogin(vo, session);
		ModelAndView mv = new ModelAndView();
		if(result == true) {//로그인 성공
			if(vo.getId().equals("admin")) {
				List<MemberVO> list = service.memberList();
				mv.addObject("msg", "관리자 계정입니다.");
				mv.addObject("memberlist", list);
				mv.setViewName("/login/admin_css");
			}else {
				mv.addObject("msg", "success");	
				mv.setViewName("/login/main_css2");
			}
		}
		else {//로그인 실패
			mv.addObject("msg", "failure");
			mv.setViewName("/login/main_css");
		}
		List<ContentsVO> contentslist = contentservice.contentsList();
		mv.addObject("contentslist", contentslist);
		
		return mv;
	}

	
	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		service.logOut(session);
		ModelAndView mv = new ModelAndView();
		List<ContentsVO> contentslist = contentservice.contentsList();
		mv.addObject("contentslist", contentslist);
		mv.addObject("msg","logout");
		mv.setViewName("/login/main_css");
		return mv;
	}
	
	//회원탈퇴
	@RequestMapping("/deletemember")
	@ResponseBody
	public String deleteMember(String id) throws Exception {
		service.deleteMember(id);
		String msg="success";
		return msg;
	}
	
	//마이페이지
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "/mypage/pwcheck_css";
	}
	
	//관리자

	
	
		

}//controller end
