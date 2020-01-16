package com.f.dhm.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.f.dhm.util.FilePathGenerator;
import com.f.dhm.util.FileSaver;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;	
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private MemberFilesRepository memberFilesRepository;
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		
		return memberRepository.findById(memberVO.getId()).get();
	}
	
	
	
	
}
