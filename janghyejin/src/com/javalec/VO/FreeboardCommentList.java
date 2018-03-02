package com.javalec.VO;

import java.util.ArrayList;

public class FreeboardCommentList {
		ArrayList<FreeboardCommentVO> list ;

		public ArrayList<FreeboardCommentVO> getList() {
			return list;
		}

		public void setList(ArrayList<FreeboardCommentVO> list) {
			this.list = list;
		}

		@Override
		public String toString() {
			return "FreeboardCommentList [list=" + list + "]";
		}
}
