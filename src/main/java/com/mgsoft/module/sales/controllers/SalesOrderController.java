package com.mgsoft.module.sales.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.module.customer.beans.Customer;
import com.mgsoft.module.customer.repositories.CustomerRepository;
import com.mgsoft.module.inventory.repositories.InvItemRepository;
import com.mgsoft.module.inventory.repositories.ItemCategoryRepository;
import com.mgsoft.module.sales.beans.SalesInvoice;
import com.mgsoft.module.sales.beans.SalesInvoiceItem;
import com.mgsoft.module.sales.repositories.SalesOrderRepository;
import com.mgsoft.module.setting.beans.Tax;
import com.mgsoft.module.setting.repositories.DiscountRepository;
import com.mgsoft.module.setting.repositories.TaxRepository;

@Controller
@RequestMapping(value = "/app/sales/invoiceMaster")
public class SalesOrderController {

	@Autowired
	private SalesOrderRepository salesOrderRepository;

	@Autowired
	private InvItemRepository invItemRepository;

	@Autowired
	private ItemCategoryRepository itemCategoryRepository;

	@Autowired
	private DiscountRepository discountRepository;

	@Autowired
	private TaxRepository taxRepository;

	@Autowired
	private CustomerRepository customerRepository;

	@RequestMapping(value = "")
	public ModelAndView showInventory(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("salesInvoiceList", salesOrderRepository.findAll());
		// request.setAttribute("inventoryList", invItemRepository.findAll());
		request.setAttribute("allCategories", itemCategoryRepository.findAll());
		request.setAttribute("allDiscounts", discountRepository.findAll());
		request.setAttribute("allTaxes", taxRepository.findAll());
		request.setAttribute("customers", customerRepository.findAll());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sales/SalesOrder");
		return modelAndView;
	}

	@PostMapping(value = "/getSalesOrderById")
	@ResponseBody
	public Map<String, Object> getSalesOrderById(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long invid = Long.parseLong(request.getParameter("invid"));
		Long customerid = Long.parseLong(request.getParameter("customerid"));
		res.put("data",
				salesOrderRepository.findByInvoiceIdAndCustomerId(invid, customerRepository.getOne(customerid)));
		return res;
	}

	@PostMapping(value = "/saveUpdateDeleteSalesOrder")
	@ResponseBody
	public Map<String, Object> saveUpdateDeleteItem(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		Long id = Long.parseLong(request.getParameter("invoiceId"));
		String flag = request.getParameter("flag");
		String items = request.getParameter("items");
		Long customerId = Long.parseLong(request.getParameter("customerId"));
		String invNo = request.getParameter("invNo");
		String invDate = request.getParameter("invDate");
		String posoNo = request.getParameter("posoNo");
		String payDueDate = request.getParameter("payDueDate");
		String invAmt = request.getParameter("invAmt");
		String discountAmt = request.getParameter("discountAmt");
		String taxableAmt = request.getParameter("taxableAmt");
		String taxAmt = request.getParameter("taxAmt");
		String recipientDesc = request.getParameter("recipientDesc");
		// String grndTotAmt = request.getParameter("grndTotAmt");

		Customer customer = customerRepository.getOne(customerId);
		SalesInvoice salesInvoice = new SalesInvoice();

		salesInvoice.setCustomer(customer);
		salesInvoice.setDiscountVal(discountAmt);
		salesInvoice.setId(id);
		salesInvoice.setInvDate(invDate);
		salesInvoice.setInvNum(invNo);
		salesInvoice.setInvVal(invAmt);
		salesInvoice.setPayDueDate(payDueDate);
		salesInvoice.setPosoNum(posoNo);
		salesInvoice.setTaxableVal(taxableAmt);
		salesInvoice.setTaxVal(taxAmt);
		salesInvoice.setPayments(null);
		salesInvoice.setPayStatus("U");
		salesInvoice.setRecipientDesc(recipientDesc);
		Set<SalesInvoiceItem> soldItemSet = new HashSet<>();
		// Set<InvoicePayment> paymentSet = new HashSet<>();
		JsonParser parser = new JsonParser();
		JsonArray jarr = parser.parse(items).getAsJsonArray();
		for (JsonElement jsonElement : jarr) {
			SalesInvoiceItem si = new SalesInvoiceItem();
			JsonObject jo = jsonElement.getAsJsonObject();
			Long txId = null;
			if (jo.has("taxArr")) {
				JsonArray ja = parser.parse(jo.get("taxArr").getAsString()).getAsJsonArray();
				if (ja.isJsonArray() && ja.size() > 0) {
					JsonObject txJo = (JsonObject) ja.get(0);
					txId = txJo.get("taxId").getAsLong();
					Set<Tax> taxSet = new HashSet<>();
					taxSet.add(taxRepository.getOne(txId));
					si.setTaxes(taxSet);
				} else {
					txId = null;
					si.setTaxes(null);
				}
			} else {
				txId = null;
				si.setTaxes(null);
			}

			si.setId(null);
			si.setBrand(null);
			si.setCategoryId(null);
			si.setHsnNo(jo.get("hsn").getAsString());
			si.setHsnDesc(null);
			si.setInventoryItemId(jo.get("invItemid").getAsLong());
			si.setItemName(jo.get("name").getAsString());
			si.setMeasurementUnit(jo.get("mu").getAsString());
			si.setQty(jo.get("qty").getAsString());
			si.setQtyAmt(jo.get("qtyAmt").getAsString());
			si.setSalesInvoice(salesInvoice);
			si.setStatus(null);
			si.setUnitAmt(jo.get("uPrice").getAsString());
			soldItemSet.add(si);
		}
		salesInvoice.setItems(soldItemSet);
		customer.getSalesInvoices().add(salesInvoice);

		if (flag.equals("D")) {
			res.put("status", "success");
			res.put("msg", "Successfully deleted this sales order !");
		} else {
			Customer customerRes = customerRepository.save(customer);

			// updating inventory items quantity
//	    if(customerRes!=null ) {
//		Set<SoldItem> sItems = customerRes.getSalesInvoices();
//		for (SoldItem soldItem : sItems) {
//		    InvItem ii= invItemRepository.getOne(soldItem.getInventoryItemId());
//		    Float iiQty = Float.parseFloat(ii.getMainQty());
//		    Float soldItemQty = Float.parseFloat(soldItem.getQty());
//		    Float iiAviQty = iiQty-soldItemQty;
//		    ii.setMainQty(iiAviQty.toString());
//		    invItemRepository.save(ii);
//		}
//	    }
			res.put("customerRes", customerRes);
			System.out.println("6");
			if (customerRes != null) {
				if (flag.equals("N")) {
					res.put("status", "success");
					res.put("msg", "Successfully save this sales order !");
				} else {
					res.put("status", "success");
					res.put("msg", "Successfully updated this sales order !");
				}
			} else {
				if (flag.equals("N")) {
					res.put("status", "failed");
					res.put("msg", "Failed to save this sales order !");
				} else {
					res.put("status", "failed");
					res.put("msg", "Failed to update this sales order !");
				}
			}
		}
		return res;
	}

}
