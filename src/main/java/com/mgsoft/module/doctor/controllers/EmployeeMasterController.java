package com.mgsoft.module.doctor.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.doctor.beans.Employee;
import com.mgsoft.module.doctor.repositories.EmployeeRepository;
import com.mgsoft.module.doctor.repositories.EmployeeTypeRepository;
import com.mgsoft.module.inventory.beans.ItemCategory;

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
	
	@RequestMapping(value="/employeeMasterForm")
	public ModelAndView callDoctorMasterForm(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model = new ModelAndView();
		String flag = request.getParameter("flag");
		
		  if(flag.equals("M")) {
			Long id = Long.parseLong(request.getParameter("employeeid"));
			request.setAttribute("employee", employeeRepository.getOne(id));
		}
		
		request.setAttribute("flag", flag);
		request.setAttribute("employeeType", employeeTypeRepository.findAllByStatus("E"));
		model.setViewName("hospital/doctor/employeeMasterForm");
		System.out.println(">>>>model>>>>"+model);
		return model;
	}
	
	@RequestMapping(value = "/saveUpdateDeleteEmployee")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteEmployee(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("employeeId"));
		String flag = request.getParameter("flag");
		String name = request.getParameter("name");                                   
		String nameOl = request.getParameter("nameOl");
		String address = request.getParameter("address");                                      
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String typeId = request.getParameter("typeId");
		String typeName = request.getParameter("typeName");
		String statusSelect = request.getParameter("status");   
		Employee employee = new Employee();
		employee.setId(id);
		employee.setName(name);
		employee.setNameOl(nameOl);
		employee.setAddress(address);
		employee.setContact(contact);
		employee.setEmail(email);
		employee.setTypeId(Long.parseLong(typeId));
		employee.setTypeName(typeName);
		employee.setStatus(statusSelect);

		if(flag.equals("D")) {
			employeeRepository.delete(employee);
			res.put("status","success");
			res.put("msg","Successfully deleted employee !");
		}else {
			Employee emp = employeeRepository.save(employee);
			System.out.println("itemCategoryRes :"+emp);
			if(emp!=null) {
				if(flag.equals("N")) {
					res.put("status","success");
					res.put("msg","Successfully save empoloyee !");
				}else {
					res.put("status","success");
					res.put("msg","Successfully updated empoloyee !");
				}
			}else {
				if(flag.equals("N")) {
					res.put("status","failed");
					res.put("msg","Failed to save category info !");
				}else {
					res.put("status","failed");
					res.put("msg","Failed to update category info !");
				}
			}
		}
		return res;
	}
	
}
