package com.javalec.ex.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.javalec.ex.model.UploadComment;
import com.javalec.ex.model.UploadFileVO;
import com.javalec.ex.model.UploadVO;

public interface BoardMapper {
			int insertUpload(UploadVO uploadvo);																	//	게시판 글 등록 & 업로드
			int insertUploadFile(UploadFileVO uploadfile);														//	업로드 정보 등록
			int boardCount(HashMap<String, Object> hmap);												//	전체 글 갯수							
			ArrayList<UploadVO> selectList(HashMap<String, Object> hmap);				//	게시판 목록 출력
			ArrayList<UploadVO> selectNotice();																	//	공지글 목록 출력
			UploadVO selectByUploadNo(int uploadno);															//	uploadno로 상세정보 출력
			List<UploadFileVO> selectByUploadFileNo(int uploadno);								//	업로드 정보 출력
			int readCount(int uploadno);																					//	조회수 증가
			UploadFileVO selectUploadFileByUploadFileNo(int uploadfileno);					//	uploadfile정보 출력
			int updateDownloadCount(int uploadfileno);														//	다운로드수 증가
			int updateUpload(UploadVO upload);																		//	업로드 수정
			int updateUploadFile(UploadFileVO file2);															//	업로드 파일 수정
			int deleteUploadFile(int uploadfileno);																	// 업로드 파일 삭제
			int deleteUpload(int uploadno);																				//	업로드 삭제
			int insertComment(UploadComment comment);												//	댓글 등록하기
			int commentCount(int uploadno);																			// 댓글 수
			ArrayList<UploadComment> commentList(HashMap<String, Object> hmap);		// 댓글목록
			int updateComment(UploadComment comment);												//	댓글 수정하기
			int deleteComment(UploadComment comment);												//	댓글 삭제하기
}
