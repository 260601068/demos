package com.wjl.main;

import java.util.Map;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@Component
public class Receiver {
	
	@RabbitListener(queues="myqueue")
	/*如果接收到的消息没有reply_to属性，可以用@SendTo("[exchange]/[routingKey]")发送返回消息；
	如果有reply_to属性并且该方法有返回值，则不需要@SendTo注解，spring自动按照reply_to返回信息;
	如果接收到消息没有reply_to属性，但是该方法有返回值并且没有@SendTo注解，则会报错*/
	@SendTo("bqueue")	
	public String receiveMessage(byte[] bytes,@Headers Map<String,Object> map,@Header(AmqpHeaders.CONSUMER_QUEUE) String queue){
		System.out.println("receive: "+new String(bytes));
		System.out.println("headers map: "+map);
		System.out.println("queue: "+queue);
		return "wjl's return message2";
	}
}
