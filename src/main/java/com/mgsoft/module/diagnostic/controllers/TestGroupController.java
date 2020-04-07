package com.mgsoft.module.diagnostic.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.admin.beans.Menu;
import com.mgsoft.module.admin.beans.Module;
import com.mgsoft.module.diagnostic.beans.TestGroup;
import com.mgsoft.module.diagnostic.beans.TestMaster;
import com.mgsoft.module.diagnostic.repositories.TestGroupRepository;
import com.mgsoft.module.diagnostic.repositories.TestMasterRepository;
import com.mgsoft.util.DateUtil;

@Controller
@RequestMapping(value = "/app/diagnostic/testGroup")
public class TestGroupController {
	
	@Autowired
	private TestGroupRepository testGroupRepository;

	@RequestMapping(value = "")
	public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		request.setAttribute("allTestGroups", testGroupRepository.findAll());
		model.setViewName("diagnostic/testGroup/testGroupList");
		return model;
	}
	
	@RequestMapping(value= "/testGroupFrom")
	public String showFrom(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		TestGroup tg = null;
		if(!flag.equalsIgnoreCase("N")) {
			String id = request.getParameter("groupid");
			tg = testGroupRepository.getOne(Long.parseLong(id));
			request.setAttribute("flag", flag);
			request.setAttribute("testGroup", tg);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("testGroup", new TestGroup());
		}
		return "diagnostic/testGroup/testGroupForm";
	}
	
	@RequestMapping(value = "/saveUpdateDeleteTestGroup")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteCategory(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("testGroupId"));
		String flag = request.getParameter("flag");
		TestGroup tg = null;
		if(flag.equalsIgnoreCase("N")) {
			tg = new TestGroup();
			tg.setGroupRegDate(new Date());
		}else {
			tg = testGroupRepository.getOne(Long.valueOf(id));
		}
		                                     
		tg.setGroupName		 ( request.getParameter("groupName"       ).equals("") ? null : request.getParameter("groupName"       ));
		tg.setGroupType      ( request.getParameter("groupType"      ).equals("") ? null : request.getParameter("groupType"      ));
		tg.setGroupCode       ( request.getParameter("groupCode"       ).equals("") ? null : request.getParameter("groupCode"       ));
		tg.setGroupDesc       ( request.getParameter("groupDesc"       ).equals("") ? null : request.getParameter("groupDesc"       ));
		tg.setGroupStatus     ( request.getParameter("groupStatus"     ).equals("") ? null : request.getParameter("groupStatus"     ));
		
		
		if(flag.equals("D")) {
			testGroupRepository.delete(tg);
			res.put("status","success");
			res.put("msg","Successfully deleted test info !");
		}else if(flag.equalsIgnoreCase("N")) {
			TestGroup tgRes = testGroupRepository.save(tg);
			if (tgRes != null) {
				res.put("status", "success");
				res.put("msg", "Test Group entry saved successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to save test group entry !");
			}
		}else {
			TestGroup tgRes = testGroupRepository.save(tg);
			if (tgRes != null) {
				res.put("status", "success");
				res.put("msg", "Successfully updated test group entry !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to update test group entry !");
			}
		}
		return res;
	}

}
