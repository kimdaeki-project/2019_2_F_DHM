package com.f.dhm.schedule;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerVO;

import lombok.val;
import net.bytebuddy.agent.builder.AgentBuilder.RedefinitionStrategy.Listener.Yielding;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleRepository repository;
	
	
	public List<ScheduleVO> scheduleList() throws Exception{
		return repository.findAll();
	}


	//스케줄 추가
	public void scheduleInsert(ScheduleVO scheduleVO) throws Exception{
		
		scheduleVO = repository.save(scheduleVO);
		
	}
	
	
}
