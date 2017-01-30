package com.ewsoft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.domain.Staff;
 
/**
 *
 */
public class SessionInterceptor implements HandlerInterceptor {
 
    private Logger logger = Logger.getLogger(SessionInterceptor.class.getName());
 
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object o) throws Exception {
        Staff user=(Staff) req.getSession().getAttribute("LoginUser");
        if(user==null){
            logger.error("user not login");
            res.sendRedirect("/ewsoft/login.html");
            return false;
        }
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, ModelAndView mav) throws Exception {
    }
 
    @Override
    public void afterCompletion(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, Exception excptn) throws Exception {
    }
}
