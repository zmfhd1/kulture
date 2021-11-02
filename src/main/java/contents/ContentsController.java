package contents;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {
	
	@Autowired
	@Qualifier("contentservice")
	ContentsService service;

	@RequestMapping("/contentsinput")
	@ResponseBody
	public ModelAndView contentsinput() {
		System.out.println("컨트롤러");
		ModelAndView mv = new ModelAndView();
		//ContentsVO vo = new ContentsVO();
		List<ContentsVO> contentslist = service.contentsList();
		System.out.println(contentslist.size());
		mv.addObject("contentslist", contentslist);
		mv.setViewName("/cont/contentsinput");
		return mv;
		
		
	}
	
	@RequestMapping("/contents")
	public ModelAndView contents(String content_title) {
		ModelAndView mv = new ModelAndView();
		String imagetitle = content_title;
		List<ContentsVO> contentslist = service.titleList(content_title);
		mv.addObject("contentstitle", contentslist);
		mv.setViewName("/cont/contentstitle");
		return mv;
		
	}
	
	@RequestMapping("/contents1")
	public ModelAndView contents(int content_id) {
		System.out.println("시작");
		int j = content_id;
		ModelAndView mv = new ModelAndView();
		List<ContentsVO> contentslist = service.contentsList();
		mv.addObject("contentslist", contentslist);
		mv.addObject("j", j);
		mv.setViewName("/cont/contents");
		return mv;

	}
}
