package com.f.dhm.schedule.test;

import lombok.Data;

@Data
public class Item {
	

		private String title;
		private String firstimage;
		private String addr1;
		private int areacode;
		
		public Item(String title, String addr1, int areacode, String firstimage) {
			this.title=title;
			this.addr1=addr1;
			this.firstimage=firstimage;
			this.areacode=areacode;
		}
		
		public Item(String title2, String addr, String firstImage2) {
			// TODO Auto-generated constructor stub
		}

		@Override
		public String toString() {
			return "Item{"+
					"title='"+title+'\''+
					", firstimage='"+firstimage+'\''+
					", addr1='"+addr1+'\''+
					", areacode="+areacode+'}';
		}	
	

}
