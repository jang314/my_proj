package board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.FreeboardDAO;
import jsp.controller.AbstractController;
import jsp.controller.ModelAndView;
import jsp.mybatis.MySession;

public class BoardDeleteAction extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		Map<String, String> result = new HashMap<String, String>();
		if(FreeboardDAO.getInstance().boardDelete(mapper, idx)){
			result.put("msg", idx + "번 게시물이 삭제되었습니다.");
			result.put("url", "BoardList.do");
			mapper.commit();
			mapper.close();
		}else {
			result.put("msg", "글 삭제 실패!");
			result.put("url", "javascript:history.back();");
		}
		return new ModelAndView("/view/result.jsp", "result", result);
	}

}
