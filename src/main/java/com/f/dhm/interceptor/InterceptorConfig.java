package com.f.dhm.interceptor;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //XML
public class InterceptorConfig implements WebMvcConfigurer {

	@Resource(name = "certificationInterceptor")
	private CertificationInterceptor certificationInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub

		//Interceptor 등록
		registry.addInterceptor(certificationInterceptor)

		//Interceptor를 사용할 URL 패턴 등록
		.addPathPatterns("/member/*")
		.addPathPatterns("/funding/*")
		//Interceptor를 제외할 URL 패턴 등록
		.excludePathPatterns("/member/memberLogin")
		.excludePathPatterns("/member/memberJoin")
		.excludePathPatterns("/member/memberUsePage/memberCommonNotice")
		.excludePathPatterns("/funding/fundingList")
		.excludePathPatterns("/funding/fundingSelect*")
		.excludePathPatterns("/member/memberIdCheck")
		.excludePathPatterns("/member/memberPWCheck")
		.excludePathPatterns("/member/memberEMAILCheck")
		.excludePathPatterns("/member/memberEMAIL2Check")
		.excludePathPatterns("/member/memberEMAIL3Check");
		
		


//		WebMvcConfigurer.super.addInterceptors(registry);
	}




}
