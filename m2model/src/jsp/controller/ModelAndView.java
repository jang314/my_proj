package jsp.controller;

import java.util.HashMap;
import java.util.Map;

public class ModelAndView {
	private Map<String, Object> model = new HashMap<String, Object>();
	private String viewName ;	

	public ModelAndView() {}
	
	public ModelAndView(String viewName) {
		setViewName(viewName);
	}
	
	public ModelAndView(String viewName, String key, Object obj) {
		setViewName(viewName);
		addObject(key, obj);
	}
	
	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public Map<String, Object> getModel() {
		return model;
	}

	public void setModel(Map<String, Object> model) {
		this.model = model;
	}
	
	public void addObject(String key, Object obj) {
		model.put(key, obj);
	}
}
