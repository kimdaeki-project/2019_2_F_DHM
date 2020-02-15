package com.f.dhm.planner;

import java.util.Date;

public interface MyPlannerVO {

	int getPlNum();
	String getTitle();
	String getId();
	String getType();
	Integer getPolyPath();
	Date getDeDate();

	//추가
	Date getMakeDay();
	Integer getplLock();


}

