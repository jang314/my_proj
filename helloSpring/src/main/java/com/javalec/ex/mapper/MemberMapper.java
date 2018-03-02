package com.javalec.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.model.MemberVO;

public interface MemberMapper {
		int insertMember(MemberVO memberVO);																									//	회원가입
		int idDuplication(String id);																																		//	아이디 중복체크
		int emailDuplication(String email);																														//	이메일 중복체크
		List<MemberVO> findId(MemberVO  membervo);																						//	아이디 찾기
		List<MemberVO> findPw(MemberVO membervo);																					//	비밀번호 찾기
		MemberVO loginCheck(@Param("id") String id, @Param("password") String password);	//	로그인
		MemberVO selectById(@Param("id")String id);																							//	회원정보조회
		int updateMember(MemberVO membervo);																									//	회원정보수정
		int deleteMember(MemberVO memberVO);																									//	회원정보탈퇴
}
