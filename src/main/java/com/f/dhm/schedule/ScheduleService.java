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

	public List<ScheduleVO> scheduleCheck(Integer plNum, String title) throws Exception{
		return repository.findByPlNumAndTour(plNum, title);
	}
	//스케줄 추가
	public boolean scheduleInsert(ScheduleVO scheduleVO) throws Exception{
		boolean check = false;
		repository.save(scheduleVO);
		check = repository.existsById(scheduleVO.getScNum());
		
		return check;
	}
	
	//여행경비
	public Integer totalCost(Integer plNum) throws Exception{
		return repository.totalCost(plNum);
	}
	
	public Map<String, Object> scheduleInfo(String tour, Integer plNum) throws Exception{

		return repository.scheduleInfo(tour, plNum);
	}

	public ScheduleInfoVO mySc(String scName, Integer plNum) throws Exception{
		return repository.findByScNameAndPlNum(scName,plNum);
	}
}
