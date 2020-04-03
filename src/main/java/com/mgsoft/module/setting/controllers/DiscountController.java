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

import com.mgsoft.module.setting.beans.Discount;
import com.mgsoft.module.setting.repositories.DiscountRepository;

@Controller
@RequestMapping(value = "/app/setting/discountMaster")
public class DiscountController {

	@Autowired
	private DiscountRepository discountRepository;
	
	@RequestMapping(value = "")
	public ModelAndView showDiscountSetting(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("allDiscount", discountRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("settings/discountMaster/discountMasterList");
		return modelAndView;
	}
	
	
	@RequestMapping(value= "/discountMasterFrom")
	public String showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		Discount discount = null;
		if(!flag.equalsIgnoreCase("N")) {
			String discountid = request.getParameter("discountid");
			discount = discountRepository.getOne(Long.parseLong(discountid));
			request.setAttribute("flag", flag);
			request.setAttribute("discount", discount);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("discount", new Discount());
		}
		
		return "settings/discountMaster/discountMasterForm";
	}

	@RequestMapping(value = "/saveUpdateDeleteDiscount")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteDiscount(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("discountId"));
		String disName = request.getParameter("discountName");
		String disPercentage = request.getParameter("discountPercentage");
		String disShortCode = request.getParameter("discountShortCode");
		String status = request.getParameter("status");

		String flag = request.getParameter("flag");
		Discount dis = new Discount();
		dis.setId(id);
		dis.setDisName(disName);
		dis.setDisShortCode(disShortCode);
		dis.setDisPercentage(Double.parseDouble(disPercentage));
		dis.setStatus(status);

		if (flag.equals("D")) {
			discountRepository.delete(dis);
			res.put("status", "success");
			res.put("msg", "Successfully Deleted Discount entry !");
		} else {
			Discount disRes = discountRepository.save(dis);
			System.out.println("Discount res :" + disRes);
			if (disRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully Save Discount entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully Updated Discount entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to Save Discount entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to Update Discount entry !");
				}
			}
		}
		return res;
	}

}
