package com.wjl.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.core.MessagePostProcessor;
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
		String s="wjl send message from controller with myexhange to myQueue";
		rabbitTemplate.convertAndSend("myexchange", "myrouting",new User("wjl",new Integer(27)) , new MessagePostProcessor() {
			
			@Override
			public Message postProcessMessage(Message message) throws AmqpException {
				message.getMessageProperties().setHeader("name", "wjl");
				return message;
			}
		});
		//执行receiveAndConvert方法时服务端必须已经创建myQueue,不然报错
		User user = (User) rabbitTemplate.receiveAndConvert("myQueue");
		System.out.println("from controller sync receivier: "+user);
		return "success";
	}
	
}