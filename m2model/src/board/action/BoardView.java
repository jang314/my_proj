package board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.FreeboardDAO;
import board.model.FreeboardVO;
import jsp.controller.AbstractController;
import jsp.controller.ModelAndView;
import jsp.mybatis.MySession;

public class BoardView extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		System.out.println(idx);
//		System.out.println(currentPage);
		
		int increment = FreeboardDAO.getInstance().increment(mapper, idx);
		
		if(increment==1) {
			FreeboardVO vo =  FreeboardDAO.getInstance().boardgetView(mapper, idx);
			ModelAndView mav = new ModelAndView("view/board/content.jsp");
			mav.addObject("currentPage", currentPage);
			mav.addObject("vo", vo);
			mapper.commit();
			mapper.close();
			return mav;
		}else {
			Map<String, String>result = new HashMap<String, String>();
			result.put("msg", "해당하는 번호의 게시물의 존재하지 않습니다. ");
			result.put("url", "redirect:BoardList.do?currentPage=" + currentPage);
			return new ModelAndView("/view/result.jsp", "result", result);
		}
	}
}
