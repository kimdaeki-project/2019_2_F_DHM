package com.f.dhm.hc;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CatchErrorController implements ErrorController{
	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return null;
	}
	
	 @RequestMapping("/error")
	    public String handleError(HttpServletRequest request) {
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	        Integer erCode = Integer.parseInt(status.toString());
	        
	        String path = "/erPage/error404";
	        if (erCode == 400) {
				path = "/erPage/error400";
			}else if(erCode == 500) {
				path = "/erPage/error500";
			}
	        
	        return path;
	    }
}
