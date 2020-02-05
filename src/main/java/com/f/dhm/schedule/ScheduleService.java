package com.f.dhm.schedule;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.f.dhm.planner.PlannerRepository;
import com.f.dhm.planner.PlannerVO;

import net.bytebuddy.agent.builder.AgentBuilder.RedefinitionStrategy.Listener.Yielding;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleRepository repository;
	
	
	public List<ScheduleVO> scheduleList(int plNum) throws Exception{
		return repository.findByPlNum(plNum);
	}
	
//	public String findDay(Date deDate) throws Exception{
//	
//		int yoil = repository.findDay(deDate);
//		String yoil2=null;
//		if(yoil==1) {
//			System.out.println("월요일");
//			yoil2="월요일";
//		}else if(yoil==2){
//			System.out.println("화요일");
//			yoil2="화요일";
//		}
//		
//		return yoil2;
//	}

	//스케줄 추가
	public void scheduleInsert(ScheduleVO scheduleVO) throws Exception{
		
		repository.save(scheduleVO);
	}
	
	
}
