package com.f.dhm.qna;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.HttpResource;

import com.f.dhm.Member.MemberVO;
import com.sun.istack.Nullable;


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
	public ModelAndView qnaList (@PageableDefault(size = 20, page = 0,sort = {"ref"},direction = Direction.DESC)Pageable pageable, String searchingFor)throws Exception{
		if(searchingFor==null) {
			searchingFor="";
		}
		ModelAndView mv=new ModelAndView();
		Page<QnaVO> qnaPage=qnaService.qnaListPage(pageable,searchingFor);
		mv.addObject("qnaList", qnaPage);
		mv.setViewName("qna/qnaList");		
		return mv;
	}
	
	@GetMapping("qnaSelect")
	public String qnaSelect(int num, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		QnaVO qnaVO=qnaService.qnaSelect(num);
		Cookie[] cookies=request.getCookies();
		Cookie viewCookie=null;
		if(cookies!=null&&cookies.length>0) {
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("cookie"+num)) {
					viewCookie=cookies[i];
				}
			}
		}
		if(qnaVO!=null) {
			model.addAttribute("qnaVO",qnaService.qnaSelect(num) );
			if(viewCookie==null) {
				System.out.println("쿠키없음.");
				Cookie newCookie=new Cookie("cookie"+num, "|" + num + "|");
				response.addCookie(newCookie);
				//조회수 증가
				qnaService.increaseHit(num);
			}
			else {
				System.out.println("쿠키 있음");
				String val=viewCookie.getValue();	
				System.out.println("cookie : "+val);
			}
		}
		return "qna/qnaSelect";
	}
	
	@GetMapping("qnaWrite")
	public ModelAndView qnaWrite(HttpSession session) {
		ModelAndView mv =new ModelAndView();
		MemberVO memberVO=(MemberVO) session.getAttribute("member");
		String path="../member/memberLogin";
		String message="로그인이 필요합니다.";
		if(memberVO==null) {
			//need login, go forward
			mv.setViewName("common/result");			
			mv.addObject("path", path);
			mv.addObject("message", message);
		}
		else {
			//login ok, go to page
			mv.addObject("kind"	, "qnaWrite");
			mv.setViewName("qna/qnaWrite");
		}
		return mv;
	}
	
	@PostMapping("qnaWrite")
	public String qnaWrite(QnaVO qnaVO)throws Exception {
		qnaService.qnaWrite(qnaVO);

		return "redirect:./qnaList";
	}
	
	@ModelAttribute
	public QnaVO qnaVO() {
		return new QnaVO();
	}
}
