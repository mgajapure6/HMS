package com.mgsoft.module.inventory.controllers;

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

import com.mgsoft.module.inventory.beans.Location;
import com.mgsoft.module.inventory.repositories.LocationRepository;

@Controller
@RequestMapping(value = "/app/inventory/locationMaster")
public class LocationMasterController {
	
	@Autowired
	private LocationRepository locationRepository;
	
	@RequestMapping(value = "")
	public ModelAndView showModuleSetting(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allCategories", locationRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventory/locationMaster/locationMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/locationMasterFrom")
	public String showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		Location loc = null;
		if(!flag.equalsIgnoreCase("N")) {
			String locationid = request.getParameter("locationid");
			loc = locationRepository.getOne(Long.parseLong(locationid));
			request.setAttribute("flag", flag);
			request.setAttribute("location", loc);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("location", new Location());
		}
		return "inventory/locationMaster/locationMasterForm";
	}
	
	@RequestMapping(value = "/saveUpdateDeleteLocation")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteLocation(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long   id      =Long.parseLong(request.getParameter("locationId"));
		String flag    = request.getParameter("flag");
		String name    = request.getParameter("locationName");                                   
		String desc    = request.getParameter("desc");                                      
		String status  = request.getParameter("statusSelect");   
		String addrL1  = request.getParameter("addrL1");
		String addrL2  = request.getParameter("addrL2");
		String city    = request.getParameter("city");
		String state   = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		Location loc = new Location();
		loc.setId(id);
		loc.setLocationName(name);
		loc.setAddrL1(addrL1);
		loc.setAddrL2(addrL2);
		loc.setCity(city);
		loc.setState(state);
		loc.setPincode(pincode);
		loc.setStatus(status);
		loc.setLocDesc(desc);
		//loc.setInvItems(new ArrayList<>());
		if(flag.equals("D")) {
			locationRepository.delete(loc);
			res.put("status","success");
			res.put("msg","Successfully deleted location info !");
		}else {
			Location itemLocationRes = locationRepository.save(loc);
			System.out.println("itemLocationRes :"+itemLocationRes);
			if(itemLocationRes!=null) {
				if(flag.equals("N")) {
					res.put("status","success");
					res.put("msg","Successfully save location info !");
				}else {
					res.put("status","success");
					res.put("msg","Successfully updated location info !");
				}
			}else {
				if(flag.equals("N")) {
					res.put("status","failed");
					res.put("msg","Failed to save location info !");
				}else {
					res.put("status","failed");
					res.put("msg","Failed to update location info !");
				}
			}
		}
		return res;
	}

}
