package com.wjl.dao;

import com.wjl.main.Department;

public interface DepartmentMapper {

	public Department getDeptById(Integer id);
	
	public Department getDeptWithEmpsById(Integer id);
}
