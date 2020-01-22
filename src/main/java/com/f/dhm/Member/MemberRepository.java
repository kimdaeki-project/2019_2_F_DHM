package com.f.dhm.Member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<MemberVO, String>{

	public MemberVO findByIdAndPw(String id, String pw) throws Exception;

//	@Query(value = "select q from MemberVO q where id =: id", nativeQuery = true)
//	MemberVO findMemberVO(@Param("id")String id)throws Exception;
	
	public MemberVO findByEmail(String email)throws Exception;
	
	
}
