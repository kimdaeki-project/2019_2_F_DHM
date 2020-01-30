package com.f.dhm.schedule.test;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;




@Service
public class XmlService {

	private final Logger logger = LoggerFactory.getLogger(XmlService.class);
	
	public Items parseTour() throws Exception{
		
		Items items=new Items();
		Node node=null;
		String URL="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=KkW8cDTbMiDD70xS%2BpXe9JiQvVMyBa5TFeUylgBKuPAxfGxwOz4azNwFlyoQCuLua9hNxhoajrMdw8XV5pjo7w%3D%3D&areaCode=1&MobileOS=ETC&MobileApp=AppTest";
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(URL);
		
		doc.getDocumentElement().normalize();
	
	
		NodeList nodeList = doc.getElementsByTagName("items");
		List<Item> itemlist = new ArrayList<Item>();
		
		//////////////////////////////////////////////////////
		
		  for(int i=0;i<nodeList.getLength();i++) { 
			  Node n = nodeList.item(i); 
			  NodeList nl =n.getChildNodes(); 
			  
			  for(int j=0;j<nl.getLength();j++) { 
				  Node n2 = nl.item(j);
				  Element elem = (Element)n2; 
				  String title = elem.getElementsByTagName("title").item(0).getTextContent();
				  String firstImage;
				  String addr;
				  Integer areaCode = Integer.parseInt(elem.getElementsByTagName("areacode").item(0).getTextContent());
				  
				
				 if (elem.getElementsByTagName("firstimage").item(0)==null) {
					firstImage="https://api.visitkorea.or.kr/static/images/common/noImage.gif";
				}else {
					firstImage = elem.getElementsByTagName("firstimage2").item(0).getTextContent();
				}
				  if (elem.getElementsByTagName("addr1").item(0)== null) {
					addr = "";
				}else {
					addr = elem.getElementsByTagName("addr1").item(0).getTextContent();
				}
				
				  
				  Item item2 = new Item(title, addr, areaCode, firstImage);
				  
				  
//				  System.out.println("n"+j+" = " + elem.getElementsByTagName("title").item(0).getTextContent());
//				  System.out.println("n"+j+" = " + elem.getElementsByTagName("addr1").item(0).getTextContent());
//				  System.out.println("n"+j+" = " + elem.getElementsByTagName("areacode").item(0).getTextContent());

					itemlist.add(item2);
				}
		
				items.setItem(itemlist);

		}
		return items;
		
	}
	
	public Items searchTour(int arCode,int typeNum, String arr, int pageNum) throws Exception{
		
		Items items=new Items();
		String URL="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "ServiceKey=NV9C%2BKH8hcVMH38UJiOUmUeoPzqVz0ZUo%2B23mVS3zgwfV%2FMICch%2Fz%2Bfs50NKfHXLYYkGB4Y5WDSGIVkopSIa7Q%3D%3D"
				+ "&areaCode="+arCode+"&MobileOS=ETC&MobileApp=AppTest&numOfRows=10"
				+ "&contentTypeId="+typeNum+"&arrange="+arr+"&pageNo="+pageNum;
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(URL);
		
		doc.getDocumentElement().normalize();
	
	
		NodeList nodeList = doc.getElementsByTagName("items");
		List<Item> itemlist = new ArrayList<Item>();
		
		//////////////////////////////////////////////////////
		
		  for(int i=0;i<nodeList.getLength();i++) { 
			  Node n = nodeList.item(i); 
			  NodeList nl =n.getChildNodes(); 
			  
			  for(int j=0;j<nl.getLength();j++) { 
				  Node n2 = nl.item(j);
				  Element elem = (Element)n2; 
				  String title = elem.getElementsByTagName("title").item(0).getTextContent();
				  String firstImage;
				  String addr;
				  Integer areaCode = Integer.parseInt(elem.getElementsByTagName("areacode").item(0).getTextContent());
				  
				
				  if (elem.getElementsByTagName("firstimage").item(0)==null) {
						firstImage="../imgs/noimage.JPG";
				  }else {
						firstImage = elem.getElementsByTagName("firstimage2").item(0).getTextContent();
				  }
				  if (elem.getElementsByTagName("addr1").item(0)== null) {
						addr = "";
				  }else {
						addr = elem.getElementsByTagName("addr1").item(0).getTextContent();
				  }
				
				  Item item2 = new Item(title, addr, areaCode, firstImage);
				  
					itemlist.add(item2);
				}
		
				items.setItem(itemlist);

		}
		return items;
		
	}

	
}
