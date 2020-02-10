package com.f.dhm.schedule;


import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleRepository repository;
	
	
	public List<ScheduleVO> scheduleList(int plNum) throws Exception{
		return repository.findByPlNum(plNum);
	}


	//스케줄 추가
	public void scheduleInsert(ScheduleVO scheduleVO) throws Exception{
		
		repository.save(scheduleVO);
	}
	
	public Map<String, Object> scheduleInfo(String tour, Integer plNum) throws Exception{

		return repository.scheduleInfo(tour, plNum);
	}

	public ScheduleInfoVO mySc(String scName, Integer plNum) throws Exception{
		return repository.findByScNameAndPlNum(scName,plNum);
	}
}
