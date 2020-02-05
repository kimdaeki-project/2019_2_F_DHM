package com.f.dhm.wishlist;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WishRepository extends JpaRepository<WishVO, Integer> {

	List<WishVO> findByPlNum(int plNum);

	
}
