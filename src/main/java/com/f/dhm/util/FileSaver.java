package com.f.dhm.util;

import java.io.File;
import java.util.UUID;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {

	public String save(File file, MultipartFile files)throws Exception{
//		파일이 있는 파일 위치 = filePath / 폴더가 존재하지 않을 수 있으니 if문 ↓↓
//		File file = new File(filePath);
//		if(!file.exists()) {
//			file.mkdirs();
//			
//		}
		
		String fileName = UUID.randomUUID().toString()+"_"+files.getOriginalFilename();
		
		file = new File(file, fileName);
		
		files.transferTo(file);
		
		return fileName;
	}
	
	public String save2(String realPath, MultipartFile  multipartFile)throws Exception{
	      //*공통적으로 쓰임.
	      File file = new File(realPath);
	      //System.out.println(file.exists());//파일이존재합니까? 트루면 존재 펄스면 존재x
	      System.out.println("realPath : "+ realPath);
	      //파일이 존재하지않는다면 파일의 경로대로 폴더를 만든다.
	      if(!file.exists()){
	      file.mkdirs();
	      }
	      //
	      
	      //저장될 파일명은 중복이 되면안됨(가입하는유저를 이걸로 구분하기때분)
	      //STRING타입이필요함으로 스트링타입으로 변경
	      String fileName =UUID.randomUUID().toString();
	      
	      //확장자명을 붙여준다.
	      fileName = fileName+"_"+multipartFile.getOriginalFilename();
	      
	      //System.out.println(fileName);
	      //여기까지 경로명과 파일명 준비가 됨.
	      
	      //이젠 하드디스크 저장
	      file = new File(realPath, fileName);//경로 파일명 담아서 
	      multipartFile.transferTo(file);//저장
	      
	      return fileName;
	}
}
