package com.f.dhm.notice;

import java.util.List;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeRepository noticeRepository;
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO)throws Exception{
		noticeService.noticeUpdate(noticeVO);
		return "redirect:./noticeList";
	}
	
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
	public String noticeList(Model model, @PageableDefault (size = 20, sort = {"num"},direction = Direction.DESC,page = 0)Pageable pageable) throws Exception{
		Page<NoticeVO> noticePage=noticeService.noticeListPage(pageable);
		System.out.println("--------------noticePage info--------------");
		System.out.println("noticePage.getNumber() : "+noticePage.getNumber());
		System.out.println("noticePage.getSize() : "+noticePage.getSize());
		System.out.println("noticePage.getTotalElements() : "+noticePage.getTotalElements());
		System.out.println("noticePage.getTotalPages() : "+noticePage.getTotalPages());
		System.out.println("noticePage.getPageable() : "+noticePage.getPageable());
		
		model.addAttribute("noticePage", noticePage);
		return "notice/noticeList";
	}
	
	@ModelAttribute
	NoticeVO noticeVO() {
		return new NoticeVO();
	}
	
	
	
	/*
	 * hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
	 */
	
	// 리뷰 상세 페이지
//    @RequestMapping(value = "/reviewDetail.do")
//    public ModelAndView reviewDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session,  @RequestParam int reviewNo) {
//        
//        // 해당 게시판 번호를 받아 리뷰 상세페이지로 넘겨줌
//        BoardVO review = bService.reviewDetail(reviewNo);
//        ModelAndView view = new ModelAndView();
//        
//        Cookie[] cookies = request.getCookies();
//        
//        // 비교하기 위해 새로운 쿠키
//        Cookie viewCookie = null;
// 
//        // 쿠키가 있을 경우 
//        if (cookies != null && cookies.length > 0) 
//        {
//            for (int i = 0; i < cookies.length; i++)
//            {
//                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
//                if (cookies[i].getName().equals("cookie"+reviewNo))
//                { 
//                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
//                    viewCookie = cookies[i];
//                }
//            }
//        }
//        
//        if (review != null) {
//            System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
//            
//            view.addObject("review", review);
// 
//            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
//            if (viewCookie == null) {    
//                System.out.println("cookie 없음");
//                
//                // 쿠키 생성(이름, 값)
//                Cookie newCookie = new Cookie("cookie"+reviewNo, "|" + reviewNo + "|");
//                                
//                // 쿠키 추가
//                response.addCookie(newCookie);
// 
//                // 쿠키를 추가 시키고 조회수 증가시킴
//                int result = bService.viewUp(reviewNo);
//                
//                if(result>0) {
//                    System.out.println("조회수 증가");
//                }else {
//                    System.out.println("조회수 증가 에러");
//                }
//            }
//            // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
//            else {
//                System.out.println("cookie 있음");
//                
//                // 쿠키 값 받아옴.
//                String value = viewCookie.getValue();
//                
//                System.out.println("cookie 값 : " + value);
//        
//            }
// 
//            view.setViewName("reviewDetail");
//            return view;
//        } 
//        else {
//            // 에러 페이지 설정
//            view.setViewName("error/reviewError");
//            return view;
//        }
//    }
}
