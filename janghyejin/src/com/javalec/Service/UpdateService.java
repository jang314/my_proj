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

public class UpdateService {
	private static UpdateService instance = new UpdateService();
	private  UpdateService() {}
	public static UpdateService getInstance(){ return instance; }
	
	public void UpdateMember(MemberVO vo){
		SqlSession mapper = MySession.getSession();
		MemberDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
		}
	
	public void updateGuest(GuestBookVO vo){
		SqlSession mapper = MySession.getSession();
		GuestbookDAO.getInstance().updateGuest(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public int increment(int idx){
		SqlSession mapper = MySession.getSession();
		int result = FreeboardDAO.getInstance().increment(mapper, idx);
//		System.out.println(result);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public int hit(int idx){
		SqlSession mapper = MySession.getSession();
		int result = AlbumboardDAO.getInstance().hit(mapper, idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public void UpdateBoard(FreeboardVO vo){
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().updateBoard(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void UpdateComment(FreeboardCommentVO vo){
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO.getInstance().UpdateComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void UpdateAlbumComment(AlbumboardCommentVO vo){
		SqlSession mapper = MySession.getSession();
		AlbumboardCommentDAO.getInstance().UpdateAlbumComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void UpdateAlbum(AlbumboardVO vo){
		SqlSession mapper =MySession.getSession();
		AlbumboardDAO.getInstance().UpdateAlbum(mapper, vo);
		mapper.commit();
		mapper.close();
	}
}
