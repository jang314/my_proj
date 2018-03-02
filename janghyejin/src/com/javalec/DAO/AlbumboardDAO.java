package com.javalec.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.javalec.VO.AlbumboardVO;

public class AlbumboardDAO {
		private static AlbumboardDAO instance = new AlbumboardDAO();
		private AlbumboardDAO(){ }
		public static AlbumboardDAO getInstance(){ return instance;	}
		
		public void AlbumboardInsert(SqlSession mapper, AlbumboardVO vo){
			mapper.insert("albumInsert", vo);
		}
		
		public int albumCount(SqlSession mapper){
			return (int) mapper.selectOne("albumCount");
		}
		
		public ArrayList<AlbumboardVO> albumlist(SqlSession mapper, HashMap<String, Integer> hmap){
			return (ArrayList<AlbumboardVO>) mapper.selectList("albumList", hmap);
		}
		
		public ArrayList<AlbumboardVO> albumhit(SqlSession mapper, HashMap<String, Integer> hmap){
			return (ArrayList<AlbumboardVO>) mapper.selectList("albumHit", hmap);
		}
		
		public int hit(SqlSession mapper, int idx){
			return mapper.update("hit", idx);
		}
		
		public AlbumboardVO albumByIdx(SqlSession mapper, int idx){
			return (AlbumboardVO) mapper.selectOne("albumByIdx", idx);
		}
		
		public void UpdateAlbum(SqlSession mapper, AlbumboardVO vo){
			mapper.update("updateAlbum", vo);
		}
		
		public void DeleteAlbum(SqlSession mapper, int idx){
			mapper.delete("deleteAlbum", idx);
		}
}
