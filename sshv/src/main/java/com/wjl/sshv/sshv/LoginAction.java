package com.wjl.sshv.sshv;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User>{
	
	@Autowired
	private MyService myService;
	private String userName;
	private User user;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String execute() throws Exception {
		System.out.println("userName: "+userName);
		System.out.println("user: "+user);
		myService.saveEmployee(new Employee(user.getUserName(), user.getAge()));
		return SUCCESS;
	}
	//getModel方法由ModelDrivenInterceptor拦截器在Action的赋值操作（Params拦截器执行前）以及action方法前执行，
	@Override
	public User getModel() {
		user=new User();
		return user;
	}
}
