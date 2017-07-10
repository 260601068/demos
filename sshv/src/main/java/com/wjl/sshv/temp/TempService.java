package com.wjl.sshv.temp;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wjl.sshv.sshv.Employee;

@Service
public class TempService {
	@Autowired 
	private SessionFactory sessionFactory;
	@Transactional
	public void f(){
		List<Employee> list=sessionFactory.getCurrentSession().createNativeQuery("select * from employee").addEntity(Employee.class).list();
		System.out.println(list);
	}
}
