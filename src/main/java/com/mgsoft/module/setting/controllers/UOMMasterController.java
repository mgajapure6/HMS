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

import com.mgsoft.module.setting.beans.UOM;
import com.mgsoft.module.setting.repositories.UOMRepository;

@Controller
@RequestMapping(value = "/app/setting/uomMaster")
public class UOMMasterController {

	@Autowired
	private UOMRepository uomRepository;

	@RequestMapping(value = "")
	public ModelAndView showUOMSetting(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("allUOM", uomRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("settings/uomMaster/uomMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/uomMasterFrom")
	public String showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		UOM uom = null;
		if(!flag.equalsIgnoreCase("N")) {
			String uomid = request.getParameter("uomid");
			uom = uomRepository.getOne(Long.parseLong(uomid));
			request.setAttribute("flag", flag);
			request.setAttribute("uom", uom);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("uom", new UOM());
		}
		
		return "settings/uomMaster/uomMasterForm";
	}

	@PostMapping(value = "/saveUpdateDeleteUOM")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteUOM(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("uomId"));
		String uomName = request.getParameter("uomName");
		String uomShortCode = request.getParameter("uomShortCode");
		String status = request.getParameter("status");
		String flag = request.getParameter("flag");
		UOM uom = new UOM();
		uom.setId(id);
		uom.setUomName(uomName);
		uom.setUomShortCode(uomShortCode);
		uom.setStatus(status);

		if (flag.equals("D")) {
			uomRepository.delete(uom);
			res.put("status", "success");
			res.put("msg", "Successfully deleted UOM entry !");
		} else {
			UOM moRes = uomRepository.save(uom);
			System.out.println("UOM res :" + moRes);
			if (moRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save UOM entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated UOM entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save UOM entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update UOM entry !");
				}
			}
		}
		return res;
	}

}
