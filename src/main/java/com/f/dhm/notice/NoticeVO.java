package com.f.dhm.notice;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

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

	@UpdateTimestamp
	private Date regDate;

	private int hit;
	
	@OneToMany(mappedBy = "noticeVO",fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	private List<NoticeFilesVO> noticeFilesVOs;
}
