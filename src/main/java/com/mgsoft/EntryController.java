package com.mgsoft;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.repository.MenuRepository;
import com.mgsoft.module.admin.repository.ModuleRepository;

@Controller
public class EntryController {

	@Autowired
	private MenuRepository menuRepository;

	@Autowired
	private ModuleRepository moduleRepository;

	@RequestMapping(value = { "/", "" })
	public ModelAndView entryRedirect(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/lv");
		return modelAndView;
	}

	@RequestMapping(value = "/lh")
	public ModelAndView horizontalLayout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		String activeLink = request.getParameter("activeLink")==null || request.getParameter("activeLink").equals("")?"/dashboard/s":request.getParameter("activeLink");
		String eleClass = request.getParameter("eleClass")==null || request.getParameter("eleClass").equals("")?"m_link_0":request.getParameter("eleClass");
		String activeLinkLiClass = request.getParameter("activeLinkLiClass")==null || request.getParameter("activeLinkLiClass").equals("")?"moduleLi_1":request.getParameter("activeLinkLiClass");
		
		request.setAttribute("activeLink",activeLink );
		request.setAttribute("activeLinkClass", eleClass);
		request.setAttribute("activeLinkLiClass", activeLinkLiClass);
		request.setAttribute("VorH","H" );
		
		request.setAttribute("menu",  moduleRepository.findAll(Sort.by(Sort.Direction.ASC, "moduleName")));
		modelAndView.setViewName("index/Horizontal");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lv")
	public ModelAndView verticleLayout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		
		String activeLink = request.getParameter("activeLink")==null || request.getParameter("activeLink").equals("")?"/dashboard/s":request.getParameter("activeLink");
		String eleClass = request.getParameter("eleClass")==null || request.getParameter("eleClass").equals("")?"m_link_0":request.getParameter("eleClass");
		String activeLinkLiClass = request.getParameter("activeLinkLiClass")==null || request.getParameter("activeLinkLiClass").equals("")?"moduleLi_1":request.getParameter("activeLinkLiClass");
		
		request.setAttribute("activeLink",activeLink );
		request.setAttribute("activeLinkClass", eleClass);
		request.setAttribute("activeLinkLiClass", activeLinkLiClass);
		request.setAttribute("VorH","V" );
		request.setAttribute("menu",  moduleRepository.findAll(Sort.by(Sort.Direction.ASC, "moduleName")));
		modelAndView.setViewName("index/Verticle");
		return modelAndView;
	}
	
	//
	//@RequestMapping(value = "/menu/getSubMenu")
	@ResponseBody
	public String getSubMenu(HttpServletRequest request, HttpServletResponse response) {
		Long parentId=Long.parseLong(request.getParameter("parentId"));
		Long moduleId=Long.parseLong(request.getParameter("moduleId"));
		//String menuType=request.getParameter("menuType");
		List<Menu> menuList = new ArrayList<>();
		//menuList = menuRepository.findAllByModuleIdAndParentMenuId(moduleId, parentId);
		Gson g = new Gson();
		return g.toJson(menuList).toString();
	}


//	public List<Module> loadModuleList() {
//		List<Module> modules = (List<Module>) moduleRepository.findAll();
//		for (Module module : modules) {
//			List<Menu> m1 = menuRepository.findAllByModuleIdAndParentMenuId(module.getId(),(long) 0);
//			if (m1.size() > 0) {
//				for (Menu me1 : m1) {
//					List<Menu> m2 = menuRepository.findAllByModuleIdAndParentMenuId(module.getId(),me1.getId());
//					if (m2.size() > 0) {
//						for (Menu me2 : m2) {
//							List<Menu> m3 = menuRepository.findAllByModuleIdAndParentMenuId(module.getId(),me2.getId());
//							for (Menu me3 : m3) {
//								me3.setSubMenus(new ArrayList<>());
//							}
//							me2.setSubMenus(m3);
//						}
//						me1.setSubMenus(m2);
//					} else {
//						me1.setSubMenus(new ArrayList<>());
//					}
//				}
//				module.setSubMenus(m1);
//			} else {
//				module.setSubMenus(new ArrayList<>());
//			}
//		}
//		
//		Gson gson = new Gson();
//		String jsonList = gson.toJson(modules);
//		System.out.println("jsonList Module :" + jsonList);
//		return modules;
//	}

}
