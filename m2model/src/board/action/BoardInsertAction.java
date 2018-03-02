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

public class BoardInsertAction extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String title = request.getParameter("title");
				String tmpNotice =request.getParameter("notice");
				String content = request.getParameter("content");
				int notice = 0;

				Map<String, String> result = new HashMap<>();

				if(tmpNotice != null) {
						try {
								notice = Integer.parseInt(request.getParameter(tmpNotice)) ;
						}catch(Exception e) {
								result.put("msg", "넘어오는 값이 숫자가 아닙니다.");
								result.put("url","javascript:history.back();");
								return new ModelAndView("view/result.jsp", "result", result);
						}
				}
				
				FreeboardVO vo = new FreeboardVO();
				vo.setId(id);
				vo.setName(name);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setNotice(notice);
				
				SqlSession mapper = MySession.getSession();
				if(FreeboardDAO.getInstance().insertBoard(mapper, vo)) {
					mapper.commit();
					mapper.close();
					return new ModelAndView("redirect:BoardList.do");
				}else {
					result.put("msg", "게시물 등록 실패");
					result.put("url", "javascript:history.back();");
					return new ModelAndView("/view/result.jsp","result", result);
				}
		}
}
