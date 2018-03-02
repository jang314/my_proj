package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.FreeboardDAO;
import board.model.FreeboardVO;
import jsp.controller.AbstractController;
import jsp.controller.ModelAndView;
import jsp.mybatis.MySession;

public class BoardUpdate extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper =MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		FreeboardVO vo = FreeboardDAO.getInstance().boardgetView(mapper, idx);
		
		ModelAndView mav = new ModelAndView("/view/board/update.jsp");
		mav.addObject("vo", vo);
		mav.addObject("currentPage", currentPage);
		mapper.close();
		return mav;
	}

}
