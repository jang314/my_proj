package com.javalec.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.FreeboardCommentList;
import com.javalec.VO.FreeboardCommentVO;

public class FreeboardCommentDAO {
	private static FreeboardCommentDAO instance = new FreeboardCommentDAO();
	private FreeboardCommentDAO(){ }
	public static FreeboardCommentDAO getInstance(){ return instance; }
	
	public void insertComment(SqlSession mapper, FreeboardCommentVO vo){
		mapper.insert("insertComment", vo);
	}
	
	public ArrayList<FreeboardCommentVO> commentList(SqlSession mapper, int idx){
		return (ArrayList<FreeboardCommentVO>) mapper.selectList("selectComment", idx);
	}
	
	public void DeleteComment(SqlSession mapper, int idx){
		mapper.delete("deleteComment", idx);
	}
	
	public void UpdateComment(SqlSession mapper, FreeboardCommentVO vo){
		mapper.update("updateComment", vo);
	}
	
	public int commentCount(SqlSession mapper, int idx) {
		return (int) mapper.selectOne("commentCount", idx);
	}
}
