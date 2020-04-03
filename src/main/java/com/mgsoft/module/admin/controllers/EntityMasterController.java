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

import com.mgsoft.module.admin.beans.EntityMaster;
import com.mgsoft.module.admin.repository.EntityRepository;

@Controller
@RequestMapping(value="/app/admin/entityMaster")
public class EntityMasterController {
	///admin/menuSetting
	
	@Autowired
	EntityRepository entityRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showMenuSetting(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		
		request.setAttribute("allEntityMasters", entityRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/entitySetting");
		return modelAndView;
	}

	@PostMapping(value = "/saveUpdateDeleteEntity")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("id"));
		String entityName = request.getParameter("entityName");
		String entityNameOl = request.getParameter("entityNameOl");
		String entityAddress = request.getParameter("entityAddress");
		String entityEmail = request.getParameter("entityEmail");
		String entityContact = request.getParameter("entityContact");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		
		EntityMaster entity = new EntityMaster();
		entity.setId(id);
		entity.setEntityName(entityName);
		entity.setEntityNameOl(entityNameOl);
		entity.setEntityAddress(entityAddress);
		entity.setEntityEmail(entityEmail);
		entity.setEntityContact(entityContact);
		entity.setStatus(status);
		
		
		//System.out.println(">>>"+menu);
		if (flag.equals("D")) {
			entityRepository.delete(entity);
			res.put("status", "success");
			res.put("msg", "Successfully deleted entity entry !");
		} else if (flag.equals("N")){
			System.out.println("New>>"+entity);
			EntityMaster moRes = entityRepository.save(entity);
			if (moRes != null) {
				res.put("status", "success");
				res.put("msg", "Successfully save entity entry !");
			}else {
				res.put("status", "failed");
				res.put("msg", "Failed to save entity entry !");
			}
			
		}else {
			EntityMaster me = entityRepository.save(entity);
			if (me != null) {
				res.put("status", "success");
				res.put("msg", "Successfully updated entity entry !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to update entity entry !");
			}
		}
			
		return res;
	}
}
