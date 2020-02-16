package com.f.dhm.Member;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name = "memberFiles")
public class MemberFilesVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer fnum;
	private String fname;
	private String oname;
	
	
	@OneToOne
	@JsonIgnore
	@JoinColumn(name = "id")
	private MemberVO memberVO;

	
}
