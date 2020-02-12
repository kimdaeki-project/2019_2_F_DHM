package com.f.dhm.funding;

import java.util.List;
import java.util.Optional;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.f.dhm.util.Pager;

//@Transactional
@Service
public class FundingService {
	
	@Resource(name = "fundingRepository")
	private FundingRepository fundingRepository;
	
	@Resource(name = "fundingJoinRepository")
	private FundingJoinRepository fundingJoinRepository;
	
	//funding//
	public void fundingWrite(FundingVO fundingVO) throws Exception{
		fundingRepository.save(fundingVO);
	}//write
	
	public Optional<FundingVO> fundingSelect(int num) throws Exception{
		return fundingRepository.findById(num);
	}//select
	
	//헤현추가
	public List<FundingVO> fundingIndexList() throws Exception{
		return fundingRepository.fundingList();
	}
	
	public Pager fundingList(Pager pager) throws Exception{
		pager.makePageRequest(Sort.by("num").descending());
		
		Page<FundingVO> p = fundingRepository.findByNumGreaterThan(0, pager.getPageable());
		
		pager.setPageList(p);
		
		pager.makeNum();
		
		return pager;
	}//list

	public void fundingUpdate(FundingVO fundingVO) throws Exception{
//		fundingRepository.fundingUpdate(fundingVO.getName(), fundingVO.getContents(), fundingVO.getPrice(),
//				fundingVO.getGoal(), fundingVO.getStartTime(), fundingVO.getEndTime(), fundingVO.getPeople(), fundingVO.getNum());
		fundingRepository.save(fundingVO);
	}

	public void fundingDelete(int num) throws Exception{
		fundingRepository.deleteById(num);
	}//delete

	//fundingJoin//
	public FundingVO fundingJoinList(FundingVO fundingVO) throws Exception{
//		List<FundingVO> list = fundingRepository.fundingJoinList(num);
		
		fundingVO = fundingRepository.findById(fundingVO.getNum()).get();
		fundingVO.getFundingJoinVOs();
		
		return fundingVO;
	}//select
	
	
//	public void fundingJoinSelect2(String id) throws Exception{
//		fundingRepository.fundingJoinSelect(id);
//	}//select2
	
//	public void fudningJoinUpdate(FundingJoinVO fundingJoinVO) throws Exception{
//		fundingRepository.fundingJoinUpdate(fundingJoinVO.getParticipationPeople(), fundingJoinVO.getNum());
//	}
	
	public void fundingJoinWrite(FundingJoinVO fundingJoinVO) throws Exception{
		System.out.println(fundingJoinVO.getFundingVO().getGage()+": gage/service");
		System.out.println(fundingJoinVO.getFundingVO().getStatus()+": status/service");
		fundingRepository.fundingUpdate(fundingJoinVO.getFundingVO().getStatus(), fundingJoinVO.getFundingVO().getGage(), fundingJoinVO.getFundingVO().getNum());
		fundingJoinRepository.save(fundingJoinVO);
	}
	
	public void fundingJoinDelete(int num) throws Exception{
		fundingJoinRepository.deleteById(num);
	}
	
	public List<FundingVO> allList() throws Exception{
		return fundingRepository.findAll();
	}
}
