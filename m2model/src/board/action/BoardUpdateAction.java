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

public class BoardUpdateAction extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		SqlSession mapper = MySession.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tmpNotice = request.getParameter("tmpNotice");
		int notice = 0;
		if(tmpNotice!=null) {
			notice = Integer.parseInt(request.getParameter(tmpNotice));
		}
		System.out.println(notice);
		FreeboardVO vo = new FreeboardVO();
		vo.setIdx(idx);
		vo.setId(id);
		vo.setName(name);
		vo.setNotice(notice);
		vo.setTitle(title);
		vo.setContent(content);
		System.out.println(vo);
		
		Map<String, String> result = new HashMap<>();
		if(FreeboardDAO.getInstance().updateBoard(mapper, vo)) {
			mapper.commit();
			mapper.close();
			return new ModelAndView("redirect:BoardView.do?idx=" + vo.getIdx()+"&currentPage="+currentPage);
		}else {
			result.put("msg", "글 수정 실패!");
			result.put("url", "javascript:history.back();");
			mapper.close();
			return new ModelAndView("/view/result.jsp", "result", result);
		}
	}
}
