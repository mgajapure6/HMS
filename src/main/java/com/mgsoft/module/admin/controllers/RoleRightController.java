package com.mgsoft.module.admin.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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
@RequestMapping(value = "/app/admin/roleRight")
public class RoleRightController {

	@Autowired
	ModuleRepository moduleRepository;

	@Autowired
	RoleMasterRepository roleMasterRepository;

	@Autowired
	RoleRightsRepository roleRightsRepository;

	@RequestMapping(value = "")
	public ModelAndView showMenuSetting(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("modules", moduleRepository.findAll());
		request.setAttribute("allRoles", roleMasterRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/roleRight/roleRight");
		return modelAndView;
	}

	@PostMapping(value = "/getRoleById")
	@ResponseBody
	public Map<String, Object> getRoleById(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("roleId"));
		res.put("data", roleMasterRepository.getOne(id));
		return res;
	}

	@PostMapping(value = "/saveRoleRights")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteRole(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("roleId"));
		String data = request.getParameter("data");
		Set<RoleRights> newRoleRightsList = JsonUtil.convertToSet(data, RoleRights.class);
		RoleMaster role = roleMasterRepository.getOne(id);
		Set<RoleRights> oldRoleRightsList = new HashSet<>();
		for (RoleRights roleRights : role.getRoleMasterRights()) {
			oldRoleRightsList.add(roleRights);
		}
		role.getRoleMasterRights().clear();
		for (RoleRights roleRights : newRoleRightsList) {
			roleRights.setRoleMaster(role);
		}
		role.setRoleMasterRights(newRoleRightsList);
		RoleMaster rolRes = roleMasterRepository.save(role);
		if (oldRoleRightsList.size() > 0) {
			roleRightsRepository.deleteAll(oldRoleRightsList);
		}

		if (rolRes != null) {
			res.put("status", "success");
			res.put("msg", "Successfully updated role rights entry !");
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to update role rights entry !");
		}
		return res;
	}

}
