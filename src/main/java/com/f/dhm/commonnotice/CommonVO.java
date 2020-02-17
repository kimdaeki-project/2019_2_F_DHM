package com.f.dhm.commonnotice;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

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
	@CreationTimestamp
	private Date coMakeDay;
	

	
}