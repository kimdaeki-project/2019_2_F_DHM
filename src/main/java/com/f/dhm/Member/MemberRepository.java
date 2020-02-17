package com.f.dhm.Member;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<MemberVO, String>{

	public MemberVO findByIdAndPw(String id, String pw) throws Exception;

	public MemberVO findByEmail(String email)throws Exception;
	
	public MemberVO findByIdAndEmail(String id, String email) throws Exception;

	public boolean existsByIdAndEmail(String id, String email)throws Exception;
	
	
}
