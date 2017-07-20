<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
a:hover {
	text-decoration: none;
}
</style>
</head>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<body>
<div class="container">

<h4 class="text-right">欢迎${session.user.user_name }!</h4>
<h2 class="text-center text-muted" style="padding-top:20px">全部主题列表</h2>

<ul class="list-unstyled">
<li>
<div class="col-sm-11" style="padding:0"><h4 style="margin-bottom:0">标题</h4></div>
<div class="col-sm-1 text-center" style="padding:0"><h4 class="text-muted"  style="margin-bottom:0" class="text-center">发布人</h4></div>
</li>
<s:iterator value="#subjects" var="subject">
<li>
<div class="col-sm-11" style="padding:0"><h4 style="margin-bottom:0"><a href="subject_detail?sub_id=${subject.sub_id }">${subject.title }</a></h4></div>
<div class="col-sm-1 text-center" style="padding:0"><h4 class="text-muted"  style="margin-bottom:0">${subject.user_name }</h4></div>
</li>
</s:iterator>
</ul>

<a href="views/subject_design.jsp" class="btn btn-info" style="margin-top:30px">创建主题</a>
</div>
</body>
</html>