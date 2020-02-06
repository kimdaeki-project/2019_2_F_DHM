package com.f.dhm.wishlist;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.f.dhm.Member.MemberVO;

@Service
public class WishService {

	@Autowired
	private WishRepository repository;


	public void wishAdd(List<WishVO> wishlist, int plNum, String title) throws Exception{
		 
		 if(repository.findByPlNumAndTitle(plNum, title)==null) {
			 
			 repository.saveAll(wishlist);
			 boolean check = repository.existsById(wishlist.get(0).getNum());
			 System.out.println("test"+check);
			 
		 }
	}
	

	public List<WishVO> myWish(HttpSession session, int plNum) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		return repository.findByPlNum(plNum);
	}
}
