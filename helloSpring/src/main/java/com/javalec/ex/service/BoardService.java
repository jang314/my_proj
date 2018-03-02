package com.javalec.ex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.mapper.BoardMapper;
import com.javalec.ex.model.UploadComment;
import com.javalec.ex.model.UploadFileVO;
import com.javalec.ex.model.UploadVO;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardmapper;

	public int insertUpload(UploadVO uploadvo) {
		
		int count = boardmapper.insertUpload(uploadvo);
		return count;
	}

	public int insertUploadFile(UploadFileVO uploadfile) {
		int count = boardmapper.insertUploadFile(uploadfile);
		return count;
	}

	public int boardCount(HashMap<String, Object> hmap) {
		int totalCount = boardmapper.boardCount(hmap);
		return totalCount;
	}

	public ArrayList<UploadVO> selectList(HashMap<String, Object> hmap) {
		ArrayList<UploadVO> uploadlist = boardmapper.selectList(hmap); 
		return uploadlist;
	}

	/*	공지글 얻어오기	*/
	public ArrayList<UploadVO> selectNotice() {
		return boardmapper.selectNotice();
	}

	public UploadVO selectByUploadNo(int uploadno) {
		return boardmapper.selectByUploadNo(uploadno);
	}

	public List<UploadFileVO> selectUploadFilesByUploadNo(int uploadno) {
		return boardmapper.selectByUploadFileNo(uploadno);
	}

	/*조회수 증가*/
	public int readCount(int uploadno) {
		int readCount = boardmapper.readCount(uploadno);
		return readCount;
	}

	public UploadFileVO selectUploadFileByUploadFileNo(int uploadfileno) {
		return boardmapper.selectUploadFileByUploadFileNo(uploadfileno);
	}

	/*다운로드 수 증가*/
	public int updateDownloadCount(int uploadfileno) {
			int count = boardmapper.updateDownloadCount(uploadfileno);
			return count;
	}

	public int updateUpload(UploadVO upload) {
		int count = boardmapper.updateUpload(upload);
		return count;
	}

	public int updateUploadFile(UploadFileVO file2) {
		int count = boardmapper.updateUploadFile(file2);
		return count;
	}

	public int deleteUplaod(int uploadno) {
		int count = boardmapper.deleteUpload(uploadno);
		return count;
	}

	public int deleteUploadFile(int uploadfileno) {
		int count = boardmapper.deleteUploadFile(uploadfileno);
		return count;
	}

	public int insertComment(UploadComment comment) {
		int count = boardmapper.insertComment(comment);
		return count;
	}

	public int commentCount(int uploadno) {
		int count = boardmapper.commentCount(uploadno);
		return count;
	}

	public ArrayList<UploadComment> commentList(HashMap<String, Object> hmap) {
		return boardmapper.commentList(hmap);
	}

	public int updateComment(UploadComment comment) {
		int count = boardmapper.updateComment(comment);
		return count;
	}

	public int deleteComment(UploadComment comment) {
		int count = boardmapper.deleteComment(comment);
		return count;
	}
}
