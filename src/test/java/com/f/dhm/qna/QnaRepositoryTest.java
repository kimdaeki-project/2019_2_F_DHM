package com.f.dhm.qna;

import static org.junit.jupiter.api.Assertions.*;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class QnaRepositoryTest {

	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private QnaService qnaService;
	//@Test
	void test() throws Exception{
		QnaVO qnavo=new QnaVO();
		qnavo.setContents("11111");
		qnavo.setWriter("wireteasdf");
		qnavo.setTitle("title");
		qnaRepository.save(qnavo);
	}
	
	@Test
	void test2()throws Exception{
		for(int i=0; i<50;i++) {
			QnaVO qnaVO=new QnaVO();
			qnaVO.setContents("contents_"+i);
			qnaVO.setWriter("writer_"+i);
			qnaVO.setTitle("title"+i);
			qnaRepository.save(qnaVO);
		}
	}

}
