package com.mgsoft.module.patient.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.patient.beans.PatientMaster;
import com.mgsoft.module.patient.repositories.PatientMasterRepository;
import com.mgsoft.module.setting.repositories.StateMasterRepository;
import com.mgsoft.util.DateUtil;

@Controller
@RequestMapping(value = "/app/patient/patientMaster")
public class PatientMasterController {
	
	@Autowired
	private PatientMasterRepository patientMasterRepository;
	
	@Autowired
	private StateMasterRepository stateMasterRepository;
	
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
		request.setAttribute("stateList", stateMasterRepository.findAll());
		return "patient/patientMaster/patientMasterForm";
	}
	
	@GetMapping("/getWebcamModal")
	public String getWebcamModal(HttpServletRequest request, HttpServletResponse response) {
		return "patient/patientMaster/webcamModal";
	}
	
	@RequestMapping(value = "/saveUpdateDeletePatient")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteCategory(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("patientId"));
		String flag = request.getParameter("flag");
		System.out.println("flag::"+flag);
		System.out.println("id::"+id);
		System.out.println("patientFName::"+request.getParameter("patientFName"));
		PatientMaster pm = null;
		if(flag.equalsIgnoreCase("N")) {
			pm = new PatientMaster();
			pm.setPatientStatus("New");
			pm.setPatientRegDate(new Date());
		}else {
			pm = patientMasterRepository.getOne(Long.valueOf(id));
			pm.setPatientStatus("Edited");
		}
		                                     
		pm.setPatientFName          ( request.getParameter("patientFName"          ).equals("") ? null :                       request.getParameter("patientFName"                        ));
		pm.setPatientLName          ( request.getParameter("patientLName"          ).equals("") ? null :                       request.getParameter("patientLName"                        ));
		pm.setPatientMName          ( request.getParameter("patientMName"          ).equals("") ? null :                       request.getParameter("patientMName"                        ));
		pm.setPatientGender         ( request.getParameter("patientGender"         ).equals("") ? null :                       request.getParameter("patientGender"                       ));
		pm.setPatientDob            ( request.getParameter("patientDob"            ).equals("") ? null : DateUtil.stringToDate(request.getParameter("patientDob"           ), "dd-MM-yyyy"));
		pm.setPatientMob            ( request.getParameter("patientMob"            ).equals("") ? null :                       request.getParameter("patientMob"                          ));
		pm.setPatientAltMob         ( request.getParameter("patientAltMob"         ).equals("") ? null :                       request.getParameter("patientAltMob"                       ));
		pm.setPatientLLNo           ( request.getParameter("patientLLNo"           ).equals("") ? null :                       request.getParameter("patientLLNo"                         ));
		pm.setPatientAddr1          ( request.getParameter("patientAddr1"          ).equals("") ? null :                       request.getParameter("patientAddr1"                        ));
		pm.setPatientAddr2          ( request.getParameter("patientAddr2"          ).equals("") ? null :                       request.getParameter("patientAddr2"                        ));
		pm.setPatientCity           ( request.getParameter("patientCity"           ).equals("") ? null :                       request.getParameter("patientCity"                         ));
		pm.setPatientState          ( request.getParameter("patientState"          ).equals("") ? null :                       request.getParameter("patientState"                        ));
		pm.setPatientZip            ( request.getParameter("patientZip"            ).equals("") ? null :                       request.getParameter("patientZip"                          ));
		pm.setPatientEdu            ( request.getParameter("patientEdu"            ).equals("") ? null :                       request.getParameter("patientEdu"                          ));
		pm.setPatientOccup          ( request.getParameter("patientOccup"          ).equals("") ? null :                       request.getParameter("patientOccup"                        ));
		pm.setPatientMStatus        ( request.getParameter("patientMStatus"        ).equals("") ? null :                       request.getParameter("patientMStatus"                      ));
		pm.setGardFName             ( request.getParameter("gardFName"             ).equals("") ? null :                       request.getParameter("gardFName"                           ));
		pm.setGardLName             ( request.getParameter("gardLName"             ).equals("") ? null :                       request.getParameter("gardLName"                           ));
		pm.setGardMName             ( request.getParameter("gardMName"             ).equals("") ? null :                       request.getParameter("gardMName"                           ));
		pm.setGardGender            ( request.getParameter("gardGender"            ).equals("") ? null :                       request.getParameter("gardGender"                          ));
		pm.setGardDob               ( request.getParameter("gardDob"               ).equals("") ? null : DateUtil.stringToDate(request.getParameter("gardDob"              ), "dd-MM-yyyy"));
		pm.setGardMob               ( request.getParameter("gardMob"               ).equals("") ? null :                       request.getParameter("gardMob"                             ));
		pm.setGardAltMob            ( request.getParameter("gardAltMob"            ).equals("") ? null :                       request.getParameter("gardAltMob"                          ));
		pm.setGardLLNo              ( request.getParameter("gardLLNo"              ).equals("") ? null :                       request.getParameter("gardLLNo"                            ));
		pm.setGardAddr1             ( request.getParameter("gardAddr1"             ).equals("") ? null :                       request.getParameter("gardAddr1"                           ));
		pm.setGardAddr2             ( request.getParameter("gardAddr2"             ).equals("") ? null :                       request.getParameter("gardAddr2"                           ));
		pm.setGardCity              ( request.getParameter("gardCity"              ).equals("") ? null :                       request.getParameter("gardCity"                            ));
		pm.setGardState             ( request.getParameter("gardState"             ).equals("") ? null :                       request.getParameter("gardState"                           ));
		pm.setGardZip               ( request.getParameter("gardZip"               ).equals("") ? null :                       request.getParameter("gardZip"                             ));
		pm.setInsurType             ( request.getParameter("insurType"             ).equals("") ? null :                       request.getParameter("insurType"                           ));
		pm.setInsurHolderName       ( request.getParameter("insurHolderName"       ).equals("") ? null :                       request.getParameter("insurHolderName"                     ));
		pm.setInsurPlanName         ( request.getParameter("insurPlanName"         ).equals("") ? null :                       request.getParameter("insurPlanName"                       ));
		pm.setInsurName             ( request.getParameter("insurName"             ).equals("") ? null :                       request.getParameter("insurName"                           ));
		pm.setInsurAddr1            ( request.getParameter("insurAddr1"            ).equals("") ? null :                       request.getParameter("insurAddr1"                          ));
		pm.setInsurAddr2            ( request.getParameter("insurAddr2"            ).equals("") ? null :                       request.getParameter("insurAddr2"                          ));
		pm.setInsurSocialSecurityNo ( request.getParameter("insurSocialSecurityNo" ).equals("") ? null :                       request.getParameter("insurSocialSecurityNo"               ));
		pm.setInsurPolicyId         ( request.getParameter("insurPolicyId"         ).equals("") ? null :                       request.getParameter("insurPolicyId"                       ));
		pm.setInsurPolicyNo         ( request.getParameter("insurPolicyNo"         ).equals("") ? null :                       request.getParameter("insurPolicyNo"                       ));
		pm.setInsurGroupNo          ( request.getParameter("insurGroupNo"          ).equals("") ? null :                       request.getParameter("insurGroupNo"                        ));                                 
		
		if(flag.equals("D")) {
			patientMasterRepository.delete(pm);
			res.put("status","success");
			res.put("msg","Successfully deleted patient info !");
		}else if(flag.equalsIgnoreCase("N")) {
			PatientMaster pmRes = patientMasterRepository.save(pm);
			if (pmRes != null) {
				res.put("status", "success");
				res.put("msg", "Patient info saved successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to save patient info !");
			}
		}else {
			PatientMaster pmRes = patientMasterRepository.save(pm);
			if (pmRes != null) {
				res.put("status", "success");
				res.put("msg", "Patient info updated successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to update patient info !");
			}
		}
		return res;
	}

}
