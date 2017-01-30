package com.ewsoft.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.views.JsonView;

@Controller
public class IndexController extends BaseController{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected final Log logger = LogFactory.getLog(getClass());

    @RequestMapping(value="backend/index.php")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
    	logger.debug("what is it??????? index");
        return new ModelAndView("index");
    }
    @RequestMapping(value="ajaxError")
	public Object ajaxError(HttpServletRequest request, HttpServletResponse res, Exception ex){
    	logger.debug("come here base ajaxError!!!!!!!!!!!!!!!!!!!");
		Map<String, Object> map1 = new HashMap<>();
		map1.put("status", "n");
		map1.put("msg", ex.getMessage());
		return JsonView.Render(map1, res);
	}
}
