package com.f.dhm.location;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.sun.xml.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import lombok.Data;

@Data
@Entity
@Table(name = "location")
public class LocationVO {
	
	@Id
	private int arCode;
	private String arImg;
	private String arName;
	private int arIndex;
	private int added;
	private int subway;
	private int taxi;
	private int mycar;
	private int airplane;
	private int bus;
	private int transfer;
	private int bak0;
	private int bak1;
	private int bak2;
	private int bak3;
	private int bak4;
	private int bak5;
	private int bak6;
	private int bak7;
	private int bak8;
	private int bak9;
	private int totalBak;
	@Transient
	private String maxBak;
	@Transient
	private String maxTransfer;
	
	
	public void inputBak(int day) throws Exception{
		switch (day) {
		case 0:
			this.bak0+=1;
			break;
		case 1:
			this.bak1+=1;
			break;
		case 2:
			this.bak2+=1;
			break;
		case 3:
			this.bak3+=1;
			break;
		case 4:
			this.bak4+=1;
			break;
		case 5:
			this.bak5+=1;
			break;
		case 6:
			this.bak6+=1;
			break;
		case 7:
			this.bak7+=1;
			break;
		case 8:
			this.bak8+=1;
			break;
		default:
			this.bak9+=1;
			break;
		}
		
		this.totalBak+=1;
		
		
		
	}
	
	public void inputTransfer(String trans) {
		
		if (trans.equals("택시")) {
			this.taxi = taxi + 1;
		}else if (trans.equals("버스")) {
			this.bus+=1;
		}else if (trans.equals("기차")) {
			this.subway+=1;
		}else if (trans.equals("항공")) {
			this.airplane+=1;
		}else if (trans.equals("자차")) {
			this.mycar+=1;
		}
		
		if (trans != null && !trans.equals("선택")) {
			
			this.transfer+=1;
		}
	}

}
