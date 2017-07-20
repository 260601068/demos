<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function regist() {
	$("#login_form").prop("action","login_regist.action")
}
</script>
<body>
<div class="container" style="padding:140px 300px;">
<h1 class="text-center">BBS Demo</h1>
	<form id="login_form" class="form-horizontal" action="login_login.action" method="post">
	<div class="form-group text-center text-danger"><label>${logininfo }</label></div>
	<div class="form-group">
	<label class="col-sm-2 control-label">用户名：</label>
	<div class="col-sm-10"><input name="username" class="form-control" type="text"></div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label">密码：</label>
	<div class="col-sm-10"><input name="password" class="form-control" type="password"></div>
	</div>
	<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
	<input type="submit" class="btn btn-default" value="登录">
	<input type="submit" class="btn btn-default" value="注册" onclick="regist()">
	</div>
	</div>
	</form>
</div>
</body>
</html>