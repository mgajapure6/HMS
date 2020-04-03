package com.mgsoft.module.inventory.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.inventory.beans.InvItem;
import com.mgsoft.module.inventory.beans.ItemCategory;
import com.mgsoft.module.inventory.repositories.InvItemRepository;
import com.mgsoft.module.inventory.repositories.ItemCategoryRepository;

@Controller
@RequestMapping(value="/app/inventory/itemServiceMaster")
public class InventoryController {
	
	@Autowired
	private InvItemRepository invItemRepository;
	
	@Autowired
	private ItemCategoryRepository itemCategoryRepository;
	
	@RequestMapping(value= "")
	public ModelAndView showInventory(HttpServletRequest request, HttpServletResponse response) {
		
		/*ModelAndView modelAndView =  new ModelAndView();
		if(request.getSession().getAttribute("user")==null) {
			modelAndView.setViewName("redirect:/login");
			return modelAndView;
		}else {
			modelAndView.setViewName("dashboard/SalesDashboard");
			return modelAndView;
		}*/
		request.setAttribute("allItems", invItemRepository.findAll());
		request.setAttribute("allCategories", itemCategoryRepository.findAll());
		ModelAndView modelAndView =  new ModelAndView();
		modelAndView.setViewName("inventory/Inventory");
		return modelAndView;
	}
	
	@RequestMapping(value = "/saveUpdateDeleteItem")
	@ResponseBody
	public Map<String,Object> saveUpdateDeleteItem(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("itemId"));
		String flag = request.getParameter("flag");
		String itemName = request.getParameter("itemName");                                   
		String categorySelect = request.getParameter("categorySelect");                       
		String measurUnitSelect = request.getParameter("measurUnitSelect");
		String mainQty = request.getParameter("mainQty");                             
		String brand = request.getParameter("brand");                                
		String expiryDate = request.getParameter("expiryDate");                           
		String statusSelect = request.getParameter("statusSelect");                         
		String lowStockQty = request.getParameter("lowStockQty");                          
		String costPrice = request.getParameter("costPrice");                            
		String sellingPrice = request.getParameter("sellingPrice");
		System.out.println("categorySelect :"+categorySelect);
		List<ItemCategory> byStatus = itemCategoryRepository.findAllByStatus("Active");
		System.out.println("byStatus :"+byStatus);
		ItemCategory itemCategory = itemCategoryRepository.getOne(Long.parseLong(categorySelect));
		System.out.println(" itemCategory :"+itemCategory);
		InvItem invItem = new InvItem(); 
		invItem.setId(id);
		invItem.setItemName(itemName);
		invItem.setBrand(brand);
		invItem.setItemCategory(itemCategory);
		invItem.setCostPrice(costPrice);
		invItem.setExpiryDate(expiryDate);
		invItem.setLowStockQty(lowStockQty);
		invItem.setMainQty(mainQty);
		invItem.setMeasurementUnit(measurUnitSelect);
		invItem.setSellingPrice(sellingPrice);
		invItem.setStatus(statusSelect);
		if(flag.equals("D")) {
			itemCategory.getInvItems().remove(invItem);
			itemCategoryRepository.save(itemCategory);
			invItemRepository.deleteById(id);
			res.put("status","success");
			res.put("msg","Successfully deleted item info !");
		}else {
			InvItem invItemRes = invItemRepository.save(invItem);
			System.out.println("invItemRes :"+invItemRes);
			if(invItemRes!=null) {
				if(flag.equals("N")) {
					res.put("status","success");
					res.put("msg","Successfully save item info !");
				}else {
					res.put("status","success");
					res.put("msg","Successfully updated item info !");
				}
			}else {
				if(flag.equals("N")) {
					res.put("status","failed");
					res.put("msg","Failed to save item info !");
				}else {
					res.put("status","failed");
					res.put("msg","Failed to update item info !");
				}
			}
		}
		return res;
	}
	
	
	@RequestMapping(value = "/getInventoryItems", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getInventoryItems(HttpServletRequest request, HttpServletResponse response, @RequestParam("iid") String iid) {
		Map<String,Object> res = new HashMap<>();
		
		if(iid.equals("null")) {
			res.put("data",(List<InvItem>) invItemRepository.findAll());
		}else {
			res.put("data",invItemRepository.findById(Long.parseLong(iid)));
		}
		return res;
	}


}
