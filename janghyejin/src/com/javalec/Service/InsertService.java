package com.javalec.Service;

import org.apache.ibatis.session.SqlSession;

import com.javalec.DAO.AlbumboardCommentDAO;
import com.javalec.DAO.AlbumboardDAO;
import com.javalec.DAO.FreeboardCommentDAO;
import com.javalec.DAO.FreeboardDAO;
import com.javalec.DAO.GuestbookDAO;
import com.javalec.DAO.MemberDAO;
import com.javalec.VO.AlbumboardCommentVO;
import com.javalec.VO.AlbumboardVO;
import com.javalec.VO.FreeboardCommentVO;
import com.javalec.VO.FreeboardVO;
import com.javalec.VO.GuestBookVO;
import com.javalec.VO.MemberVO;
import com.javalec.mybatis.MySession;

public class InsertService {
	private static InsertService instance = new InsertService();
	public InsertService(){}
	public static InsertService getInstance() { return instance; }
	
	public void insertMember(MemberVO vo){
		SqlSession mapper = MySession.getSession();
		MemberDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void insertGuest(GuestBookVO vo){
		SqlSession mapper = MySession.getSession();
		GuestbookDAO.getInstance().insertGuest(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void insertFreeboard(FreeboardVO vo){
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().insertFreeboard(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void insertComment(FreeboardCommentVO vo){
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO.getInstance().insertComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void insertAlbumboard(AlbumboardVO vo){
		SqlSession mapper = MySession.getSession();
		AlbumboardDAO.getInstance().AlbumboardInsert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void insertAlbumComment(AlbumboardCommentVO vo){
		SqlSession mapper = MySession.getSession();
		AlbumboardCommentDAO.getInstance().insertAlbumComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
}
