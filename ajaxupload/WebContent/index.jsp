<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#upload").on("click",function(){
		var formData=new FormData($("#myform")[0])
 			$.ajax({
			type:"post",
			url:"upload.action",
			data:formData,
			processData:false,
			contentType:false,
			dataType:"json",
			success:function(data){
				alert(data)
			}
		})
	})
})
</script>
<body>
<form id="myform" enctype="multipart/form-data">
<input name="myfile" type="file"><input id="upload" type="button" value="上传">
</form>
</body>
</html>