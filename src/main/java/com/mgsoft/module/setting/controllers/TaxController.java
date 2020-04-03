package com.mgsoft.module.setting.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.setting.beans.Tax;
import com.mgsoft.module.setting.repositories.TaxRepository;

@Controller
@RequestMapping(value="/app/setting/taxMaster")
public class TaxController {
	
	@Autowired
	private TaxRepository taxRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showInventory(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allTax", taxRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("settings/taxMaster/taxMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/taxFrom")
	public ModelAndView showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String taxid = request.getParameter("taxid");
		String flag = request.getParameter("flag");
		ModelAndView modelAndView =  new ModelAndView();
		request.setAttribute("flag", flag);
		request.setAttribute("tax", taxRepository.getOne(Long.parseLong(taxid)));
		modelAndView.setViewName("settings/taxMaster/taxMasterForm");
		return modelAndView;
	}
	
	@RequestMapping(value = "/saveUpdateDeleteTax")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteTax(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("taxId"));
		String taxName = request.getParameter("taxName");
		String taxRate = request.getParameter("taxPercent");          
		String taxRegNo = request.getParameter("taxRegNumber");
		String authName = request.getParameter("taxAuthorizerName");            
		String taxCode = request.getParameter("taxCode");                                      
		String status = request.getParameter("statusSelect");   
		
		String flag = request.getParameter("flag");   
		Tax tax = new Tax();
		tax.setId(id);
		tax.setTaxName(taxName);
		tax.setTaxRate(taxRate);
		tax.setTaxCode(taxCode);
		tax.setAuthName(authName);
		tax.setTaxRegNo(taxRegNo);
		tax.setStatus(status);
		
		if(flag.equals("D")) {
			taxRepository.delete(tax);
			res.put("status","success");
			res.put("msg","Successfully deleted tax entry !");
		}else {
			Tax taxRes = taxRepository.save(tax);
			System.out.println("Tax res :"+taxRes);
			if(taxRes!=null) {
				if(flag.equals("N")) {
					res.put("status","success");
					res.put("msg","Successfully save tax entry !");
				}else {
					res.put("status","success");
					res.put("msg","Successfully updated tax entry !");
				}
			}else {
				if(flag.equals("N")) {
					res.put("status","failed");
					res.put("msg","Failed to save tax entry !");
				}else {
					res.put("status","failed");
					res.put("msg","Failed to update tax entry !");
				}
			}
		}
		return res;
	}

}
