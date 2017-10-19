package com.wjl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wjl.dao.DepartmentMapper;
import com.wjl.main.Department;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	public Department getDeptById(Integer id){
		return departmentMapper.getDeptById(id);
	}
	
	public Department getDeptWithEmpsById(Integer id){
		return departmentMapper.getDeptWithEmpsById(id);
	}
}
