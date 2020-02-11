package com.f.dhm.notice;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.sun.istack.Nullable;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO, List<MultipartFile> files)throws Exception{
		files.remove(0);
		noticeService.noticeUpdate(noticeVO, files);	
		return "redirect:./noticeList";
	}
	
	@GetMapping("notice_file_delete")
	public void notice_file_delete(int fileNum)throws Exception{
		noticeService.notice_file_delete(fileNum);		
	}
	
	@GetMapping("noticeUpdate")
	public ModelAndView noticeUpdate(int num, Model model,HttpSession session)throws Exception{
		MemberVO member=(MemberVO)session.getAttribute("member");
		ModelAndView mv=new ModelAndView();
		if(member!=null) {
			//loged in!
			NoticeVO noticeVO=noticeService.selectById(num);
			mv.addObject("noticeVO", noticeVO);
			mv.setViewName("notice/noticeUpdate");
		}
		else {
			mv.setViewName("commcon/result");
			mv.addObject("message", "로그인이 필요합니다.");
			mv.addObject("path", "../member/memberLogin");
		}
		
		return mv;
	}
	
	@GetMapping("noticeDelete")
	public String noticeDelete(int num) throws Exception {
		noticeService.noticeDelete(num);
		return "redirect:./noticeList";
	}
	
	
	@PostMapping("noticeWrite")
	public String noticeWrite(@Valid NoticeVO noticeVO, BindingResult bindingResult, List<MultipartFile> files,HttpSession session) throws Exception{
		files.remove(0);
		MemberVO member=(MemberVO)session.getAttribute("member");
		for (int i = 0; i < files.size(); i++) {
			System.out.println(i+"번째");
			System.out.println(files.get(i).getOriginalFilename());
		}
		if (!bindingResult.hasErrors()) {
			noticeVO.setId(member.getId());
			noticeService.noticeWrite(noticeVO,files);
		}else {
			//bindingResult.rejectValue(field, errorCode);
		}
		return "redirect:./noticeList";
	}
	
	@GetMapping("noticeWrite")
	public ModelAndView noticeWrite(Model model,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		MemberVO member=(MemberVO)session.getAttribute("member");
		String path="notice/noticeWrite";
		if(member!=null) {
			model.addAttribute("noticeVO", new NoticeVO());
			mv.setViewName("notice/noticeWrite");
			mv.addObject("noticeVO", new NoticeVO());
		}
		else {
			mv.addObject("message", "로그인이 필요합니다.");
			mv.addObject("path", "../member/memberLogin");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("noticeList")
	public ModelAndView noticeList(ModelAndView mv, 
			@PageableDefault (size = 20, sort = {"num"},direction = Direction.DESC,page = 0)Pageable pageable,  
			@RequestParam(name = "searchingFor", defaultValue = "") String searchingFor) throws Exception{
		Page<NoticeVO> noticePage=noticeService.noticeListPage(pageable,searchingFor);		
		mv.addObject("noticePage", noticePage);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	@ModelAttribute(name = "notice")
	NoticeVO noticeVO() {
		return new NoticeVO();
	}
	
	@GetMapping("noticeSelect")
	public String noticeSelect(int num,Model model,HttpServletRequest request, HttpServletResponse response)throws Exception{
		NoticeVO notice=noticeService.selectById(num);
		Cookie[] cookies=request.getCookies();
		Cookie viewCookie=null;	//비교하기 위해 새로운 쿠키
		if(cookies!=null&&cookies.length>0) {	//쿠키가 있을 경우
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("cookie"+num)) {	//cookie의 name이 cookie+num과 일치하는 쿠키를 viewCookie에 넣어줌.
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie=cookies[i];
				}
			}
		}
		if(notice!=null) {
			model.addAttribute("noticeVO", notice);
			if(viewCookie==null) {
				System.out.println("cookie 없음!");
				Cookie newCookie=new Cookie("cookie"+num, "|" + num + "|"); //쿠키 생성
				response.addCookie(newCookie); 	//쿠키 추가
				//쿠키를 추가시키고 조회수 증가시킴
				noticeService.increaseHit(num);
			}
			else {	//viewCookie가 null이 아닐 경우 쿠키가 있으므로 증가 로직을 처리하지 않음
				System.out.println("쿠키 있음");
				//쿠키값 받아옴.
				String ckValue=viewCookie.getValue();
				System.out.println("cookie : "+ckValue);
			}
		}
		return "notice/noticeSelect";
	}

}
























