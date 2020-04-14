package com.mgsoft.module.setting.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/app/setting/hospitalMaster")
public class HospitalMasterController {
	
	@RequestMapping(value = "")
	public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("settings/hospitalMaster/hospitalMasterForm");
		return modelAndView;
	}

}
