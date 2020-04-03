package com.mgsoft.module.admin.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.admin.repository.MenuRepository;
import com.mgsoft.module.admin.repository.UserRepository;

@Controller
@RequestMapping(value="/app/admin/roleMaster")
public class RoleMasterController {
	///admin/menuSetting
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	MenuRepository menuRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showMenuSetting(HttpServletRequest request, HttpServletResponse response) {
				
		request.setAttribute("allUsers", userRepository.findAll());
		request.setAttribute("allMenus", menuRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/roleSetting");
		return modelAndView;
	}

}
