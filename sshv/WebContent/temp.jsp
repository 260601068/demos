<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
<script type="text/javascript">
function f(){
	$("#b").val('mmm')
}
</script>
<body>
<s:debug></s:debug>
<hr/>
<a href="temp.action?a=wjl">temp</a>
<hr/>
<div>
<input id="a" type="checkbox" >
<br/>
<input id="b" type="text" value="dnf">
</div>
<button onclick="f()">点我</button>
</body>
</html>