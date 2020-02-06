package com.f.dhm.wishlist;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "mytour")
public class WishVO {

	@Id
	@Column(name = "num")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int num;
	private Integer plNum;
	private String id;
	private String title;
	private String firstimage;
	private String addr1;
	private int arCode;
}
