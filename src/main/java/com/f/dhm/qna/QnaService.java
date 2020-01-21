package com.f.dhm.qna;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository;
	
	public void qnaWrite(QnaVO qnaVO)throws Exception{
		System.out.println("-@@@@@@---------2---------22---2---@@@@@@------");
		System.out.println("qnaVO.getUpDate() : "+qnaVO.getReDate());
		System.out.println("qnaVO.getRegDate() : "+qnaVO.getRegDate());
//		qnaVO.setRegDate(new Date(Calendar.getInstance().getTimeInMillis()));
//		qnaVO.setReDate(new Date(Calendar.getInstance().getTimeInMillis()));
		qnaRepository.save(qnaVO);
	}
	
	public QnaVO qnaSelect(int num)throws Exception{
		QnaVO qnaVO=qnaRepository.findById(num).get();
		return qnaVO;
	}
	
	public List<QnaVO> qnaList()throws Exception{
		List<QnaVO> qnaList=qnaRepository.findAll();
		return qnaList;
	}
}
