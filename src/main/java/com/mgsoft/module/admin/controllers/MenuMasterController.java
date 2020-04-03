package com.mgsoft.module.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.beans.Module;
import com.mgsoft.module.admin.repository.MenuRepository;
import com.mgsoft.module.admin.repository.ModuleRepository;

@Controller
@RequestMapping(value="/app/admin/menuMaster")
public class MenuMasterController {
	///admin/menuSetting
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Autowired
	private ModuleRepository moduleRepository; 
	
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
		request.setAttribute("allMenus", menuRepository.findAll(Sort.by(Sort.Direction.DESC, "id")));
		request.setAttribute("moduleList", moduleRepository.findAll(Sort.by(Sort.Direction.DESC, "id")));
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("admin/menuSetting");
		return modelAndView;
	}

	@PostMapping(value = "/saveUpdateDeleteMenu")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteModule(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("menuId"));
		String menuName = request.getParameter("menuName");
		String menuNameOl = request.getParameter("menuNameOl");
		Long moduleId = Long.parseLong(request.getParameter("moduleId"));
		String moduleName = request.getParameter("moduleName");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		String pageUrl = request.getParameter("pageUrl");
		
		Module module = moduleRepository.getOne(moduleId);
		Menu menu = null;
		
		if(flag.equalsIgnoreCase("N")) {
			menu = new Menu();
			menu.setId((long) 0);
		}else {
			menu = menuRepository.getOne(id);
			
		}
		System.out.println(" module id:"+module.getId());
		System.out.println(" menu module id:"+menu.getModule().getId());
		menu.setMenuName(menuName);
		menu.setMenuNameOl(menuNameOl);
		menu.setParentId(moduleId);
		menu.setParentName(moduleName);
		menu.setHasLink(true);
		menu.setStatus(status);
		menu.setLink(pageUrl);
		
		if (flag.equalsIgnoreCase("D")) {
			menuRepository.deleteById(id);
			res.put("status", "success");
			res.put("msg", "Successfully deleted menu entry !");
		} else if (flag.equalsIgnoreCase("N")){
			menu.setModule(module);
			module.getMenus().add(menu);
			Module moRes = moduleRepository.save(module);
			if (moRes != null) {
				res.put("status", "success");
				res.put("msg", "Successfully save menu entry !");
			}else {
				res.put("status", "failed");
				res.put("msg", "Failed to save menu entry !");
			}
		}else {
			System.out.println(" module id:"+module.getId());
			System.out.println(" menu module id:"+menu.getModule().getId());
			
			if(module.getId()==menu.getModule().getId()) {
				Menu me = menuRepository.save(menu);
				if (me != null) {
					res.put("status", "success");
					res.put("msg", "Successfully updated menu entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update menu entry !");
				}
			}else {
				Module oMdule = menu.getModule();
				oMdule.getMenus().remove(menu);
				moduleRepository.save(oMdule);
				menu.setModule(module);
				module.getMenus().add(menu);
				Module moRes = moduleRepository.save(module);
				if (moRes != null) {
					res.put("status", "success");
					res.put("msg", "Successfully save menu entry !");
				}else {
					res.put("status", "failed");
					res.put("msg", "Failed to save menu entry !");
				}
			}
		}
			
		return res;
	}
}
