package com.mgsoft.module.admin.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.admin.beans.RoleMaster;
import com.mgsoft.module.admin.beans.UserMaster;
import com.mgsoft.module.admin.repository.RoleMasterRepository;
import com.mgsoft.module.admin.repository.UserRepository;

@Controller
@RequestMapping(value = "/app/admin/userMaster")
public class UserMasterController {
	/// admin/menuSetting
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	RoleMasterRepository roleMasterRepository;

	@RequestMapping(value = "")
	public ModelAndView showUserSetting(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("allUsers", userRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/userMaster/userMasterList");
		return modelAndView;
	}

	@RequestMapping(value = "/userMasterFrom")
	public String showForm(HttpServletRequest request, HttpServletResponse response) {
		// request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		UserMaster rm = null;
		if (!flag.equalsIgnoreCase("N")) {
			String rid = request.getParameter("userid");
			rm = userRepository.getOne(Long.parseLong(rid));
			request.setAttribute("flag", flag);
			request.setAttribute("user", rm);
		} else {
			request.setAttribute("flag", flag);
			request.setAttribute("user", new UserMaster());
		}
		request.setAttribute("roleList", roleMasterRepository.findAll());
		return "admin/userMaster/userMasterForm";
	}

	@PostMapping(value = "/saveUpdateDeleteUser")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteUser(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("userId"));
		String userName = request.getParameter("userName");
		String userNameOl = request.getParameter("userNameOl");
		String address = request.getParameter("userAddress");
		String email = request.getParameter("userEmail");
		String contact = request.getParameter("userContact");
		String status = request.getParameter("userStatus");
		String flag = request.getParameter("flag");
		String loginName = request.getParameter("userLoginName");
		String loginPassword = request.getParameter("userLoginPassword");
		String[] userRoles = request.getParameterValues("userRoles[]");
		
		UserMaster user = null;
		if(flag.equalsIgnoreCase("N")) {
			 user = new UserMaster();
		}else {
			 user = userRepository.getOne(id);
		}
		user.setUserName(userName);
		user.setUserNameOl(userNameOl);
		user.setUserAddress(address);
		user.setUserEmail(email);
		user.setUserContact(contact);
		user.setUserLoginName(loginName);
		user.setUserLoginPassword(loginPassword);
		user.setUserStatus(status);
		
		Set<RoleMaster> roles = new HashSet<RoleMaster>();
		if(userRoles.length>0) {
			for (int i = 0; i < userRoles.length; i++) {
				RoleMaster rm = roleMasterRepository.getOne(Long.parseLong(userRoles[i]));
				rm.getUsers().add(user);
				roles.add(rm);
			}
		}
		
		user.setRoles(roles);
		
		if (flag.equals("D")) {
			userRepository.delete(user);
			res.put("status", "success");
			res.put("msg", "Successfully deleted user entry !");
		} else if (flag.equals("N")) {
			UserMaster moRes = userRepository.save(user);
			if (moRes != null) {
				res.put("status", "success");
				res.put("msg", "Successfully save user entry !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to save user entry !");
			}

		} else {
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
