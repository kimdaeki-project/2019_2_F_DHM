package com.f.dhm.wishlist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.f.dhm.Member.MemberVO;
import com.f.dhm.planner.PlannerService;
import com.f.dhm.planner.PlannerVO;

@Service
public class WishService {

	@Autowired
	private WishRepository repository;
	@Autowired
	private PlannerService pService;
	
	
	public void wishAdd(WishVO wishVO) throws Exception{
		 
		
		 repository.save(wishVO);
		 boolean check = repository.existsById(wishVO.getNum());
		 
		 System.out.println("test"+check);
	}
	
}
