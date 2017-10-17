package com.wjl.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.wjl.service.EmployeeService;

@Controller
public class MyController {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	@Autowired
	private RabbitTemplate rabbitTemplate;
	
	@Autowired
	private EmployeeService employeeService;
	
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
	
	@RequestMapping("/mybatis/getEmployeeById")
	public String getEmployeeById(@RequestParam("id") String id,Map<String,Object> map){
		Employee employee=employeeService.getEmpById(Integer.valueOf(id));
		map.put("emp", employee);
		System.out.println("employee: "+employee);
		return "success";
	}
	
	@RequestMapping("/mybatis/getEmpByIdReturnMap")
	public String getEmpByIdReturnMap(@RequestParam("id") int id,Map<String,Object> map){
		Map<String,Object> employee=employeeService.getEmpByIdReturnMap(id);
		map.putAll(employee);
		System.out.println("map: "+map);
		return "success";
	}
	
	@RequestMapping("/mybatis/getEmployeesByNameLike")
	public String getEmployeesByNameLike(@RequestParam("name") String name,Map<String,Object> map){
		List<Employee> employees=employeeService.getEmployeesByNameLike("%"+name+"%");
		map.put("emps", employees);
		System.out.println("employees: "+employees);
		return "success";
	}
	
	@RequestMapping("/mybatis/getEmpByIdAndName")
	public String getEmpByIdAndName(@RequestParam("id") int id,@RequestParam("name") String name,Map<String,Object> map){
		Employee employee=employeeService.getEmpByIdAndName(id, name);
		map.put("emp", employee);
		System.out.println("employee: "+employee);
		return "success";
	}
	
	@RequestMapping("/mybatis/getEmpByMap")
	public String getEmpByIdAndName(@RequestParam("table") int table,@RequestParam("id") Integer id,@RequestParam("name") String name,Map<String,Object> map){
		Map<String,Object> data=new HashMap<String,Object>();
		data.put("table", table);
		data.put("id", id);
		data.put("name", name);
		Employee employee=employeeService.getEmpByMap(data);
		map.put("emp", employee);
		System.out.println("employee: "+employee);
		return "success";
	}
	
	@RequestMapping("/mybatis/addEmployee")
	public String addEmployee(@RequestParam("name") String name,@RequestParam("age") int age,Map<String,Object> map){
		Employee employee=new Employee();
		employee.setName(name);
		employee.setAge(age);
		employeeService.addEmployee(employee);
		map.put("emp", employee);
		System.out.println("employee: "+employee);
		return "success";
	}
	
	@RequestMapping("/mybatis/updateEmployee")
	public String updateEmployee(@RequestParam("id") int id,@RequestParam("name") String name,@RequestParam("age") int age,Map<String,Object> map){
		Employee employee=new Employee();
		employee.setId(id);
		employee.setName(name);
		employee.setAge(age);
		employeeService.updateEmployee(employee);
		map.put("emp", employee);
		System.out.println("employee: "+employee);
		return "success";
	}
	
	@RequestMapping("/mybatis/deleteEmployee")
	public String deleteEmployee(@RequestParam("id") int id,Map<String,Object> map){
		employeeService.deleteEmployee(id);
		return "success";
	}
}