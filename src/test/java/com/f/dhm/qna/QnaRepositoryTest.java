package com.f.dhm.qna;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;



import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Pageable;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order.Direction;

@SpringBootTest
class QnaRepositoryTest {

	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private QnaService qnaService;
	
	
	@Test
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
	
	
	
	
	
	
	

}
