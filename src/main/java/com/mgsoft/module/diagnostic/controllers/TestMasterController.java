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
@RequestMapping(value = "/app/diagnostic/testMaster")
public class TestMasterController {
	
	@Autowired
	TestMasterRepository testMasterRepository;
	
	@Autowired
	TestGroupRepository testGroupRepository;

	@RequestMapping(value = "")
	public ModelAndView callDoctorMasterList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		request.setAttribute("allTests", testMasterRepository.findAll());
		model.setViewName("diagnostic/testMaster/testMasterList");
		return model;
	}
	
	@RequestMapping(value= "/testMasterFrom")
	public String showFrom(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		TestMaster pm = null;
		if(!flag.equalsIgnoreCase("N")) {
			String pid = request.getParameter("testid");
			pm = testMasterRepository.getOne(Long.parseLong(pid));
			request.setAttribute("flag", flag);
			request.setAttribute("test", pm);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("test", new TestMaster());
		}
		request.setAttribute("testGroups", testGroupRepository.findAll());
		return "diagnostic/testMaster/testMasterForm";
	}
	
	@RequestMapping(value = "/saveUpdateDeleteTest")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteCategory(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("testId"));
		String flag = request.getParameter("flag");
		Long testGroupId = request.getParameter("testGroupId")=="" ? null : Long.parseLong(request.getParameter("testGroupId"));
		
		TestGroup tg = null;
		if(testGroupId!=null) {
			tg = testGroupRepository.getOne(testGroupId);
		}
		
		TestMaster tm = null;
		if(flag.equalsIgnoreCase("N")) {
			tm = new TestMaster();
			tm.setTestRegDate(new Date());
		}else {
			tm = testMasterRepository.getOne(Long.valueOf(id));
		}
		                                     
		tm.setTestName       ( request.getParameter("testName"       ).equals("") ? null : request.getParameter("testName"       ));
		tm.setTestTitle      ( request.getParameter("testTitle"      ).equals("") ? null : request.getParameter("testTitle"      ));
		tm.setTestCode       ( request.getParameter("testCode"       ).equals("") ? null : request.getParameter("testCode"       ));
		tm.setTestNormalRate ( request.getParameter("testNormalRate" ).equals("") ? null : Float.parseFloat(request.getParameter("testNormalRate" )));
		tm.setTestUrgentRate ( request.getParameter("testUrgentRate" ).equals("") ? null : Float.parseFloat(request.getParameter("testUrgentRate" )));
		tm.setTestDesc       ( request.getParameter("testDesc"       ).equals("") ? null : request.getParameter("testDesc"       ));
		tm.setTestStatus     ( request.getParameter("testStatus"     ).equals("") ? null : request.getParameter("testStatus"     ));
		
		
		if(flag.equals("D")) {
			testMasterRepository.delete(tm);
			res.put("status","success");
			res.put("msg","Successfully deleted test info !");
		}else if(flag.equalsIgnoreCase("N")) {
			if(testGroupId!=null) {
				tm.setTestGroup(tg);
				tg.getTests().add(tm);
				TestGroup tgRes = testGroupRepository.save(tg);
				if (tgRes != null) {
					res.put("status", "success");
					res.put("msg", "Test info saved successfully !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to save test info !");
				}
			}else {
				TestMaster tmRes = testMasterRepository.save(tm);
				if (tmRes != null) {
					res.put("status", "success");
					res.put("msg", "Test info saved successfully !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to save test info !");
				}
			}
		}else {
			if(tg!=null) {
				if(tg.getId()==tm.getTestGroup().getId()) {
					TestMaster tmRes = testMasterRepository.save(tm);
					if (tmRes != null) {
						res.put("status", "success");
						res.put("msg", "Successfully updated test entry !");
					} else {
						res.put("status", "failed");
						res.put("msg", "Failed to update test entry !");
					}
				}else {
					TestGroup tg1 = tm.getTestGroup();
					tg1.getTests().remove(tm);
					testGroupRepository.save(tg1);
					tm.setTestGroup(tg1);
					tg.getTests().add(tm);
					TestGroup tgRes = testGroupRepository.save(tg);
					if (tgRes != null) {
						res.put("status", "success");
						res.put("msg", "Successfully save menu entry !");
					}else {
						res.put("status", "failed");
						res.put("msg", "Failed to save menu entry !");
					}
				}
			}else {
				TestMaster pmRes = testMasterRepository.save(tm);
				if (pmRes != null) {
					res.put("status", "success");
					res.put("msg", "Test info updated successfully !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update test info !");
				}
			}
		}
		return res;
	}

}
