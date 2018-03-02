package com.javalec.Service;

import org.apache.ibatis.session.SqlSession;

import com.javalec.DAO.AlbumboardCommentDAO;
import com.javalec.DAO.AlbumboardDAO;
import com.javalec.DAO.FreeboardCommentDAO;
import com.javalec.DAO.FreeboardDAO;
import com.javalec.DAO.GuestbookDAO;
import com.javalec.DAO.MemberDAO;
import com.javalec.VO.FreeboardCommentVO;
import com.javalec.VO.GuestBookVO;
import com.javalec.VO.MemberVO;
import com.javalec.mybatis.MySession;

public class DeleteService {
	private static DeleteService instance = new DeleteService();
	private DeleteService(){ }
	public static DeleteService getInstance(){ return instance; }
	
	public void DeleteMember(MemberVO vo){
		SqlSession mapper = MySession.getSession();
		MemberDAO.getInstance().delete(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void DeleteGuest(int idx){
		SqlSession mapper = MySession.getSession();
		GuestbookDAO.getInstance().deleteGuest(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void DeleteBoard(int idx){
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().DeleteBoard(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void DeleteComment(int idx){
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO.getInstance().DeleteComment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void DeleteAlbum(int idx){
		SqlSession mapper = MySession.getSession();
		AlbumboardDAO.getInstance().DeleteAlbum(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void DeleteAlbumComment(int idx){
		SqlSession mapper = MySession.getSession();
		AlbumboardCommentDAO.getInstance().DeleteAlbumComment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
}
