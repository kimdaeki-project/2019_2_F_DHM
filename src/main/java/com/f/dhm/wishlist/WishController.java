package com.f.dhm.wishlist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;

@Controller
@RequestMapping("/wish/**")
public class WishController {
	
	@Autowired
	private PlannerService pService;
	@Autowired
	private WishService wishService;
	
//
//	@GetMapping("wishDel")
//	public void wishDel() throws Exception{
//		
//	}
//	
//	@GetMapping("wishAdd")
//	public void wishAdd(String title, String firstimage, String addr1, int arCode,HttpSession session, PlannerVO plannerVO) throws Exception{
//		
//		System.out.println("하이");
//		ModelAndView mv = new ModelAndView();
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		int plNum = pService.getPlnum();
//	
//		String id= memberVO.getId();
//		WishVO wishVO = new WishVO();
//		wishVO.setId(id);
//		wishVO.setTitle(title);
//		wishVO.setFirstimage(firstimage);
//		wishVO.setAddr1(addr1);
//		wishVO.setPlNum(plNum);
//		wishVO.setArCode(arCode);
//		wishService.wishAdd(wishVO);
//		System.out.println(plNum);
//		System.out.println("바이");
//		
//		
//	}
//	
}
