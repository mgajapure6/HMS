package com.mgsoft.login;

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
@RequestMapping(value = "/app/login")
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	
	
	@RequestMapping(value="")
	public ModelAndView callLoginPage(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("login/LoginForm");
		return model;
	}

	@PostMapping(value = "/checkUserLogin")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		
		String loginName = request.getParameter("loginName");
		String loginPassword = request.getParameter("loginPassword");
		try {
			UserMaster user = userRepository.findByLoginNameAndLoginPassword(loginName, loginPassword);
			
			
			if(user.getId() != null)
				{
				res.put("status", "success");
				res.put("msg", "Login Successful.");
				}
			else
				{
				res.put("status", "error");
				res.put("msg", "Incorrect User Name or Password.");
				}	
		}catch(Exception e)
		{
			res.put("status", "error");
			res.put("msg", "Login User Does Not Exists.");			
		}
		
		return res;
	}
}
