package com.mgsoft.module.hospital.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.hospital.repositories.EmployeeRepository;
import com.mgsoft.module.hospital.repositories.EmployeeTypeRepository;

@Controller
@RequestMapping(value="app/doctor/doctorMaster")
public class EmployeeMasterController {

	@Autowired
	EmployeeRepository employeeRepository;
	
	@Autowired
	EmployeeTypeRepository employeeTypeRepository; 
	
	@RequestMapping(value="")
	public ModelAndView callDoctorMasterList(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView();
		request.setAttribute("employee", employeeRepository.findAll());
		model.setViewName("hospital/doctor/employeeMasterList");
		return model;
	}
	
	@RequestMapping(value="/employeeMasterFrom")
	public ModelAndView callDoctorMasterForm(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView();
		request.setAttribute("employeeType", employeeTypeRepository.findAllByStatus("E"));
		model.setViewName("hospital/doctor/employeeMasterForm");
		return model;
	}
	
}
