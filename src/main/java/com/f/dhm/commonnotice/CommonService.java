package com.f.dhm.commonnotice;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional(rollbackOn = Exception.class)
public class CommonService {

	
	@Autowired
	private CommonRepository commonRepository;
	
	
	
	
	
	
	
	
	
	
}
