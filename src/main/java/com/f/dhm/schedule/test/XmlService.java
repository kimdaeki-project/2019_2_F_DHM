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
		String URL="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=KkW8cDTbMiDD70xS%2BpXe9JiQvVMyBa5TFeUylgBKuPAxfGxwOz4azNwFlyoQCuLua9hNxhoajrMdw8XV5pjo7w%3D%3D&areaCode=35&MobileOS=ETC&MobileApp=AppTest";
		
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
			  
			  for(int j=0;j<4;j++) { 
				  Node n2 = nl.item(j);
				  Element elem = (Element)n2; 
				  String title = elem.getElementsByTagName("title").item(0).getTextContent();
				  String firstImage;
				  String addr;
				  Integer areaCode = Integer.parseInt(elem.getElementsByTagName("areacode").item(0).getTextContent());
				  
				
				  if (elem.getElementsByTagName("firstimage").item(0).getTextContent()==null) {
					firstImage="";
				}else {
					firstImage = elem.getElementsByTagName("firstimage").item(0).getTextContent();
				}
				  if (elem.getElementsByTagName("addr1").item(0).getTextContent()== null) {
					addr = "";
				}else {
					addr = elem.getElementsByTagName("addr1").item(0).getTextContent();
				}
				
				  
				  Item item2 = new Item(title, addr, areaCode, firstImage);
				  
				  
				  System.out.println("n"+j+" = " + elem.getElementsByTagName("title").item(0).getTextContent());
				  System.out.println("n"+j+" = " + elem.getElementsByTagName("addr1").item(0).getTextContent());
				  System.out.println("n"+j+" = " + elem.getElementsByTagName("firstimage").item(0).getTextContent());
				  System.out.println("n"+j+" = " + elem.getElementsByTagName("areacode").item(0).getTextContent());
//			  } 
//			  
//		  }
//		  
//		 
//		///////////////////////////////////////////////////
//		for(int i=0; i<10; i++) {
//			
//			node = nodeList.item(i);
//			NodeList nl = node.getChildNodes();
////			if(node.getNodeType()==node.ELEMENT_NODE) {
//				for (int j = 0; j < nl.getLength(); j++) {
//					Element elem = (Element)node;
//					Item item2 = new Item(
//							elem.getElementsByTagName("title").item(0).getTextContent(),
//							elem.getElementsByTagName("firstimage").item(0).getTextContent(),
//							elem.getElementsByTagName("addr1").item(0).getTextContent(),
//							Integer.parseInt(elem.getElementsByTagName("areacode").item(0).getTextContent())
//							);
//					
					itemlist.add(item2);
				}
//			}
		
				items.setItem(itemlist);

		}
		return items;
		
	}
}
