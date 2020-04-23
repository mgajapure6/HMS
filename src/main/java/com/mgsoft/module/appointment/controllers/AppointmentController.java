package com.mgsoft.module.appointment.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.appointment.beans.AppointmentHead;
import com.mgsoft.module.appointment.beans.AppointmentLine;
import com.mgsoft.module.appointment.repositories.AppointmentHeadRepository;
import com.mgsoft.module.appointment.repositories.AppointmentLineRepository;
import com.mgsoft.module.appointment.repositories.AppointmentStatusRepository;
import com.mgsoft.module.doctor.repositories.DoctorMasterRepository;

@Controller
@RequestMapping("/app/appointment/appointmentMaster")
public class AppointmentController {

	@Autowired
	private AppointmentHeadRepository headRepository;
	
	@Autowired
	private AppointmentLineRepository lineRepository;
	
	@Autowired
	private DoctorMasterRepository doctorRepository;
	
	@Autowired
	private AppointmentStatusRepository appointmentStatusRepository;
	
	@RequestMapping("")
	public ModelAndView getAppointmentHeadList(HttpServletRequest req,HttpServletResponse resp)
	{
		ModelAndView model = new ModelAndView();
		req.setAttribute("headList", headRepository.findAll());
		model.setViewName("appointment/appointmentList");
		return model;
	}
	
	@RequestMapping("/editAppointmentDetails")
	public @ResponseBody ModelAndView getAppointmentLineList(HttpServletRequest req,HttpServletResponse resp)
	{
		String flag =req.getParameter("flag"); 
		ModelAndView model = new ModelAndView();
		if(flag.equals("M")) 
		{
		Long trno = Long.parseLong(req.getParameter("headTrno"));
		req.setAttribute("headList", headRepository.findAllByTrno(trno));
		req.setAttribute("lineList", lineRepository.findAllByLineTrno(trno));
		}
		req.setAttribute("doctorList", doctorRepository.findAll());
		req.setAttribute("statusList", appointmentStatusRepository.findAll());
		model.setViewName("appointment/appointmentForm");
		
		return model;
	}
	
	@RequestMapping(value = "/saveAppointmentDetails", method = RequestMethod.POST)
	public @ResponseBody ModelAndView saveAppointmentDtl(HttpServletRequest request,HttpServletResponse resp)
	{
		ModelAndView model = new ModelAndView();
		
		Long trno = request.getParameter("trno") == null ? null : Long.parseLong(request.getParameter("trno"));
		Date appointment_date;
		try {
			appointment_date = new SimpleDateFormat("DD-MM-YYYY").parse(request.getParameter("appointment_date"));

		String from_time = request.getParameter("from_time");
		String to_time = request.getParameter("to_time");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");

		String[] id = request.getParameterValues("id[]");
		String[] srno = request.getParameterValues("srno[]");
		String[] patientName = request.getParameterValues("patientName[]");
		String[] doctorName = request.getParameterValues("doctorName[]");
		String[] doctorId = request.getParameterValues("doctorId[]");
		String[] visitTime = request.getParameterValues("visitTime[]");
		String[] statusId = request.getParameterValues("statusId[]");
		
		AppointmentHead head = new AppointmentHead();
		head.setAppointment_date(appointment_date);
		head.setFrom_time(from_time);
		head.setTo_time(to_time);
		head.setStatus(status);
		head = headRepository.save(head);
		Long v_trno = head.getHeadTrno();
		
		for(int i = 0; i < srno.length; i++)
		{
			AppointmentLine line = new AppointmentLine();
			line.setLineTrno(v_trno);
			if(flag.equals("M")) {
				line.setId(Long.parseLong(id[i]));
				}
			line.setSrno(Long.parseLong(srno[i]));
			line.setPatientName(patientName[i]);
			line.setDoctorName(doctorName[i]);
			line.setDoctorId(Long.parseLong(doctorId[i]));
			line.setVisitTime(visitTime[i]);
			line.setStatusId(Long.parseLong(statusId[i]));
			line.setHead(head);
			lineRepository.save(line);
		}
		 
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		model.setViewName("appointment/appointmentList");
		return model;
	}
}
