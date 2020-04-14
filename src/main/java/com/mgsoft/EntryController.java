package com.mgsoft;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.beans.Module;
import com.mgsoft.module.admin.beans.RoleMaster;
import com.mgsoft.module.admin.beans.RoleRights;
import com.mgsoft.module.admin.repository.ModuleRepository;
import com.mgsoft.module.admin.repository.RoleMasterRepository;
import com.mgsoft.util.JsonUtil;

@Controller
public class EntryController {

	@Autowired
	private ModuleRepository moduleRepository;
	
	@Autowired
	RoleMasterRepository roleMasterRepository;

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
	
	@RequestMapping(value = "/app/index")
	public ModelAndView verticleLayout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("is session null::"+request.getSession().getAttribute("loggedUser")==null);
		ModelAndView modelAndView = new ModelAndView();
		
		String activeLink = request.getParameter("activeLink")==null || request.getParameter("activeLink").equals("")?"/dashboard/s":request.getParameter("activeLink");
		String eleClass = request.getParameter("eleClass")==null || request.getParameter("eleClass").equals("")?"m_link_0":request.getParameter("eleClass");
		String activeLinkLiClass = request.getParameter("activeLinkLiClass")==null || request.getParameter("activeLinkLiClass").equals("")?"moduleLi_1":request.getParameter("activeLinkLiClass");
		
		request.setAttribute("activeLink",activeLink );
		request.setAttribute("activeLinkClass", eleClass);
		request.setAttribute("activeLinkLiClass", activeLinkLiClass);
		request.setAttribute("VorH","V" );
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Set<RoleMaster> rmList =  (Set<RoleMaster>) session.getAttribute("loggedUserRoles");//roleMasterRepository.getOne((long) 63);
		
		List<Module> allModules = moduleRepository.findAll(Sort.by(Sort.Direction.ASC, "id"));
		
		Set<Module> rightsModule = new HashSet<>();
		
		for (RoleMaster rm : rmList) {
			for (RoleRights rr : rm.getRoleMasterRights()) {
				Module m = allModules.stream().filter(mo->mo.getId().equals(rr.getModuleId()) && rr.getModuleView()).findAny().orElse(null);
				if(m != null) {
					if(rightsModule.stream().anyMatch(om->om.getId().equals(m.getId()))) {
						Optional<Module> omodule = rightsModule.stream().filter(om->om.getId().equals(m.getId())).findFirst();
						Menu menu = m.getMenus().stream().filter(me->me.getId().equals(rr.getMenuId()) && rr.getMenuView()).findAny().orElse(null);
						if(menu != null) {
							menu.setViewRight(rr.getMenuView());
							menu.setAddRight(rr.getMenuAdd());
							menu.setEditRight(rr.getMenuEdit());
							menu.setDelRight(rr.getMenuDelete());
							omodule.get().getMenus().add(menu);
						}
					}else {
						Module nm = new Module();
						nm.setId(m.getId());
						nm.setLink(m.getLink());
						nm.setHasLink(m.isHasLink());
						nm.setModuleName(m.getModuleName());
						nm.setModuleIcon(m.getModuleIcon());
						nm.setSrNo(m.getSrNo());
						nm.setModuleCssClasses(m.getModuleCssClasses());
						nm.setViewRight(rr.getModuleView());
						nm.setAddRight(rr.getModuleAdd());
						nm.setEditRight(rr.getModuleEdit());
						nm.setDelRight(rr.getModuleDelete());
						Menu menu = m.getMenus().stream().filter(me->me.getId().equals(rr.getMenuId())).findAny().orElse(null);
						if(menu != null) {
							menu.setViewRight(rr.getMenuView());
							menu.setAddRight(rr.getMenuAdd());
							menu.setEditRight(rr.getMenuEdit());
							menu.setDelRight(rr.getMenuDelete());
							nm.getMenus().add(menu);
							rightsModule.add(nm);
						}
						
					}
				}
			}
		}
		
		System.out.println("rightsModule::"+JsonUtil.convertToJson(rightsModule));
		
		request.setAttribute("menu", rightsModule.stream().sorted(Comparator.comparing(Module::getSrNo)).collect(Collectors.toList()));
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
