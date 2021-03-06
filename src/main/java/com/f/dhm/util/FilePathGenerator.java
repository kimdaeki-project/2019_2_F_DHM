package com.f.dhm.util;

import java.io.File;

import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

@Component
public class FilePathGenerator {

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	
	public File getUseClassPathResource(String filePath)throws Exception{
		
		//classpath 경로를 받아오기 위해 사용
		//시작 경로의 classpath 구문은 생략
		//나머지는 ResourceLoader와 같음
		String path = "/static/";
		ClassPathResource classPathResource = new ClassPathResource(path);
		
		File file = new File(classPathResource.getFile(), filePath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		//경로명이 어디냐
		System.out.println(file.getAbsolutePath());
		
		return file;
	}
	
	
	
	public File getUseResourceLodaer(String filePath)throws Exception {
		
		String path = "classpath:/static/";
		//resourceLoader.getResource(path).getFile() 경로가  >> classes:/static 에 만들어지고  // filePath 경로가 >> upload 에 만들어진다
		File file = new File(resourceLoader.getResource(path).getFile(),filePath);
		
		// ResourceLoader는 classpath 경로를 받아오기 위해 사용
		// 생성하려는 폴더가 없으면 에러를 발생시킨다
		// static 경로를 이용해서 File 객체를 생성하고
		// 하위 폴더를 Child를 사용해서 폴더 생성
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		System.out.println(file.getAbsolutePath());
		
		return file;
	}
	
	
	
	public File getUseServletContext(String filePath)throws Exception {
		
		String files = servletContext.getRealPath(filePath);
		File file = new File(files);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		return file;
	}
	
	
}
