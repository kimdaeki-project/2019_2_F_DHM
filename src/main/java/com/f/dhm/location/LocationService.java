package com.f.dhm.location;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class LocationService {
	
	@Autowired
	private LocationRepository LoRepository;
	
	
	public void updateLoc(int arCode, int bak, String transfer) throws Exception{
		LocationVO LVO = LoRepository.findById(arCode).get();
		LVO.inputBak(bak);
		LVO.inputTransfer(transfer);
		LVO.setAdded(LVO.getAdded()+1);
		LoRepository.save(LVO);
	}
	
	public List<LocationVO> selectList() throws Exception{
		return LoRepository.findAllByOrderByAddedDesc();
	}
	
	
	public LocationVO selectOne(int arCode) throws Exception{
		return LoRepository.findById(arCode).get();
	}
}
