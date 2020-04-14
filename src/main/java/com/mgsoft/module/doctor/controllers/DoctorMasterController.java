package com.mgsoft.module.doctor.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.contactBook.beans.ContactBook;
import com.mgsoft.module.doctor.beans.DoctorMaster;
import com.mgsoft.module.doctor.repositories.DoctorMasterRepository;
import com.mgsoft.module.setting.repositories.StateMasterRepository;

@Controller
@RequestMapping(value = "app/doctor/doctorMaster")
public class DoctorMasterController {

	@Autowired
	DoctorMasterRepository doctorMasterRepository;
	
	@Autowired
	private StateMasterRepository stateMasterRepository;

	@RequestMapping(value = "")
	public ModelAndView callDoctorMasterList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		request.setAttribute("doctors", doctorMasterRepository.findAll());
		model.setViewName("doctor/doctorMaster/doctorList");
		return model;
	}
	
	@RequestMapping(value= "/doctorMasterFrom")
	public String showFrom(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		System.out.println("flag::"+flag);
		DoctorMaster dm = null;
		if(!flag.equalsIgnoreCase("N")) {
			String did = request.getParameter("doctorid");
			dm = doctorMasterRepository.getOne(Long.parseLong(did));
			request.setAttribute("flag", flag);
			request.setAttribute("doctor", dm);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("doctor", new DoctorMaster());
		}
		request.setAttribute("stateList", stateMasterRepository.findAll());
		return "doctor/doctorMaster/doctorForm";
	}
	
	@RequestMapping(value = "/doctorMasterDetail")
	public ModelAndView showDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String did = request.getParameter("doctorid");
		DoctorMaster dm = doctorMasterRepository.getOne(Long.parseLong(did));
		request.setAttribute("doctor", dm);
		model.setViewName("doctor/doctorMaster/doctorDetail");
		return model;
	}

}
