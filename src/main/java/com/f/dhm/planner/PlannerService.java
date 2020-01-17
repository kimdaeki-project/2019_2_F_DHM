package com.f.dhm.planner;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class PlannerService {
	
	@Autowired
	private PlannerRepository repository;
	
	public PlannerVO plannerSelect(PlannerVO plannerVO) throws Exception{
		
		return repository.save(plannerVO);
	}
}
