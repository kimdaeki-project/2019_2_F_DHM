package com.f.dhm.commonnotice;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "commonnotice")
public class CommonVO {
	@Id
	private String cemail;
	private String ccompon;
	private String ccity;
	private String ccintro;
	private String cphone;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}