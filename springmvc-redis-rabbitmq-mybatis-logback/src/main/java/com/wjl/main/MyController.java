package com.wjl.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	private Logger logger=LoggerFactory.getLogger(MyController.class);
	
	@RequestMapping("/success")
	public String toSuccess(){
		logger.info("I'm {},age is {}","wjl",27);
		logger.debug("wjl's debug log");
		return "success";
	}
	
}