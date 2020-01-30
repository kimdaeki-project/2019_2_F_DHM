package com.f.dhm.wishlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishService {

	@Autowired
	private WishRepository repository;
	
	public void wishAdd(WishVO wishVO) throws Exception{
		 repository.save(wishVO);
		 boolean check = repository.existsById(wishVO.getNum());
		 
		 System.out.println("test"+check);
	}
}
