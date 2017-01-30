package com.ewsoft.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.domain.Staff;

@Controller
public class LoginController extends BaseController{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected final Log logger = LogFactory.getLog(LoginController.class);

    @RequestMapping(value="login.php")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
    	logger.debug("what is it??????? login");
    	Staff staff = new Staff();
    	request.getSession().setAttribute("LoginUser", staff);
        return new ModelAndView("index");
    }
}
