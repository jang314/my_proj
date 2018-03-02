package com.javalec.VO;

import java.util.ArrayList;

public class AlbumboardCommentList {
		ArrayList<AlbumboardCommentVO> list = new ArrayList();
		
		public ArrayList<AlbumboardCommentVO> getList() {
			return list;
		}

		public void setList(ArrayList<AlbumboardCommentVO> list) {
			this.list = list;
		}

		@Override
		public String toString() {
			return "AlbumboardCommentList [list=" + list + "]";
		}
}
