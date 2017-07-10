package com.wjl.sshv.temp;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wjl.sshv.sshv.Employee;

@Controller
@Scope("prototype")
public class TempAction2 extends ActionSupport{
	private String myname="war3";

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public Employee getFuck(){
		return new Employee("aaa",111);
	}
	
	@Override
	public String execute() throws Exception {
		List<Employee> employees=new ArrayList<Employee>();
		Employee emp=new Employee("wjl", 27);
		Employee emp2=new Employee("dnf", 22);
		Employee emp3=new Employee("bbq", 33);
		System.out.println("1: "+ServletActionContext.getRequest().getParameter("t1"));
		System.out.println("2: "+ServletActionContext.getRequest().getParameter("t2"));
		System.out.println("3: "+ServletActionContext.getRequest().getAttribute("emp"));
		System.out.println("4: "+ActionContext.getContext().getSession().get("emp").toString());
		System.out.println("5: "+ServletActionContext.getRequest().getParameter("ta"));
		System.out.println("6: "+ActionContext.getContext().get("ta"));
		return SUCCESS;
	}
	public static void f(){
		System.out.println("x: "+ActionContext.getContext().get("emp"));
	}
}
