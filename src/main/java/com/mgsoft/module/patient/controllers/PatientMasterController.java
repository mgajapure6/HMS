package com.mgsoft.module.patient.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.patient.beans.PatientMaster;
import com.mgsoft.module.patient.repositories.PatientMasterRepository;

@Controller
@RequestMapping(value = "/app/patient/patientMaster")
public class PatientMasterController {
	
	@Autowired
	private PatientMasterRepository patientMasterRepository;
	
	@RequestMapping(value = "")
	public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allPatients", patientMasterRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("patient/patientMaster/patientMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/patientMasterFrom")
	public String showFrom(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		PatientMaster pm = null;
		if(!flag.equalsIgnoreCase("N")) {
			String pid = request.getParameter("patientid");
			pm = patientMasterRepository.getOne(Long.parseLong(pid));
			request.setAttribute("flag", flag);
			request.setAttribute("patient", pm);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("patient", new PatientMaster());
		}
		return "patient/patientMaster/patientMasterForm";
	}
	
	@GetMapping("/getWebcamModal")
	public String getWebcamModal(HttpServletRequest request, HttpServletResponse response) {
		return "patient/patientMaster/webcamModal";
	}

}
