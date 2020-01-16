package com.f.dhm.schedule;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ScheduleService {
	@Autowired
	private ScheduleRepository repository;
	
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
