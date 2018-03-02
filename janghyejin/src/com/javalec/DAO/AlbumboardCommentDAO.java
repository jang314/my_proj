package com.javalec.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.AlbumboardCommentVO;

public class AlbumboardCommentDAO {
		private static AlbumboardCommentDAO instance = new AlbumboardCommentDAO();
		public AlbumboardCommentDAO(){}
		public static AlbumboardCommentDAO getInstance(){ return instance; }
		
		public void insertAlbumComment(SqlSession mapper, AlbumboardCommentVO vo){
			mapper.insert("insertAlbumComment", vo);
		}
		
		public ArrayList<AlbumboardCommentVO> AlbumCommentList(SqlSession mapper, int idx){
			return (ArrayList<AlbumboardCommentVO>) mapper.selectList("AlbumCommentList", idx);
		}
		
		public void UpdateAlbumComment(SqlSession mapper, AlbumboardCommentVO vo){
			mapper.update("updateAlbumComment", vo);
		}
		
		public void DeleteAlbumComment(SqlSession mapper, int idx){
			mapper.delete("deleteAlbumComment", idx);
		}
}
