<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#textSub").on("click",function(){
 		var text=$("[name='text']").val()
 		
 		var reg=new RegExp("\r\n","g")
 		text=text.replace(reg,"<br>")
 		$.ajax({
			 url: "design_addText",
			 type: "POST",
			 data: {"text":text},
			 dataType: "json",
			 success: function(){
				 $("#textPane p").text(text)
			 }
		}) 
	})
	$("#pictureSub").on("click",function(){
		var formData=new FormData($("#pictureForm")[0])
 			$.ajax({
			type:"post",
			url:"design_addPicture.action",
			data:formData,
			processData:false,
			contentType:false,
			dataType:"json",
			success:function(data){
				var filePath=$("#picturePane [name='myfile']")[0].value;
				var fileName=filePath.substring(filePath.lastIndexOf("\\")+1)
				$("#picturePane img").attr("src","../upload/"+fileName)
			}
		})
	})
	$("#videoSub").on("click",function(){
		var formData=new FormData($("#videoForm")[0])
			$.ajax({
		type:"post",
		url:"design_addVideo.action",
		data:formData,
		processData:false,
		contentType:false,
		dataType:"json",
		success:function(data){
			var filePath=$("#videoPane [name='myfile']")[0].value;
			var fileName=filePath.substring(filePath.lastIndexOf("\\")+1)
			$("#videoPane video").attr("src","../upload/"+fileName)
		}
	})
	})
	
  	$("#publish").on("click",function(){
		var title=$("#title").val() 
	 $("#publishModal").modal("hide")
		$.ajax({
			 url: "design_publish",
			 type: "GET",
			 data: {"title":title},
			 dataType: "json",
			 success: function(){
				 
			 }
		})  
	}) 
	
})

/* function mychange(){
 	var files=$("#myinput")[0].files
	for(var i=0;i<files.length;i++){
		alert(files[i].name)
	} 
} */
</script>
<body>
<ul class="nav nav-tabs">
<li class="active"><a href="#textPane" data-toggle="tab">添加文本</a></li>
<li><a href="#picturePane" data-toggle="tab">添加图片</a></li>
<li><a href="#videoPane" data-toggle="tab">添加视频</a></li>
<button class="btn btn-info center-block" data-toggle="modal" data-target="#publishModal">添加标题</button>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="textPane">
<textarea name="text" rows="15" cols="120"></textarea><br/>
<button id="textSub" type="submit">保存</button>
<p style="white-space:pre"></p>

</div>
<div class="tab-pane" id="picturePane">
<form id="pictureForm" enctype="multipart/form-data">
<input name="myfile" type="file"><input id="pictureSub" type="button" value="上传">
</form>
<img src="">
</div>
<div class="tab-pane" id="videoPane">
<form id="videoForm" enctype="multipart/form-data">
<input name="myfile" type="file"><input id="videoSub" type="button" value="上传">
</form>
<video src="" controls="controls"  autoplay width="350px" height="350px">
your browser does not support the video tag
</video>
</div>
</div>

<div id="publishModal" class="modal">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button class="close" data-dismiss="modal"><span>&times;</span></button>
<h4 class="modal-title text-center">标题</h4>
</div>
<div class="modal-body">
<textarea id="title" rows="7" cols="90"></textarea>
</div>
<div class="modal-footer">
<button id="publish" class="btn btn-primary">发布主题</button>
</div>
</div>
</div>
</div>

</body>
</html>