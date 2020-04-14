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
import com.mgsoft.module.admin.beans.RoleRights;
import com.mgsoft.module.admin.repository.ModuleRepository;
import com.mgsoft.module.admin.repository.RoleMasterRepository;
import com.mgsoft.module.admin.repository.RoleRightsRepository;
import com.mgsoft.util.JsonUtil;

@Controller
@RequestMapping(value = "/app/admin/roleMaster")
public class RoleMasterController {
	
	@Autowired
	ModuleRepository moduleRepository;

	@Autowired
	RoleMasterRepository roleMasterRepository;
	
	@Autowired
	RoleRightsRepository roleRightsRepository;

	@RequestMapping(value = "")
	public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("allRoles", roleMasterRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/roleMaster/roleMasterList");
		return modelAndView;
	}

	@RequestMapping(value = "/roleMasterFrom")
	public String showForm(HttpServletRequest request, HttpServletResponse response) {
		// request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		RoleMaster rm = null;
		if (!flag.equalsIgnoreCase("N")) {
			String rid = request.getParameter("roleid");
			rm = roleMasterRepository.getOne(Long.parseLong(rid));
			request.setAttribute("flag", flag);
			request.setAttribute("role", rm);
		} else {
			request.setAttribute("flag", flag);
			request.setAttribute("role", new RoleMaster());
		}
		request.setAttribute("modules", moduleRepository.findAll());
		return "admin/roleMaster/roleMasterForm";
	}

	@PostMapping(value = "/saveUpdateDeleteRole")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteRole(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("roleId"));
		String roleName = request.getParameter("roleName");
		String roleNameOl = request.getParameter("roleNameOl");
		String desc = request.getParameter("roleDesc");
		String status = request.getParameter("roleStatus");
		String flag = request.getParameter("flag");
		String rrList = request.getParameter("rrList");
		
		Set<RoleRights> newRoleRightsList = JsonUtil.convertToSet(rrList, RoleRights.class);
		Set<RoleRights> oldRoleRightsList = new HashSet<>();
		
		RoleMaster role = null;
		if (flag.equals("N")) {
			role = new RoleMaster();
			role.setRoleMasterRights(newRoleRightsList);
		}else {
			role = roleMasterRepository.getOne(id);
			for (RoleRights roleRights : role.getRoleMasterRights()) {
				oldRoleRightsList.add(roleRights);
			}
			role.getRoleMasterRights().clear();
			for (RoleRights roleRights : newRoleRightsList) {
				roleRights.setRoleMaster(role);
			}
			role.setRoleMasterRights(newRoleRightsList);
		}
		role.setRoleName(roleName);
		role.setRoleNameOl(roleNameOl);
		role.setRoleDesc(desc);
		role.setRoleStatus(status);
		

		if (flag.equals("D")) {
			roleMasterRepository.delete(role);
			if (oldRoleRightsList.size() > 0) {
				roleRightsRepository.deleteAll(oldRoleRightsList);
			}
			res.put("status", "success");
			res.put("msg", "Successfully deleted customer entry !");
		} else {
			RoleMaster rolRes = roleMasterRepository.save(role);
			if (oldRoleRightsList.size() > 0) {
				roleRightsRepository.deleteAll(oldRoleRightsList);
			}
			if (rolRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save role entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated role entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save role entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update role entry !");
				}
			}
		}
		return res;
	}

}
