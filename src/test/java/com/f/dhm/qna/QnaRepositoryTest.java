package com.f.dhm.qna;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;



import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.boot.test.context.SpringBootTest;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order.Direction;

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
	
	//@Test
	void test2()throws Exception{
		for(int i=0; i<50;i++) {
			QnaVO qnaVO=new QnaVO();
			qnaVO.setContents("contents_"+i);
			qnaVO.setWriter("writer_"+i);
			qnaVO.setTitle("title"+i);
			qnaRepository.save(qnaVO);
			
		}
	}
	
	//@Test
	void test3()throws Exception{
		
		List<QnaVO> list=qnaRepository.findAll(org.springframework.data.domain.Sort.by("ref").descending());
		for(int i=0;i<list.size();i++) {
			System.out.println("- "+i+"번째");
			System.out.println("list.get("+i+").getNum() : "+list.get(i).getNum());
			System.out.println("list.get("+i+").getTitle() : "+list.get(i).getTitle());
			System.out.println("list.get("+i+").getWriter() : "+list.get(i).getWriter());
			System.out.println("list.get("+i+").getRef() : "+list.get(i).getRef());
		}
		//https://engkimbs.tistory.com/833
//		System.out.println(list);
	}
	
	//@Test
	void test4()throws Exception{
	//OrderBy
	//findByAgeOrderByLastnameDesc
	//… where x.age = ?1 order by x.lastname des

		List<QnaVO> list=qnaRepository.qnalisst();
		for(int i=0;i<list.size();i++) {
			System.out.println("- "+i+"번째");
			System.out.println("list.get("+i+").getNum() : "+list.get(i).getNum());
			System.out.println("list.get("+i+").getTitle() : "+list.get(i).getTitle());
			System.out.println("list.get("+i+").getWriter() : "+list.get(i).getWriter());
			System.out.println("list.get("+i+").getRef() : "+list.get(i).getRef());
		}
	}
	
	@Test
	void test5()throws Exception{
		QnaVO qnaVO=qnaService.qnaSelect(120);
		System.out.println();
	}
	
	
	
	
	
	
	
	

}
