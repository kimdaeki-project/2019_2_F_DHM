package com.f.dhm.util;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import lombok.Data;

@Data
public class Pager {

	private int curPage;
	private int perPage;
	private Integer startNum;
	private Integer lastNum;
	private Integer curBlock;
	private Integer totalBlock;
	private Page<? extends Object> pageList;
	private Pageable pageable;
	public Pager() {
		this.curPage=0;
		this.perPage=10;
	}
	
	public void makeNum() {
		int perBlock=5;
	}
}
