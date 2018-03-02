package com.javalec.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.GuestBookVO;
import com.javalec.VO.GuestbookList;

public class GuestbookDAO {
	private static GuestbookDAO instance = new GuestbookDAO();
	public GuestbookDAO(){ }
	public static GuestbookDAO getInstance(){ return instance; }
	
	public void insertGuest(SqlSession mapper, GuestBookVO vo){
		mapper.insert("insertGuest", vo);
	}
	
	public int selectCount(SqlSession mapper){
		return (int) mapper.selectOne("selectCount");
	}
	
	public ArrayList<GuestBookVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap){
		return (ArrayList<GuestBookVO>) mapper.selectList("selectList", hmap);
	}
	
	public GuestBookVO selectByIdx(SqlSession mapper, int idx){
		return (GuestBookVO) mapper.selectOne("selectByIdx", idx);
	}
	
	public void updateGuest(SqlSession mapper, GuestBookVO vo){
		mapper.update("updateGuest", vo);
	}
	
	public void deleteGuest(SqlSession mapper, int idx){
		mapper.delete("deleteGuest", idx);
	}
}
