package com.ewsoft.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.ewsoft.exception.AjaxRequestException;
import com.ewsoft.exception.BusinessException;
import com.ewsoft.exception.ParameterException;

public class BaseController  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Logger log = Logger.getLogger(BaseController.class);

	@ExceptionHandler
	public String exp(HttpServletRequest request, HttpServletResponse res, Exception ex) throws IOException {
		log.debug("come here base controller!!!!!!!!!!!!!!!!!!!");
		request.setAttribute("exception", ex);
		if (ex instanceof BusinessException) {
			return "error-business";
		} else if(ex instanceof ParameterException) {
			return "error-parameter";
		}  else if(ex instanceof AjaxRequestException) {
			return "ajaxError";
		} else return "error";
	}
}
