package com.wjl.sshv.temp;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wjl.sshv.sshv.Employee;

@Controller
@Scope("prototype")
public class TempAction extends ActionSupport{

	@Autowired
	private TempService tempService;
	
	public InputStream getInputStream(){
		return new ByteArrayInputStream("我正在test struts2流".getBytes());
	}
	
	public String getFileName() throws UnsupportedEncodingException{
		return new String("my我的文件file.txt".getBytes(),"iso-8859-1");
	}
	@Override
	public String execute() throws Exception {
		Employee employee=new Employee("wjl", 27);
		Employee employee2=new Employee("dnf", 11);
		Employee employee3=new Employee("bbq", 33);
		
		return "liu";
	}
}
