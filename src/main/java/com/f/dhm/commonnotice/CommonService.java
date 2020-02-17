package com.f.dhm.commonnotice;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional(rollbackOn = Exception.class)
public class CommonService {

	
	@Autowired
	private CommonRepository commonRepository;
	
	
	public List<CommonVO> getAdverList() throws Exception{
		return commonRepository.findAll();
	}
	
}
