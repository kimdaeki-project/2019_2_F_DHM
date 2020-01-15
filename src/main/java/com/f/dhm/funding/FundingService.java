package com.f.dhm.funding;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.f.dhm.util.Pager;

@Transactional
@Service
public class FundingService {
	
	@Resource(name = "fundingRepository")
	private FundingRepository fundingRepository;
	
	public void fundingWrite(FundingVO fundingVO) throws Exception{
		fundingRepository.save(fundingVO);
	}//write
	
	public Optional<FundingVO> fundingSelect(int fNum) throws Exception{
		return fundingRepository.findById(fNum);
	}//select
	
	public Pager fundingList(Pager pager) throws Exception{
		pager.makePageRequest(Sort.by("fNum").descending());
		
		Page<FundingVO> p = fundingRepository.findByFNumGreaterThan(0, pager.getPageable());
		
		pager.setPageList(p);
		
		pager.makeNum();
		
		return pager;
	}//list

	public void fundingUpdate(FundingVO fundingVO) throws Exception{
		fundingRepository.fundingUpdate(fundingVO.getFName(), fundingVO.getContents(), 
				fundingVO.getGoal(), fundingVO.getStartTime(), fundingVO.getEndTime(), fundingVO.getPeople(), fundingVO.getFNum());
//		fundingRepository.fundingUpdate("testest", "테스트 테스트 테스트 테스트", 
//				2000000, Calendar.getInstance().getTime(), Calendar.getInstance().getTime(), 3, 2);
	}

	public void fundingDelete(int fNum) throws Exception{
		fundingRepository.deleteById(fNum);
	}//delete


	
}
