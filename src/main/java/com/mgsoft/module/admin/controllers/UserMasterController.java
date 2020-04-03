package com.mgsoft.module.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.admin.beans.UserMaster;
import com.mgsoft.module.admin.repository.UserRepository;

@Controller
@RequestMapping(value="/app/admin/userMaster")
public class UserMasterController {
	///admin/menuSetting
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showUserSetting(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("allUsers", userRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/userSetting");
		return modelAndView;
	}

	@PostMapping(value = "/saveUpdateDeleteUser")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteUser(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("userId"));
		String userName = request.getParameter("userName");
		String userNameOl = request.getParameter("userNameOl");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		String loginName = request.getParameter("loginName");
		String loginPassword = request.getParameter("loginPassword");
		
		
		UserMaster user = new UserMaster();
		user.setId(id);
		user.setUserName(userName);
		user.setUserNameOl(userNameOl);
		user.setAddress(address);
		user.setEmail(email);
		user.setContact(contact);
		user.setLoginName(loginName);
		user.setLoginPassword(loginPassword);
		user.setStatus(status);
		
		if (flag.equals("D")) {
			userRepository.delete(user);
			res.put("status", "success");
			res.put("msg", "Successfully deleted user entry !");
		} else if (flag.equals("N")){
			
			UserMaster moRes = userRepository.save(user);
			if (moRes != null) {
				res.put("status", "success");
				res.put("msg", "Successfully save user entry !");
			}else {
				res.put("status", "failed");
				res.put("msg", "Failed to save user entry !");
			}
			
		}else {
			UserMaster me = userRepository.save(user);
			if (me != null) {
				res.put("status", "success");
				res.put("msg", "Successfully updated user entry !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to update user entry !");
			}
		}
			
		return res;
	}
}
