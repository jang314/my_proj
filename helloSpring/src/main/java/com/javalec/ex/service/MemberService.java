package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.mapper.MemberMapper;
import com.javalec.ex.model.MemberVO;

@Service
public class MemberService{
		@Autowired
		private MemberMapper membermapper;
		
//	회원가입
		public int insertMember(MemberVO memberVO) {
			int count = membermapper.insertMember(memberVO);
			return count;
		}

//	아이디 중복체크
		public int idDuplication(String id) {
			int count = membermapper.idDuplication(id);
			return count;
		}

//	이메일 중복체크
		public int emailDuplication(String email) {
			int count = membermapper.emailDuplication(email);
			return count;
		}

		/*아이디 찾기*/
		public List<MemberVO> findId(MemberVO membervo) {
			List<MemberVO> list = membermapper.findId(membervo);
			return list;
		}
		
		/*비밀번호 찾기*/
		public List<MemberVO> findPw(MemberVO membervo) {
			List<MemberVO> list = membermapper.findPw(membervo);
			return list;
		}

		/*로그인 체크*/
		public MemberVO loginCheck(String id, String password) {
			return membermapper.loginCheck(id, password);
		}

		/*회원정보조회*/
		public MemberVO selectById(String id) {
			return membermapper.selectById(id);
		}

		/*회원수정*/
		public int updateMember(MemberVO membervo) {
			int count = membermapper.updateMember(membervo);
			return count;
		}

		public int deleteMember(MemberVO memberVO) {
			int count = membermapper.deleteMember(memberVO);
			return count;
		}
}
