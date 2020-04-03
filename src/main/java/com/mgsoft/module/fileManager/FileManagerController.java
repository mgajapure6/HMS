package com.mgsoft.module.fileManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/fm")
public class FileManagerController {
	
	@RequestMapping(value= "")
	public ModelAndView showSalesDashboard(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("fileManager/fileManager");
		return modelAndView;
	}

}
