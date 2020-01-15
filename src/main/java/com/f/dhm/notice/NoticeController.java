package com.f.dhm.notice;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("noticeUpdate")
	public String noticeUpdate(int num, Model model)throws Exception{
		NoticeVO noticeVO=noticeService.selectById(num);
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/noticeUpdate";
	}
	
	@GetMapping("noticeDelete")
	public String noticeDelete(int num) throws Exception {
		System.out.println("noticeDelete num : "+num);
		noticeService.noticeDelete(num);
		return "redirect:./noticeList";
	}
	@GetMapping("noticeSelect")
	public String noticeSelect(int num,Model model)throws Exception{
		System.out.println("TEST : NOTICECONTROLLER.noticeSelect.num : "+num);
		NoticeVO notice=noticeService.selectById(num);
		model.addAttribute("noticeVO", notice);
		return "notice/noticeSelect";
	}
	@PostMapping("noticeWrite")
	public String noticeWrite(@Valid NoticeVO noticeVO, BindingResult bindingResult) throws Exception{
		System.out.println("Test : noticeController.noticeWrite.noticeVO : "+noticeVO);
		
		if (!bindingResult.hasErrors()) {
			//////////////////////////////
			//세션값 받아와서 id 세팅해주기!!!
			//////////////////////////////
			noticeVO.setId("ims330k");
			noticeService.noticeWrite(noticeVO);
			
			
		}else {
			//bindingResult.rejectValue(field, errorCode);
		}
		return "redirect:./noticeList";
	}
	
	@GetMapping("noticeWrite")
	public String noticeWrite(Model model) {
		model.addAttribute("noticeVO", new NoticeVO());
		return "notice/noticeWrite";
	}
	
	@GetMapping("noticeList")
	public String noticeList(Model model) throws Exception{
		List<NoticeVO> list=noticeService.noticeList();
		model.addAttribute("noticeVOs", list);
		return "notice/noticeList";
	}
	
	@ModelAttribute
	NoticeVO noticeVO() {
		return new NoticeVO();
	}
}
