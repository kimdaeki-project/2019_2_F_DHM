package com.f.dhm.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("qnaList")
	public ModelAndView qnaList ()throws Exception{
		ModelAndView mv=new ModelAndView();
		mv.addObject("qnaList", qnaService.qnaList());
		mv.setViewName("qna/qnaList");
		return mv;
	}
	
	@GetMapping("qnaSelect")
	public String qnaSelect(int num, Model model) throws Exception{
		model.addAttribute("qnaVO", qnaService.qnaSelect(num));
		return "qna/qnaSelect";
	}
	
	@GetMapping("qnaWrite")
	public String qnaWrite() {
		return "qna/qnaWrite";
	}
	
	@PostMapping("qnaWrite")
	public void qnaWrite(QnaVO qnaVO)throws Exception {
		System.out.println("0000000000000000000000000000000 writer : "+qnaVO.getWriter());
		qnaService.qnaWrite(qnaVO);
	}
	
	@ModelAttribute
	public QnaVO qnaVO() {
		return new QnaVO();
	}
}
