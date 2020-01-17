package com.f.dhm.tour;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tour")
public class TourVO {
	
	@Id
	private int tourNum;
	private int loCode;
	private String img;
	private String contents;
	private int count;
}
