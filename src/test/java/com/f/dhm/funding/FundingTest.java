package com.f.dhm.funding;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@SpringBootTest
class FundingTest {
	
	
	@Resource(name = "fundingRepository")
	private FundingRepository fundingRepository;
	
	@Resource(name = "fundingService")
	private FundingService fundingService;
	
//	@Test
	void writeTest() {
		FundingVO fundingVO = new FundingVO();
		fundingVO.setPNum(1);
		fundingVO.setFName("펀딩 테스트");
		fundingVO.setContents("펀딩 테스트입니다.");
		fundingVO.setGoal(100000000);
		fundingVO.setStatus(0);
		fundingVO.setId("test");
		fundingVO.setEndTime(Calendar.getInstance().getTime());
		fundingVO.setPeople(5);
		
		fundingRepository.save(fundingVO);
		
	}
	
//	@Test
	void selectTest() throws Exception{
//		FundingVO fundingVO = fundingRepository.fundingSelect(2);
		Optional<FundingVO> fundingVO = fundingRepository.findById(3);
	}
	
//	@Test
//	void updateTest() throws Exception{
//		fundingService.fundingUpdate();
//	}
	
//	@Test
	void deleteTest() throws Exception{
		fundingService.fundingDelete(1);
	}
	
	@Test
	void listTest() throws Exception{
		List<FundingVO> ar = fundingRepository.fundingList();
//		Page<FundingVO> ar2 = fundingService.fundingList(pager);
	}
}
