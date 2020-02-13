package com.f.dhm.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationRepository extends JpaRepository<LocationVO, Integer>{
	
	public List<LocationVO> findAllByOrderByAddedDesc();
}
