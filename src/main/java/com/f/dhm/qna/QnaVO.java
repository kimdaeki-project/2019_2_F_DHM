package com.f.dhm.qna;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name = "qna")
public class QnaVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	@NotEmpty(message = "제목을 입력해 주세요")
	private String title;
	private String contents;

	private String writer;

	@CreationTimestamp
	private Date regDate;
	@UpdateTimestamp
	private Date reDate;

	
	private int hit;
	private int step;
	private int ref;
	private int depth;
}
