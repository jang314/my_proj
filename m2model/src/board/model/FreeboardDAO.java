package board.model;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;


public class FreeboardDAO {
	private static  FreeboardDAO instance = new  FreeboardDAO();
	public  FreeboardDAO(){ }
	public static  FreeboardDAO getInstance(){ return instance; }
	
	public boolean insertBoard(SqlSession mapper, FreeboardVO vo) {
		mapper.insert("insertBoard", vo);
		return true; 
	}
	public int getCount(SqlSession mapper) {
		return (int) mapper.selectOne("getCount");
	}
	
	public ArrayList<FreeboardVO> boardgetList(SqlSession mapper, HashMap<String, Object> hmap) {
		return (ArrayList<FreeboardVO>) mapper.selectList("getBoardList", hmap);
	}
	public ArrayList<FreeboardVO> boardgetNotice(SqlSession mapper) {
		return (ArrayList<FreeboardVO>) mapper.selectList("getBoardNotice");
	}
	public FreeboardVO boardgetView(SqlSession mapper, int idx) {
		return (FreeboardVO) mapper.selectOne("getBoardView", idx);
	}
	public int increment(SqlSession mapper, int idx) {
		return mapper.update("increment", idx);
	}
	public boolean updateBoard(SqlSession mapper, FreeboardVO vo) {
		mapper.update("updateBoard", vo);
		return true;
	}
	public boolean boardDelete(SqlSession mapper, int idx) {
		mapper.delete("deleteBoard", idx);
		return true;
	}
	public int getCountItem(SqlSession mapper, HashMap<String, Object> hmap) {
		return (int) mapper.selectOne("searchCountItem", hmap);
	}
	

	public ArrayList<FreeboardVO> searchItem(SqlSession mapper, HashMap<String, Object> hmap) {
		return (ArrayList<FreeboardVO>) mapper.selectList("searchItemList", hmap);
	}
	public ArrayList<FreeboardVO> searchItems(SqlSession mapper, HashMap<String, Object> hmap) {
		return (ArrayList<FreeboardVO>) mapper.selectList("searchItemsList", hmap);
	}
	public int getCountItems(SqlSession mapper, HashMap<String, Object> hmap) {
		return (int) mapper.selectOne("searchCountItems", hmap);
	}
	
	


	
}
