package com.f.dhm.schedule;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerVO;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleRepository repository;

	
	
	
	public List<ScheduleVO> scheduleList() throws Exception{
		return repository.findAll();
	}
	

	
	//스케줄 추가
	public boolean scheduleInsert(List<ScheduleVO> list) throws Exception{
		int beforeSize = list.size();
		list = repository.saveAll(list);
		
		if (beforeSize == list.size()) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
}
