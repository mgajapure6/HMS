package com.mgsoft.module.contactBook.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mgsoft.module.contactBook.beans.ContactBook;
import com.mgsoft.module.contactBook.repositories.ContactBookRepository;
import com.mgsoft.util.DateUtil;

@Controller
@RequestMapping(value = "/app/contactBook")
public class ContactBookController {
	
	@Autowired
	private ContactBookRepository contactBookRepository;

	@RequestMapping(value = "")
	public ModelAndView showList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		request.setAttribute("allContacts", contactBookRepository.findAll(Sort.by(Sort.Direction.ASC, "contFName")));
		model.setViewName("contactBook/contactList");
		return model;
	}
	
	@RequestMapping(value = "/contactForm")
	public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String flag = request.getParameter("flag");
		ContactBook cb = null;
		if(!flag.equalsIgnoreCase("N")) {
			String cid = request.getParameter("contactid");
			cb = contactBookRepository.getOne(Long.parseLong(cid));
			request.setAttribute("flag", flag);
			request.setAttribute("contact", cb);
		}else {
			request.setAttribute("flag", flag);
			request.setAttribute("contact", new ContactBook());
		}
		model.setViewName("contactBook/contactForm");
		return model;
	}
	
	@RequestMapping(value = "/contactDetail")
	public ModelAndView showDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String cid = request.getParameter("contactid");
		ContactBook cb = contactBookRepository.getOne(Long.parseLong(cid));
		request.setAttribute("contact", cb);
		model.setViewName("contactBook/contactDetail");
		return model;
	}
	
	
	@RequestMapping(value = "/removeFavorite")
	@ResponseBody
	public Map<String,Object> removeFavorite(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("contactid"));
		ContactBook cb = contactBookRepository.getOne(Long.valueOf(id));
		cb.setContFavoriteFlag("N");
		ContactBook cbRes = contactBookRepository.save(cb);
		if (cbRes != null) {
			res.put("status", "success");
			res.put("msg", "Contact remove favorite successfully !");
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to remove contact favorite !");
		}
		return res;
	}
	
	@RequestMapping(value = "/makeFavorite")
	@ResponseBody
	public Map<String,Object> makeFavorite(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("contactid"));
		ContactBook cb = contactBookRepository.getOne(Long.valueOf(id));
		cb.setContFavoriteFlag("Y");
		ContactBook cbRes = contactBookRepository.save(cb);
		if (cbRes != null) {
			res.put("status", "success");
			res.put("msg", "Contact make favorite successfully !");
		} else {
			res.put("status", "failed");
			res.put("msg", "Failed to make contact favorite !");
		}
		return res;
	}
	
	@RequestMapping(value = "/saveUpdateDeleteContact")
	@ResponseBody
	public Map<String,Object> saveUpdateDelete(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> res = new HashMap<>();
		Long id=Long.parseLong(request.getParameter("contactid"));
		String flag = request.getParameter("flag");
		ContactBook cb = null;
		if(flag.equalsIgnoreCase("N")) {
			cb = new ContactBook();
			cb.setContRegDate(new Date());
		}else {
			cb = contactBookRepository.getOne(Long.valueOf(id));
		}
		
		cb.setContStatus("New");                                         
		cb.setContFName          ( request.getParameter("contFName"          ).equals("") ? null :                       request.getParameter("contFName"                        ));
		cb.setContLName          ( request.getParameter("contLName"          ).equals("") ? null :                       request.getParameter("contLName"                        ));
		cb.setContMName          ( request.getParameter("contMName"          ).equals("") ? null :                       request.getParameter("contMName"                        ));
		cb.setContGender         ( request.getParameter("contGender"         ).equals("") ? null :                       request.getParameter("contGender"                       ));
		cb.setContDob            ( request.getParameter("contDob"            ).equals("") ? null : DateUtil.stringToDate(request.getParameter("contDob"           ), "dd-MM-yyyy"));
		cb.setContMob            ( request.getParameter("contMob"            ).equals("") ? null :                       request.getParameter("contMob"                          ));
		cb.setContAltMob         ( request.getParameter("contAltMob"         ).equals("") ? null :                       request.getParameter("contAltMob"                       ));
		cb.setContHomeMob        ( request.getParameter("contHomeMob"        ).equals("") ? null :                       request.getParameter("contHomeMob"                      ));
		cb.setContHomeLLNo       ( request.getParameter("contHomeLLNo"       ).equals("") ? null :                       request.getParameter("contHomeLLNo"                     ));
		cb.setContWorkLLNo       ( request.getParameter("contWorkLLNo"       ).equals("") ? null :                       request.getParameter("contWorkLLNo"                     ));
		cb.setContEmail          ( request.getParameter("contEmail"          ).equals("") ? null :                       request.getParameter("contEmail"                        ));
		cb.setContCompany        ( request.getParameter("contCompany"        ).equals("") ? null :                       request.getParameter("contCompany"                      ));
		cb.setContJobPost        ( request.getParameter("contJobPost"        ).equals("") ? null :                       request.getParameter("contJobPost"                      ));
		cb.setContEducation      ( request.getParameter("contEducation"      ).equals("") ? null :                       request.getParameter("contEducation"                    ));
		cb.setContOccupation     ( request.getParameter("contOccupation"     ).equals("") ? null :                       request.getParameter("contOccupation"                   ));
		cb.setContHomeAddr       ( request.getParameter("contHomeAddr"       ).equals("") ? null :                       request.getParameter("contHomeAddr"                     ));
		cb.setContWorkAddr       ( request.getParameter("contWorkAddr"       ).equals("") ? null :                       request.getParameter("contWorkAddr"                     ));
		cb.setContWorkWeb        ( request.getParameter("contWorkWeb"        ).equals("") ? null :                       request.getParameter("contWorkWeb"                      ));
		cb.setContPersonalWeb    ( request.getParameter("contPersonalWeb"    ).equals("") ? null :                       request.getParameter("contPersonalWeb"                  ));
		cb.setContFbLink         ( request.getParameter("contFbLink"         ).equals("") ? null :                       request.getParameter("contFbLink"                       ));
		cb.setContTwitLink       ( request.getParameter("contTwitLink"       ).equals("") ? null :                       request.getParameter("contTwitLink"                     ));
		cb.setContInstaLink      ( request.getParameter("contInstaLink"      ).equals("") ? null :                       request.getParameter("contInstaLink"                    ));  
		//cb.setContStatus         ( request.getParameter("contStatus"         ).equals("") ? null :                       request.getParameter("contStatus"                       ));
		//cb.setContFavoriteFlag   ( request.getParameter("contFavoriteFlag"   ).equals("") ? null :                       request.getParameter("contFavoriteFlag"                 ));
		//cb.setContFamilyFlag     ( request.getParameter("contFamilyFlag"     ).equals("") ? null :                       request.getParameter("contFamilyFlag"                   ));
		//cb.setContFriendFlag     ( request.getParameter("contFriendFlag"     ).equals("") ? null :                       request.getParameter("contFriendFlag"                   ));
		//cb.setContOfficematesFlag( request.getParameter("contOfficematesFlag").equals("") ? null :                       request.getParameter("contOfficematesFlag"              ));
		cb.setContNotes          ( request.getParameter("contNotes"          ).equals("") ? null :                       request.getParameter("contNotes"                        ));
		
		cb.setContStartLatter(cb.getContFName()!=null ? String.valueOf(cb.getContFName().charAt(0)) : null);
		
		if(flag.equals("D")) {
			contactBookRepository.delete(cb);
			res.put("status","success");
			res.put("msg","Successfully deleted contact info !");
		}else if(flag.equalsIgnoreCase("N")) {
			ContactBook cbRes = contactBookRepository.save(cb);
			if (cbRes != null) {
				res.put("status", "success");
				res.put("msg", "Contact info saved successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to save contact info !");
			}
		}else {
			ContactBook cbRes = contactBookRepository.save(cb);
			if (cbRes != null) {
				res.put("status", "success");
				res.put("msg", "Contact info updated successfully !");
			} else {
				res.put("status", "failed");
				res.put("msg", "Failed to update contact info !");
			}
		}
		return res;
	}

}
