package com.f.dhm.Member;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "memberfiles")
public class MemberFilesVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fnum;
	//memberVO id
	private String fname;
	private String oname;
	
	
	@OneToOne
	@JoinColumn(name = "id")
	private MemberVO memberVO;


	public int getFnum() {
		return fnum;
	}


	public void setFnum(int fnum) {
		this.fnum = fnum;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getOname() {
		return oname;
	}


	public void setOname(String oname) {
		this.oname = oname;
	}


	public MemberVO getMemberVO() {
		return memberVO;
	}


	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	
	
	
	
}
