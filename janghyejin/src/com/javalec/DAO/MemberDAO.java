package com.javalec.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.MemberList;
import com.javalec.VO.MemberVO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public MemberDAO(){ }
	public static MemberDAO getInstance(){ return instance; }
	
	public void insert(SqlSession mapper, MemberVO vo){
		mapper.insert("insert", vo);
	}
	
	public MemberVO selectById(SqlSession mapper, String id) {
		return (MemberVO) mapper.selectOne("selectById", id);
	}
	
	public void update(SqlSession mapper, MemberVO vo){
		mapper.update("update", vo);
	}
	
	public void delete(SqlSession mapper, MemberVO vo){
		mapper.delete("delete", vo);
	}
	
	public ArrayList<MemberVO> findId(SqlSession mapper, HashMap<String, String> hmap){
		return (ArrayList<MemberVO>) mapper.selectList("findId", hmap);
	}
	
	public ArrayList<MemberVO> findPw(SqlSession mapper, HashMap<String, String> hmap){
		return (ArrayList<MemberVO>) mapper.selectList("findPw", hmap);
	}
}
