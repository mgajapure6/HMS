package com.mgsoft.module.setting.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.setting.beans.ROI;
import com.mgsoft.module.setting.repositories.ROIRepository;

@Controller
@RequestMapping(value = "/app/setting/roiMaster")
public class ROIMasterController {

	@Autowired
	private ROIRepository roiRepository;

	@RequestMapping(value = "")
	public ModelAndView showROISetting(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("allROI", roiRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("settings/roiMaster/roiMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/roiMasterFrom")
	public String showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		ROI roi = null;
		if(!flag.equalsIgnoreCase("N")) {
			String roiid = request.getParameter("roiid");
			roi = roiRepository.getOne(Long.parseLong(roiid));
			request.setAttribute("flag", flag);
			request.setAttribute("roi", roi);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("roi", new ROI());
		}
		
		return "settings/roiMaster/roiMasterForm";
	}

	@PostMapping(value = "/saveUpdateDeleteROI")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteROI(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("roiId"));
		String ri = request.getParameter("roi");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		ROI roi = new ROI();
		roi.setId(id);
		roi.setRoi(Double.parseDouble(ri));
		roi.setStatus(status);

		if (flag.equals("D")) {
			roiRepository.delete(roi);
			res.put("status", "success");
			res.put("msg", "Successfully deleted ROI entry !");
		} else {
			ROI moRes = roiRepository.save(roi);
			System.out.println("ROI res :" + moRes);
			if (moRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save ROI entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated ROI entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save ROI entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update ROI entry !");
				}
			}
		}
		return res;
	}

}
