package com.wjl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wjl.main.Employee;

public interface EmployeeMapper {
	
	public Employee getEmpById(Integer id);
	
	public Map<String,Object> getEmpByIdReturnMap(Integer id);
	
	public List<Employee> getEmployeesByNameLike(String name);
	
	public Employee getEmpByIdAndName(@Param("id") Integer id,@Param("name") String name);
	
	public Employee getEmpByMap(Map<String,Object> map);
	
	public void addEmployee(Employee employee);
	
	public void updateEmployee(Employee employee);
	
	public void deleteEmployee(Integer id);
	
	public Employee getEmpAndDept(Integer id);
	
	public Employee getEmpAndDeptStep(Integer id);
	
	public List<Employee> getEmpsBydeptId(Integer id);
	
	public List<Employee> getEmpsByDynamicCondition(@Param("emp") Employee emp,@Param("ids")List<Integer> ids);
}
