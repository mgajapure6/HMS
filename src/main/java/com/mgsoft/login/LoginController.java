package com.mgsoft.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
@RequestMapping(value = "/login")
public class LoginController {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleMasterRepository roleMasterRepository;

	@RequestMapping(value = "")
	public ModelAndView callLoginPage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("loggedUser", null);
		session.setAttribute("loggedUserRoles", null);
		ModelAndView model = new ModelAndView();
		model.setViewName("login/LoginForm");
		return model;
	}

	@PostMapping(value = "/doLogin")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		String loginName = request.getParameter("loginName");
		String loginPassword = request.getParameter("loginPassword");
		try {
			UserMaster user = userRepository.findByUserLoginNameAndUserLoginPassword(loginName, loginPassword);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedUser", user);
				session.setAttribute("loggedUserRoles", user.getRoles());
				res.put("status", "success");
				res.put("msg", "Login Successful.");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("loggedUser", null);
				session.setAttribute("loggedUserRoles", null);
				res.put("status", "error");
				res.put("msg", "Incorrect User Name or Password.");
			}
		} catch (Exception e) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", null);
			session.setAttribute("loggedUserRoles", null);
			res.put("status", "error");
			res.put("msg", "Login User Does Not Exists.");
		}
		return res;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("loggedUser", null);
		session.setAttribute("loggedUserRoles", null);
		return "redirect:/login";
	}
}
