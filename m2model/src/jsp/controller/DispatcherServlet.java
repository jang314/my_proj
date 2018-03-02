package jsp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
//@WebServlet(value="*.do", loadOnStartup=-1)
public class DispatcherServlet extends HttpServlet {
	
	private static Logger logger = Logger.getLogger(DispatcherServlet.class);
	private Map<String, AbstractController> actionMap = new HashMap<String, AbstractController>();
	
	public DispatcherServlet() {
		
	}
	
	@Override
	public void destroy() {
	}
	
	@Override
	public void init() throws ServletException {
		String props = this.getClass().getResource("dispatcher.properties").getPath();
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			f = new FileInputStream(props);
			pr.load(f);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(f != null) try { f.close(); }catch(Exception e) {}
		}
		
		Iterator keyiter = pr.keySet().iterator();
		
		while(keyiter.hasNext()) {	
			String actionName = ((String)keyiter.next()).trim();		
			String className = (String)(pr.getProperty(actionName));	
			
			try {
				Class actionClass = Class.forName(className);		
				AbstractController controller = (AbstractController) actionClass.newInstance();
				actionMap.put(actionName, controller);	
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String action = requestURI.substring(request.getContextPath().length());
		logger.info(action);
		
		AbstractController controller = null;
		ModelAndView mav = null;
		
		controller = actionMap.get(action);
		mav =controller.handleRequestInternal(request, response);
		
		if(mav!=null) {
			if(mav.getViewName().substring(0, "redirect:".length()).equals("redirect:")) {
				response.sendRedirect(mav.getViewName().substring("redirect:".length()));
				return ;
			}
			
			Map<String, Object> model = mav.getModel();
			for(String key : model.keySet()) {
				request.setAttribute(key, model.get(key));
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(mav.getViewName());
			dispatcher.forward(request, response);
		}else {
			logger.info("DispatcherServlet에서 길을 잃음.");
		}
	}
}
