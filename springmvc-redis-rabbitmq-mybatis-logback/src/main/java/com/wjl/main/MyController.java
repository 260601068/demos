package com.wjl.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	@Autowired
	private RabbitTemplate rabbitTemplate;
	
	private Logger logger=LoggerFactory.getLogger(MyController.class);
	
	@RequestMapping("/success")
	public String toSuccess(){
		logger.error("wjl's error log");
		logger.warn("wjl's warn log");
		logger.info("I'm {},age is {}","wjl",27);
		logger.debug("wjl's debug log");
		
		rabbitTemplate.convertAndSend("myqueue", "wjl message2");
		String foo = (String) rabbitTemplate.receiveAndConvert("myqueue");
		System.out.println("foo: "+foo);
		return "success";
	}
	
}