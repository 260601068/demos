package com.wjl.main;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessagePostProcessor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	@Autowired
	private RabbitTemplate rabbitTemplate;
	
	private Logger logger=LoggerFactory.getLogger(MyController.class);
	
	@RequestMapping("/success")
	public String toSuccess(){
		logger.error("wjl's error log");
		logger.warn("wjl's warn log");
		logger.info("I'm {},age is {}","wjl",27);
		logger.debug("wjl's debug log");
		
		stringRedisTemplate.opsForValue().set("hello", "redis");
		ListOperations<String,String> names=stringRedisTemplate.opsForList();
		//list插入前最好删除同名的list，不然如果之前有该list则不会覆盖而是会继续添加数据
		stringRedisTemplate.delete("names");
		names.rightPush("names", "wjl");
		names.rightPush("names", "dnf");
		names.rightPush("names", "bbq");
		Map<String,Object> wjl=new HashMap<String,Object>();
		wjl.put("name", "wjl");
		wjl.put("age", "27");
		wjl.put("gender", "man");
		stringRedisTemplate.opsForHash().putAll("user",wjl );
		System.out.println("redis string hello: "+stringRedisTemplate.opsForValue().get("hello"));
		System.out.println("redis list names: "+stringRedisTemplate.opsForList().range("names", 0, -1));
		System.out.println("redis map user: "+stringRedisTemplate.opsForHash().entries("user"));
		System.out.println("redis map user gender: "+stringRedisTemplate.opsForHash().get("user", "gender"));
		stringRedisTemplate.delete("user");
		System.out.println("redis map user after delete: "+stringRedisTemplate.opsForHash().entries("user"));
		
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