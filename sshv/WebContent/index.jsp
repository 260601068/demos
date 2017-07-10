<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<p>Post submit</p>
 
<s:form action="login" method="post">
 
  <s:textfield name="userName" label="Your name" />
      
   <s:submit value="Submit" />
    
</s:form>
<hr/><p>Get submit</p>
<a href="<s:url value="user">
<s:param name="userName">wjl</s:param>
<s:param name="age">11</s:param>
</s:url>">User</a>
<hr/>
<p>提交到实现ModelDriven的Action可以直接赋值到Action中的对象成员中，因为该对象会成为值栈的根并优先于action普通变量赋值</p>
<s:form action="login" method="post">
  <s:textfield name="userName" label="Your name" />
  <s:textfield name="age" label="Your age" />
   <s:submit value="Submit" />
 
</s:form>
</body>
</html>