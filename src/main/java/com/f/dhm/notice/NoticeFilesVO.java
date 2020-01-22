package com.f.dhm.notice;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "noticeFiles")
public class NoticeFilesVO {

	@Id
	@GeneratedValue(generator = "fnum", strategy = GenerationType.IDENTITY)
	private int fnum;
	
	@ManyToOne
	@JoinColumn(name = "num")
	private NoticeVO noticeVO;
	
	private String fname;
	private String oname;
}
