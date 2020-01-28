package com.f.dhm.schedule.test;

public class Item {
	

		private String title;
		private String firstimage;
		private String addr1;
		private int areacode;
		
		public Item(String title, String firstimage, String addr1, int areacode) {
			this.title=title;
			this.addr1=addr1;
			this.firstimage=firstimage;
			this.areacode=areacode;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getFirstimage() {
			return firstimage;
		}
		public void setFirstimage(String firstimage) {
			this.firstimage = firstimage;
		}
		public String getAddr1() {
			return addr1;
		}
		public void setAddr1(String addr1) {
			this.addr1 = addr1;
		}
		public int getAreacode() {
			return areacode;
		}
		public void setAreacode(int areacode) {
			this.areacode = areacode;
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
