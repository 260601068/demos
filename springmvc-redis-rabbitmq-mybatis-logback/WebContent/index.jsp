<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="success" style="text-decoration: none;">success页面</a><br>
<a href="mybatis/testSecondLevelCache" style="text-decoration: none;">测试mybatis-ehcache二级缓存</a>
<hr/>
<form action="mybatis/getEmployeeById" method="get">
通过ID查员工：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpByIdReturnMap" method="get">
通过ID查员工返回map：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmployeesByNameLike" method="get">
通过name查员工：<input type="text" name="name">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpByIdAndName" method="get">
通过id和name查员工：<input type="text" name="id"><input type="text" name="name">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpByIdAndName" method="get">
通过Map(table,id,name)查员工：<input type="text" name="table"><input type="text" name="id"><input type="text" name="name">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/addEmployee" method="get">
添加员工：<input type="text" name="name"><input type="text" name="age">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/updateEmployee" method="get">
更新员工(id,name,age)：<input type="text" name="id"><input type="text" name="name"><input type="text" name="age">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/deleteEmployee" method="get">
删除员工：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpAndDept" method="get">
通过ID查员工（带部门）：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpAndDeptStep" method="get">
通过ID查员工（带部门，懒加载）：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getDeptWithEmpsById" method="get">
通过ID查部门（带员工集合）：<input type="text" name="id">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpsByDynamicCondition" method="get">
动态查员工（ids,like name,>age）：<input type="text" name="ids"><input type="text" name="name"><input type="text" name="age">
<input type="submit" value="提交">
</form>
<hr/>
<form action="mybatis/getEmpsByPage" method="get">
查员工分页（pageNum,pageSize）：<input type="text" name="pageNum"><input type="text" name="pageSize">
<input type="submit" value="提交">
</form>
</body>
</html>