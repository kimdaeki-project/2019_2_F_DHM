package com.f.dhm.qna;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.validation.constraints.Size;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.annotation.Rollback;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order.Direction;

@SpringBootTest
class QnaRepositoryTest {

	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private QnaService qnaService;

	private String page;

	private String Size;
	
	
	//@Test
	public void stepupdate()throws Exception{
		QnaVO qnaVO=new QnaVO();
		qnaVO.setNum(332);
		qnaVO.setContents("332test");
		qnaVO.setTitle("332test");
		qnaVO.setWriter("t332est");
//		---------------------------
		QnaVO qnaVO2=new QnaVO();
		qnaVO2.setTitle(qnaVO.getTitle());
		qnaVO2.setContents(qnaVO.getContents());
		qnaVO2.setWriter(qnaVO.getWriter());	
		qnaVO=qnaRepository.findById(qnaVO.getNum()).get();
		qnaVO2.setRef(qnaVO.getRef());
		qnaVO2.setDepth(qnaVO.getDepth()+1);
		int step=qnaVO.getStep()+1;
		qnaVO2.setStep(step);
		List<QnaVO> stepIncreaseList=qnaRepository.findByRef(qnaVO.getRef());
		for( int i=0;i<stepIncreaseList.size();i++) {
			if(stepIncreaseList.get(i).getStep()>=step) {
				stepIncreaseList.get(i).setStep(stepIncreaseList.get(i).getStep()+1);
			}
		}
		qnaRepository.saveAll(stepIncreaseList);		
		qnaRepository.save(qnaVO2);
	}
	
	public Page<QnaVO> getPagePost() {
	 Page<QnaVO> qnaPage=qnaRepository.findAll(PageRequest.of(0,10));

	 return qnaPage;
	}
	
	//@Test
	public void pageTest()throws Exception{
		Page<QnaVO> qnapPage=this.getPagePost();
		System.out.println("@@@@@@@@@@@@@@@@  test  @@@@@@@@@@@@@@@@");
		qnapPage.forEach(System.out::println);
	}
	
	//@Test
	@Rollback(false)
	public void searchWidth() throws Exception{
		Page<QnaVO> qnaQage=qnaRepository.findByTitleContains("9", PageRequest.of(0, 10));
		System.out.println("@@@@@@@@@@@@@@@@  test  @@@@@@@@@@@@@@@@");
		qnaQage.forEach(System.out::println);		
		
		assertNotNull(qnaQage);
	}
	
	

}
