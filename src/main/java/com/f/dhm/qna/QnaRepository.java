package com.f.dhm.qna;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QnaRepository extends JpaRepository<QnaVO, Integer>{

	//public void findByNumOrderByStepAsc()throws Exception;
	
}
