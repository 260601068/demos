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
/* struts2的多文件上传不能用input的multipart属性，只能用多个具有相同name属性的input上传，并在后台用File[]接收 */
$(function(){
	$("#upload").on("click",function(){
		var formData=new FormData($("#myform")[0])
		/* contentType为发送数据类型，dataType为接收数据类型 */
 			$.ajax({
			type:"post",
			url:"upload.action",
			data:formData,
			processData:false,
			contentType:false,
			dataType:"json",
			success:function(data){
				var filePath=$("[name='myfile']")[0].value;	//获取的filePath只有文件名是有效的，父路径统一为fakepath
				var fileName=filePath.substring(filePath.lastIndexOf("\\")+1)
				$("img").attr("src","upload/"+fileName) //可以直接访问部署目录（项目目录中可能没有）
			}
		})
	})
})
</script>
<body>
<form id="myform" enctype="multipart/form-data">
<input name="myfile" type="file"><input id="upload" type="button" value="上传">
</form>
<div>
<img src="">
</div>
</body>
</html>