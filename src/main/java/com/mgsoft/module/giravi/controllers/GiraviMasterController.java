package com.mgsoft.module.giravi.controllers;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mgsoft.module.customer.beans.Customer;
import com.mgsoft.module.customer.repositories.CustomerRepository;
import com.mgsoft.module.giravi.beans.GiraviItem;
import com.mgsoft.module.giravi.beans.Loan;
import com.mgsoft.module.giravi.beans.LoanTransaction;
import com.mgsoft.module.giravi.repository.GiraviMasterRepository;
import com.mgsoft.util.DateUtil;

@Controller
@RequestMapping("/app/giravi/giraviMaster")
public class GiraviMasterController {

	@Autowired
	public GiraviMasterRepository giraviMasterRepository;
	
	@Autowired
	private CustomerRepository customerRepository;

	@GetMapping("")
	public String showPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("giraviList", giraviMasterRepository.findAll());
		//request.setAttribute("partyAccountList", list.size()>0 ? JsonUtil.javaCollectionToJson(list) : new ArrayList<>());
		return "giravi/giraviMasterList";
	}
	
	@GetMapping("/giraviForm")
	public String showgiraviFormPage(HttpServletRequest request, HttpServletResponse response) {
		String flag = request.getParameter("flag");
		Loan loan = null;
		if(!flag.equalsIgnoreCase("N")) {
			String loanid = request.getParameter("loanid");
			loan = giraviMasterRepository.getOne(Integer.parseInt(loanid));
			request.setAttribute("loan", loan);
			request.setAttribute("customer", loan.getCustomer());
			request.setAttribute("flag", flag);
		}else {
			request.setAttribute("loan", new Loan());
			request.setAttribute("customer", new Customer());
			request.setAttribute("flag", flag);
		}
		request.setAttribute("customers", customerRepository.findAll());
		return "giravi/giraviMasterForm";
	}
	
//	@PostMapping(value = "/getGiraviById")
//	@ResponseBody
//	public Map<String, Object> getSalesOrderById(HttpServletRequest request, HttpServletResponse response) {
//		Map<String, Object> res = new HashMap<>();
//		Integer loanid = Integer.parseInt(request.getParameter("loanid"));
//		res.put("data",giraviMasterRepository.getOne(loanid));
//		return res;
//	}

	@PostMapping("/saveGiravi")
	@ResponseBody
	public Map<String, Object> saveGiravi(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		String giraviId = request.getParameter("giraviId");
		String flag = request.getParameter("flag");
		String customerId = request.getParameter("customerId");
		String giraviNo = request.getParameter("giraviNo");
		String giraviDate = request.getParameter("giraviDate");
		Float intrestAmount = Float.valueOf(request.getParameter("intrestAmount"));
		Float netPayableAmount = Float.valueOf(request.getParameter("netPayableAmount"));
		Float tenurePeriod = Float.valueOf(request.getParameter("tenurePeriod"));
		String tenureType = request.getParameter("tenureType");
		String recipientDesc = request.getParameter("recipientDesc");
		Float intrestRate = Float.valueOf(request.getParameter("intrestRate"));
		Float loanAmount = Float.valueOf(request.getParameter("loanAmount"));
		JsonParser parser = new JsonParser();
		JsonElement jsonElement = parser.parse(request.getParameter("items"));
		JsonArray itemsArr = jsonElement.getAsJsonArray();
		
		Customer cus = null;
		Loan loan = null;
		if(flag.equalsIgnoreCase("N")) {
			cus = customerRepository.getOne(Long.valueOf(customerId));
			loan = new Loan();
			loan.setId(0);
			loan.setCustomer(cus);
		}else {
			loan = giraviMasterRepository.getOne(Integer.valueOf(giraviId));
		}
		
		loan.setLoanNumber(giraviNo);
		loan.setIntrestRate(intrestRate);
		loan.setLoanAmount(loanAmount);
		loan.setLoanDate(DateUtil.stringToDate(giraviDate, "dd-MM-yyyy"));
		loan.setIntrestAmount(intrestAmount);
		loan.setNetPayableAmount(netPayableAmount);
		loan.setTenurePeriod(tenurePeriod);
		loan.setTenureType(tenureType);
		loan.setDescription(recipientDesc);
		loan.setStatus("U");
		loan.setCloseStatus("N");
		
		
		
		List<GiraviItem> itemsList = new ArrayList<>();
		
		if(itemsArr.size()>0) {
			Iterator<JsonElement> itr = itemsArr.iterator();
			while (itr.hasNext()) {
				JsonObject jo = itr.next().getAsJsonObject();
				System.out.println("jo::"+jo);
				GiraviItem gi = new GiraviItem();
				gi.setId(jo.get("id").getAsInt());
				gi.setItmName(jo.get("name").getAsString());
				gi.setItmMetalType(jo.get("metalType").getAsString());
				gi.setItmDesc(jo.has("desc") && !jo.get("desc").isJsonNull() ? jo.get("desc").getAsString() : null);
				gi.setItmEligibleAmount(jo.get("payableAmt").getAsFloat());
				gi.setItmGrossWeight(jo.get("grossWeight").getAsFloat());
				gi.setItmGrossWeightUom(jo.get("grossWeightUom").getAsString());
				gi.setItmNetWeight(jo.get("netWeight").getAsFloat());
				gi.setItmNetWeightUom(jo.get("netWeightUom").getAsString());
				gi.setItmQty(jo.get("qty").getAsFloat());
				gi.setItmValuation(jo.get("valuationAmt").getAsFloat());
				gi.setLoan(loan);
				
				//loan.getGiraviItems().add(gi);
				itemsList.add(gi);
			}
		}
		
		loan.setGiraviItems(itemsList);
		
		
		if(flag.equalsIgnoreCase("N")) {
			ArrayList<Loan> loanList = new ArrayList<>();
			loanList.add(loan);
			cus.getLoans().add(loan);
			Customer customer = customerRepository.save(cus);
			if (customer != null) {
				res.put("status", "success");
				res.put("msg", "Giravi entry save successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to save giravi entry !");
			}
			
		}else if(flag.equalsIgnoreCase("D")) {
			customerRepository.deleteById(Long.parseLong(giraviId));
			res.put("status", "success");
			res.put("msg", "Giravi entry deleted successfully !");
		}else{
			Loan respLoan = giraviMasterRepository.save(loan);
			if (respLoan != null) {
				res.put("status", "success");
				res.put("msg", "Giravi entry updated successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to updated giravi entry !");
			}
		}
		
		return res;
	}
	
	
	@PostMapping("/saveGiraviPayment")
	@ResponseBody
	public Map<String, Object> saveGiraviPayment(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		String giraviId = request.getParameter("loanId");
		String flag = request.getParameter("flag");
		String receAmt = request.getParameter("receAmt");
		String payMethod = request.getParameter("payMethod");
		
		Loan loan = giraviMasterRepository.getOne(Integer.parseInt(giraviId));
		
		LoanTransaction loanTransaction = new LoanTransaction();
		loanTransaction.setId(0);
		loanTransaction.setTranAmount(Float.parseFloat(receAmt));
		loanTransaction.setTranMethod(payMethod);
		loanTransaction.setTranDate(new Date());
		loanTransaction.setTranDesc("Transaction made of Rs. "+Float.parseFloat(receAmt));
		loanTransaction.setLoan(loan);
		
		loan.getLoanTransactions().add(loanTransaction);
		
		Loan respLoan = giraviMasterRepository.save(loan);
		
		if (respLoan != null) {
			res.put("status", "success");
			res.put("msg", "Payment For Giravi No : "+respLoan.getLoanNumber()+" Saved Successfully !");
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to save payment for Giravi No : "+respLoan.getLoanNumber());
		}
	
		return res;
	}
	
	@GetMapping("/getGiraviDetail")
	public String getGiraviTransactions(HttpServletRequest request, HttpServletResponse response) {
		Integer loanId = Integer.parseInt(request.getParameter("loadId"));
		Loan loan = giraviMasterRepository.getOne(loanId);
		System.out.println("getCurrentMonthDayCount::"+DateUtil.getCurrentMonthDayCount());
		System.out.println("getCurrentYearDayCount::"+DateUtil.getCurrentYearDayCount());
		Float perDayInterestRate = loan.getTenureType().equalsIgnoreCase("M") ? loan.getIntrestRate() / DateUtil.getCurrentMonthDayCount() : loan.getIntrestRate() / DateUtil.getCurrentYearDayCount();
		System.out.println("perDayInterestRate::"+perDayInterestRate);
		Long totalDays = DateUtil.getDayCountBetweenDates(loan.getLoanDate(), new Date());
		totalDays = totalDays == 0 ? 1 : totalDays+1;
		System.out.println("totalDays::"+totalDays);
		Float currentInterestAmt = (totalDays*perDayInterestRate)/100*loan.getLoanAmount();
		System.out.println("currentInterestAmt::"+currentInterestAmt);
		request.setAttribute("currentInterestAmt", currentInterestAmt);
		request.setAttribute("paidAmt", 0);
		request.setAttribute("balanceAmt", 0);
		request.setAttribute("loan", loan);
		request.setAttribute("giraviTransactions", loan.getLoanTransactions());
		return "giravi/giraviDetail";
	}
	
	@GetMapping("/getWebcamModal")
	public String getWebcamModal(HttpServletRequest request, HttpServletResponse response) {
		Integer loanId = Integer.parseInt(request.getParameter("loadId"));
		Loan loan = giraviMasterRepository.getOne(loanId);
		request.setAttribute("loan", loan);
		return "giravi/webcamModal";
	}
	
	@PostMapping("/saveWebcamImage")
	@ResponseBody
	public Map<String, Object> saveWebcamImage(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<>();
		String customerId = request.getParameter("customerId");
		String dataURI = request.getParameter("dataURI");
		
		Customer customer = customerRepository.getOne(Long.parseLong(customerId));
		customer.setImage(Base64.getDecoder().decode(dataURI.getBytes()));
		Customer respCustomer = customerRepository.save(customer);
		if (respCustomer != null) {
			res.put("status", "success");
			res.put("msg", "Image Saved Successfully !");
			res.put("respBytes", respCustomer.getImage());
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to save image");
		}
	
		return res;
	}
}
