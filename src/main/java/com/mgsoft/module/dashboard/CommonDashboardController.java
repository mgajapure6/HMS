package com.mgsoft.module.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/app/dashboard")
public class CommonDashboardController {
	
	@RequestMapping(value= "/s")
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
		modelAndView.setViewName("dashboard/SalesDashboard");
		return modelAndView;
	}

	@RequestMapping(value= "/w")
	public ModelAndView showWebAnalyticDashboard(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("dashboard/WebAnalyticDashboard");
		return modelAndView;
	}
	@RequestMapping(value= "/c")
	public ModelAndView showCryptocurrencyDashboard(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("dashboard/CryptocurrencyDashboard");
		return modelAndView;
	}
	@RequestMapping(value= "/h")
	public ModelAndView showHelpdeskDashboard(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("dashboard/HelpdeskDashboard");
		return modelAndView;
	}
}
