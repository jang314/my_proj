package com.javalec.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.FreeboardVO;
import com.javalec.VO.Param;

public class FreeboardDAO {
	private static  FreeboardDAO instance = new  FreeboardDAO();
	public  FreeboardDAO(){ }
	public static  FreeboardDAO getInstance(){ return instance; }
		
	public void insertFreeboard(SqlSession mapper, FreeboardVO vo){
		mapper.insert("insertFreeboard", vo);
	}
	
	public int freeboardCount(SqlSession mapper){
		return (int) mapper.selectOne("freeboardCount");
	}
	
	public int freeboardCount(SqlSession mapper, String item){
		return (int) mapper.selectOne("selectItemCount", item);
	}
	
	public ArrayList<FreeboardVO> freeboardList(SqlSession mapper, HashMap<String, Integer> hmap){
			return (ArrayList<FreeboardVO>) mapper.selectList("freeboardList", hmap);
	}
	
	public ArrayList<FreeboardVO> freeboardList(SqlSession mapper, Param param){
		return (ArrayList<FreeboardVO>) mapper.selectList("selectItemList", param);
	}
	
	public FreeboardVO FreeboardByIdx(SqlSession mapper, int idx){
		return (FreeboardVO) mapper.selectOne("FreeboardByIdx", idx);
	}
	
	public int increment(SqlSession mapper, int idx){
		return mapper.update("increment", idx);
	}
	
	public ArrayList<FreeboardVO> selectNotice(SqlSession mapper){
		return (ArrayList<FreeboardVO>) mapper.selectList("selectNotice");
	}
	
	public void DeleteBoard(SqlSession mapper, int idx){
		mapper.delete("deleteBoard", idx);
	}
	
	public void updateBoard(SqlSession mapper, FreeboardVO vo){
		mapper.update("updateBoard", vo);
	}
	
	public ArrayList<FreeboardVO> hit(SqlSession mapper) {
		return (ArrayList<FreeboardVO>) mapper.selectList("hit");
	}
}
