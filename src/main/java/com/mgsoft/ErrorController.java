package com.mgsoft;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	@GetMapping("/err404")
	public String error404() {
		return "errorPages/page404";
	}
	
	@GetMapping("/err500")
	public String error500() {
		return "errorPages/page500";
	}
	
	@GetMapping("/err503")
	public String error503() {
		return "errorPages/page503";
	}
	
	@GetMapping("/err505")
	public String error505() {
		return "errorPages/page505";
	}
}
