package com.mgsoft.module.customer.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mgsoft.module.customer.beans.PartyMaster;
import com.mgsoft.module.customer.repositories.PartyMasterRepository;

@Controller
@RequestMapping(value = "/customer")
public class PartyMasterController {

	@Autowired
	private PartyMasterRepository partyMasterRepository;

	@PostMapping(value = "/saveUpdateDeleteCustomer")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteCustomer(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("customerId"));
		String customerName = request.getParameter("customerName");
		String stateSelect = request.getParameter("stateSelect");
		String addrL1 = request.getParameter("addrL1");
		String addrL2 = request.getParameter("addrL2");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		// String customerId = request.getParameter("customerId");
		String flag = request.getParameter("flag");
		PartyMaster cus = new PartyMaster();
		cus.setId(id);
		cus.setCity(city);
		cus.setAddrL1(addrL1);
		cus.setAddrL2(addrL2);
		cus.setName(customerName);
		cus.setEmail(email);
		cus.setMobile(mobile);
		cus.setPincode(pincode);
		cus.setState(stateSelect);

		if (flag.equals("D")) {
			partyMasterRepository.delete(cus);
			res.put("status", "success");
			res.put("msg", "Successfully deleted customer entry !");
		} else {
			PartyMaster cusRes = partyMasterRepository.save(cus);
			System.out.println("Customer res :" + cusRes);
			if (cusRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save customer entry !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated customer entry !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save customer entry !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update customer entry !");
				}
			}
		}
		return res;
	}

}
