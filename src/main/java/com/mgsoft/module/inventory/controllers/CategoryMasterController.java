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

import com.mgsoft.module.inventory.beans.ItemCategory;
import com.mgsoft.module.inventory.repositories.ItemCategoryRepository;

@Controller
@RequestMapping(value = "/app/inventory/categoryMaster")
public class CategoryMasterController {
	
	@Autowired
	private ItemCategoryRepository itemCategoryRepository;
	
	@RequestMapping(value = "")
	public ModelAndView showModuleSetting(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("allCategories", itemCategoryRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inventory/categoryMaster/categoryMasterList");
		return modelAndView;
	}
	
	@RequestMapping(value= "/categoryMasterFrom")
	public String showTaxFrom(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("allTax", taxRepository.findAll());
		String flag = request.getParameter("flag");
		ItemCategory ic = null;
		if(!flag.equalsIgnoreCase("N")) {
			String categoryid = request.getParameter("categoryid");
			ic = itemCategoryRepository.getOne(Long.parseLong(categoryid));
			request.setAttribute("flag", flag);
			request.setAttribute("category", ic);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("category", new ItemCategory());
		}
		return "inventory/categoryMaster/categoryMasterForm";
	}
	
	@RequestMapping(value = "/saveUpdateDeleteCategory")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteCategory(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("categoryId"));
		String flag = request.getParameter("flag");
		String categoryName = request.getParameter("categoryName");                                   
		String desc = request.getParameter("desc");                                      
		String statusSelect = request.getParameter("statusSelect");   
		ItemCategory itemCategory = new ItemCategory();
		itemCategory.setId(id);
		itemCategory.setCategoryName(categoryName);
		itemCategory.setParentCategoryId(null);
		itemCategory.setStatus(statusSelect);
		itemCategory.setCatDesc(desc);
		itemCategory.setInvItems(new ArrayList<>());
		if(flag.equals("D")) {
			itemCategoryRepository.delete(itemCategory);
			res.put("status","success");
			res.put("msg","Successfully deleted category info !");
		}else {
			ItemCategory itemCategoryRes = itemCategoryRepository.save(itemCategory);
			System.out.println("itemCategoryRes :"+itemCategoryRes);
			if(itemCategoryRes!=null) {
				if(flag.equals("N")) {
					res.put("status","success");
					res.put("msg","Successfully save category info !");
				}else {
					res.put("status","success");
					res.put("msg","Successfully updated category info !");
				}
			}else {
				if(flag.equals("N")) {
					res.put("status","failed");
					res.put("msg","Failed to save category info !");
				}else {
					res.put("status","failed");
					res.put("msg","Failed to update category info !");
				}
			}
		}
		return res;
	}

}
