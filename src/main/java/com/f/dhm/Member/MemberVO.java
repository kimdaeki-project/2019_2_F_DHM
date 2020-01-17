package com.f.dhm.Member;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "members")
public class MemberVO {

	
	@Id
	@NotEmpty
	private String id;
	@NotEmpty
	private String pw;
	@Transient
	private String pw2;
	@NotEmpty
	private String name;
	@NotEmpty
	private String email;
	//@NotNull
	@CreationTimestamp
	private Date birth;	
	private int gender;
	
	private int mailCheck;
	private int grade;
	private int social;
	//img는 MemberFilesVO에 입력
	
//	@OneToOne(mappedBy = "memberVO", cascade = CascadeType.ALL)
//	private MemberFilesVO memberFilesVO;

		private String img;
	public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPw2() {
		return pw2;
	}

	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}


	public int getMailCheck() {
		return mailCheck;
	}

	public void setMailCheck(int mailCheck) {
		this.mailCheck = mailCheck;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getSocial() {
		return social;
	}

	public void setSocial(int social) {
		this.social = social;
	}

//	public MemberFilesVO getMemberFilesVO() {
//		return memberFilesVO;
//	}
//
//	public void setMemberFilesVO(MemberFilesVO memberFilesVO) {
//		this.memberFilesVO = memberFilesVO;
//	}
	
	
	
	
	
}
