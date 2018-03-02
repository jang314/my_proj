package board.action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.FreeboardDAO;
import board.model.FreeboardList;
import board.model.FreeboardVO;
import jsp.controller.AbstractController;
import jsp.controller.ModelAndView;
import jsp.mybatis.MySession;

public class BoardList extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		SqlSession mapper = MySession.getSession();
		int pageSize=10;
		int currentPage=1;
		String opt = request.getParameter("opt");
		String item = request.getParameter("item");
		FreeboardList list = null;
				try {
					 currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}catch(Exception e) {
					System.out.println("currentPage못받아옴");
				}
						
				ArrayList<FreeboardVO> notice = FreeboardDAO.getInstance().boardgetNotice(mapper);
				ModelAndView mav = new ModelAndView("/view/board/list.jsp");
				HashMap<String, Object> hmap = new HashMap<>();
				
//				검색기능구현
				if(opt!=null) {
					hmap.put("item", item);
					if(opt.equals("0")) {	
						hmap.put("option", "title");
						int totalCount = FreeboardDAO.getInstance().getCountItem(mapper, hmap);
						list = new FreeboardList(pageSize, totalCount, currentPage);
						hmap.put("startNo", list.getStartNo());
						hmap.put("endNo", list.getEndNo());
						list.setList(FreeboardDAO.getInstance().searchItem(mapper, hmap));
					}else if(opt.equals("1")) {	//	내용으로 검색
						hmap.put("option", "content");
						int totalCount = FreeboardDAO.getInstance().getCountItem(mapper, hmap);
						list = new FreeboardList(pageSize, totalCount, currentPage);
						hmap.put("startNo", list.getStartNo());
						hmap.put("endNo", list.getEndNo());
						list.setList(FreeboardDAO.getInstance().searchItem(mapper, hmap));
					}else if(opt.equals("2")) {		//제목 + 내용으로 검색
						hmap.put("option1", "content");
						hmap.put("option2", "title");
						int totalCount = FreeboardDAO.getInstance().getCountItems(mapper, hmap);
						list = new FreeboardList(pageSize, totalCount, currentPage);
						hmap.put("startNo", list.getStartNo());
						hmap.put("endNo", list.getEndNo());
						list.setList(FreeboardDAO.getInstance().searchItems(mapper, hmap));
					}else if(opt.equals("3")) {		// 글쓴이 (아이디 + 이름) 으로 검색
						hmap.put("option1", "id");
						hmap.put("option2", "name");
						int totalCount = FreeboardDAO.getInstance().getCountItems(mapper, hmap);
						list = new FreeboardList(pageSize, totalCount, currentPage);
						hmap.put("startNo", list.getStartNo());
						hmap.put("endNo", list.getEndNo());
						list.setList(FreeboardDAO.getInstance().searchItems(mapper, hmap));
					}
				}else {
					int totalCount = FreeboardDAO.getInstance().getCount(mapper);
					list = new FreeboardList(pageSize, totalCount, currentPage);
					hmap.put("startNo", list.getStartNo());
					hmap.put("endNo", list.getEndNo());
					ArrayList<FreeboardVO> arraylist = FreeboardDAO.getInstance().boardgetList(mapper, hmap);
					list.setList(arraylist);
				}
				
				mapper.close();
				mav.addObject("list", list);
				mav.addObject("currentPage", list.getCurrentPage());
				mav.addObject("notice", notice);
				return mav;
	}

}
