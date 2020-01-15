package com.f.dhm.notice;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.beans.factory.annotation.Value;

import lombok.Data;
//num	int
//title	varchar(45)
//contents	varchar(45)
//id	varchar(45)
//regDate	varchar(45)
//hit	varchar(45)
@Entity
@Table(name = "notice")
@Data
public class NoticeVO  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	@NotEmpty(message = "제목을 입력해 주세요")
	private String title;
	private String contents;
	private String id;
	@CreationTimestamp
	private Date regDate;
	
	private int hit;
}
