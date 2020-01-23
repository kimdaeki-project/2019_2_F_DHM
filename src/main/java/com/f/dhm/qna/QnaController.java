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

	@GetMapping("qnaDeleteAll")
	public String qnaDeleteAll()throws Exception{
		qnaService.qnaDeleteAll();
		return "redirect:qnaList";
	}
	@GetMapping("qnaDelete")
	public String qnaDelete(int num) throws Exception{
		qnaService.qnaDelete(num);
		return "redirect:qnaList";
	}
	@PostMapping("qnaComment")
	public String qnaComment(QnaVO qnaVO)throws Exception{
		System.out.println("--------------------------test : qnaComment--------------------------");
		System.out.println(qnaVO.getNum());
		System.out.println(qnaVO.getTitle());
		System.out.println(qnaVO.getContents());
		System.out.println(qnaVO.getWriter());
		System.out.println(qnaVO.getRegDate());
		System.out.println(qnaVO.getReDate());
		System.out.println("------------------------------------------------------------------------------");
		qnaService.qnaComment(qnaVO);
		return "redirect:./qnaList";
	}
	
	@GetMapping("qnaComment")
	public String qnaComment(int num, Model model)throws Exception{
		QnaVO qnaVO=qnaService.qnaSelect(num);
		qnaVO.setTitle("[re :"+qnaVO.getTitle()+"]");
		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute("comment", "is coment");
		model.addAttribute("kind", "qnaComment");
		return "qna/qnaWrite";
	}
	
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
	public String qnaWrite(Model model) {
		model.addAttribute("kind", "qnaWrite");
		return "qna/qnaWrite";
	}
	
	@PostMapping("qnaWrite")
	public String qnaWrite(QnaVO qnaVO)throws Exception {
		System.out.println("0000000000000000000000000000000 writer : "+qnaVO.getWriter());
		System.out.println(qnaVO.getRegDate());
		System.out.println(qnaVO.getReDate());
		qnaService.qnaWrite(qnaVO);
		return "redirect:./qnaList";
	}
	
	@ModelAttribute
	public QnaVO qnaVO() {
		return new QnaVO();
	}
}
