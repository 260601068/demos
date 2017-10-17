package com.wjl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wjl.dao.EmployeeMapper;
import com.wjl.main.Employee;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public Employee getEmpById(int id){
		return employeeMapper.getEmpById(id);
	}
	
	public Map<String,Object> getEmpByIdReturnMap(int id){
		return employeeMapper.getEmpByIdReturnMap(id);
	}
	
	public List<Employee> getEmployeesByNameLike(String name){
		return employeeMapper.getEmployeesByNameLike(name);
	}
	
	public Employee getEmpByIdAndName(Integer id,String name){
		return employeeMapper.getEmpByIdAndName(id, name);
	}
	
	public Employee getEmpByMap(Map<String,Object> map){
		return employeeMapper.getEmpByMap(map);
	}
	
	public void addEmployee(Employee employee){
		employeeMapper.addEmployee(employee);
	}
	
	public void updateEmployee(Employee employee){
		employeeMapper.updateEmployee(employee);
	}
	
	public void deleteEmployee(Integer id){
		employeeMapper.deleteEmployee(id);
	}
}
