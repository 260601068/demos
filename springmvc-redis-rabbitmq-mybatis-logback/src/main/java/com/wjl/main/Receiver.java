package com.wjl.main;

import java.util.Map;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

/* 多个消费者都从同一个queue里面取数据时，只有一个消费者能获取到数据，被获取后该数据会从服务器的queue中被删除
 * 一般生产者和消费者在不同的项目中，生产者需要要声明exchange和RabbitTemplate，而消费者需要声明属性完全相同exchange、queue、binding和RabbitListener */
@Component
public class Receiver {
	/*@RabbitListener直接使用queue属性的前提是rabbitmq的服务器端已经创建过了该queue，不然报错；
	 *直接使用queue属性的方法会获取发布到该queue的所有信息，包括所有exchange发布到该queue的信息 */
	@RabbitListener(queues="myQueue")
/*  @RabbitListener的bindings属性相当于直接使用queue属性的基础上又声明了queue、exchange、key、arguments信息；
  	这些声明会在应用启动时被rabbitmq服务器相应的创建，如果已经存在则要求声明的属性必须相同，不然报错，然后不重新创建，直接获取；
	bindings属性中的queue会获取发布到该queue的所有信息，包括所有exchange发布到该queue的信息；
  	@RabbitListener(bindings = @QueueBinding(
	          value = @Queue(value = "myQueue", durable = "true"),
	          exchange = @Exchange(value = "myexchange",type=ExchangeTypes.DIRECT,durable="true",ignoreDeclarationExceptions = "true"),
	          key = "myrouting")
	    )*/
	/*如果接收到的消息没有reply_to属性，可以用@SendTo("[exchange]/[routingKey]")发送返回消息；
	如果有reply_to属性并且该方法有返回值，则不需要@SendTo注解，spring自动按照reply_to返回信息;
	如果接收到消息没有reply_to属性，但是该方法有返回值并且没有@SendTo注解，则会报错*/
	@SendTo("bqueue")	
	public String receiveMessage(User user,@Headers Map<String,Object> map,@Header(AmqpHeaders.CONSUMER_QUEUE) String queue){
		System.out.println("receive: "+user);
		System.out.println("headers map: "+map);
		System.out.println("queue: "+queue);
		return "wjl's return message2";
	}
}
