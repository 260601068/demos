<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="success">success页面</a>
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
</body>
</html>