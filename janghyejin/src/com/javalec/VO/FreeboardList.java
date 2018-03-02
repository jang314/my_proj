package com.javalec.VO;

import java.util.ArrayList;

public class FreeboardList {
		
	private ArrayList<FreeboardVO> list = new ArrayList<>();
		
	private int pageSize ; 		// 한 페이지에 표시할 글의 개수
	private int totalCount;		// 테이블에 저장된 글의 전체 개수
	private int totalPage;		//	전체 페이지 개수
	private int currentPage; // 현재 화면에 표시할 페이지 번호
	private int startNo;			// 화면에 표시할 글의 시작 인덱스
	private int endNo;			// 화면에 표시할 글의 마지막 인덱스
	private int startPage;		// 화면에 표시할 페이지 하이퍼링크의 시작인덱스
	private int endPage;			// 화면에 표시할 페이지 하이퍼링크의 마지막 인덱스
	
	public FreeboardList(){ }
	
	public FreeboardList(int pageSize, int totalCount, int currentPage){
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculation();
	}

	private void calculation() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}

	public ArrayList<FreeboardVO> getList() {
		return list;
	}

	public void setList(ArrayList<FreeboardVO> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "FreeboardList [list=" + list + "]";
	}
}
