package com.javalec.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.javalec.DAO.AlbumboardCommentDAO;
import com.javalec.DAO.AlbumboardDAO;
import com.javalec.DAO.FreeboardCommentDAO;
import com.javalec.DAO.FreeboardDAO;
import com.javalec.DAO.GuestbookDAO;
import com.javalec.DAO.MemberDAO;
import com.javalec.VO.AlbumboardCommentList;
import com.javalec.VO.AlbumboardList;
import com.javalec.VO.AlbumboardVO;
import com.javalec.VO.FreeboardCommentList;
import com.javalec.VO.FreeboardCommentVO;
import com.javalec.VO.FreeboardList;
import com.javalec.VO.FreeboardVO;
import com.javalec.VO.GuestBookVO;
import com.javalec.VO.GuestbookList;
import com.javalec.VO.MemberList;
import com.javalec.VO.MemberVO;
import com.javalec.VO.Param;
import com.javalec.mybatis.MySession;

public class SelectService {
	private static SelectService instance = new SelectService();
	public SelectService(){ }
	public static SelectService getInstance(){ return instance; }
	
	public MemberVO SelectById(String id){
		SqlSession mapper = MySession.getSession();
		MemberVO vo = MemberDAO.getInstance().selectById(mapper, id);
		mapper.close();
		return vo;
	}
	
	public GuestbookList selectList(int currentPage) {
		SqlSession mapper = MySession.getSession();
		
		int pageSize = 3;
		int totalCount = GuestbookDAO.getInstance().selectCount(mapper);
		
		GuestbookList list = new GuestbookList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		
		ArrayList<GuestBookVO> arrayList = GuestbookDAO.getInstance().selectList(mapper, hmap);
	
		list.setList(arrayList);
		
		mapper.close();
		return list;
	}
	
	public FreeboardList hitList() {
		SqlSession mapper = MySession.getSession();
		FreeboardList list = new FreeboardList();
		ArrayList<FreeboardVO> arraylist = FreeboardDAO.getInstance().hit(mapper);
		list.setList(arraylist);
		mapper.close();
		return list;
	}
	
	public MemberList findId(MemberVO vo){
		SqlSession mapper = MySession.getSession();
		
		MemberList list = new MemberList();
		
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("name", vo.getName());
		hmap.put("phone", vo.getPhone());
		
		ArrayList<MemberVO> arraylist = MemberDAO.getInstance().findId(mapper, hmap);
		list.setList(arraylist);
		mapper.close();
		return list;
	}
	
	public MemberList findPw(MemberVO vo){
		SqlSession mapper = MySession.getSession();
		
		MemberList list = new MemberList();
		
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("id",vo.getId());
		hmap.put("name", vo.getName());
		hmap.put("phone", vo.getPhone());
		
		ArrayList<MemberVO> arraylist = MemberDAO.getInstance().findPw(mapper, hmap);
		list.setList(arraylist);
		mapper.close();
		return list;
		}
	
	public GuestBookVO SelectByIdx(int idx){
		SqlSession mapper = MySession.getSession();
		GuestBookVO vo = GuestbookDAO.getInstance().selectByIdx(mapper, idx);
		mapper.close();
		return vo;
	}
	
	public FreeboardList freeboardList(int currentPage){
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = FreeboardDAO.getInstance().freeboardCount(mapper);
		
		FreeboardList list = new FreeboardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		
		ArrayList<FreeboardVO> arraylist = FreeboardDAO.getInstance().freeboardList(mapper, hmap);
		
		for(FreeboardVO vo : arraylist) {
			vo.setCommentCount(FreeboardCommentDAO.getInstance().commentCount(mapper, vo.getIdx()));
		}
		
		list.setList(arraylist);
		mapper.close();
		return list;
	}
	
	public FreeboardList freeboardList(int currentPage, String item){
		SqlSession mapper = MySession.getSession();
		int pageSize = 10;
		int totalCount = FreeboardDAO.getInstance().freeboardCount(mapper, item);
		System.out.println(item+"�쓣 �룷�븿�븳 湲� :"+totalCount);
		
		FreeboardList list = new FreeboardList(pageSize, totalCount, currentPage);
		
//		HashMap<String,Integer> hmap = new HashMap<>();
//		hmap.put("startNo", list.getStartNo());
//		hmap.put("endNo", list.getEndNo());
		Param param = new Param();
		param.setStartNo(list.getStartNo());//list�뿉 珥덇린�솕�맂  no瑜� �꽆寃⑥��떎.
		param.setEndNo(list.getEndNo());
		param.setItem(item);
		
		list.setList(FreeboardDAO.getInstance().freeboardList(mapper, param));
		mapper.close();
		return list;
	}
	
	public FreeboardVO FreeboardByIdx(int idx){
		SqlSession mapper = MySession.getSession();
		FreeboardVO vo = FreeboardDAO.getInstance().FreeboardByIdx(mapper, idx);
		mapper.close();
		return vo;
	}
	
	public ArrayList<FreeboardVO> selectNotice(){
		SqlSession mapper = MySession.getSession();
		ArrayList<FreeboardVO> notice = FreeboardDAO.getInstance().selectNotice(mapper);
		for(FreeboardVO no : notice) {
			no.setCommentCount(FreeboardCommentDAO.getInstance().commentCount(mapper, no.getIdx()));
		}
		mapper.close();
		return notice;
	}

	public FreeboardCommentList commentList(int idx){
		SqlSession mapper = MySession.getSession();
		FreeboardCommentList list = new FreeboardCommentList();
		list.setList(FreeboardCommentDAO.getInstance().commentList(mapper, idx));
		mapper.close();
		return list;
	}
	
	public AlbumboardCommentList AlbumCommentList(int idx){
		SqlSession mapper = MySession.getSession();
		AlbumboardCommentList list = new AlbumboardCommentList();
		list.setList(AlbumboardCommentDAO.getInstance().AlbumCommentList(mapper, idx));
		mapper.close();
		return list;
	}
	
	public AlbumboardList albumlist(int currentPage){
		SqlSession mapper = MySession.getSession();
		
		int pageSize = 9;
		int totalCount = AlbumboardDAO.getInstance().albumCount(mapper);
		
		AlbumboardList list = new AlbumboardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		
		ArrayList<AlbumboardVO> arraylist = AlbumboardDAO.getInstance().albumlist(mapper, hmap);
		
		list.setList(arraylist);
		
		return list;
	}
	
	
	public AlbumboardList albumhit(int currentPage){
		SqlSession mapper = MySession.getSession();
		
		int pageSize = 5;
		int totalCount = AlbumboardDAO.getInstance().albumCount(mapper);
		
		AlbumboardList list = new AlbumboardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		
		ArrayList<AlbumboardVO> arraylist = AlbumboardDAO.getInstance().albumhit(mapper, hmap);
		
		list.setList(arraylist);
		
		return list;
	}
	
	public AlbumboardVO AlbumByIdx(int idx){
		SqlSession mapper = MySession.getSession();
		AlbumboardVO vo = AlbumboardDAO.getInstance().albumByIdx(mapper, idx);
		mapper.close();
		return vo;
	}

}
