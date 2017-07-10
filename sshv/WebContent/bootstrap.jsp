<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">

</style>
</head>
<script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
/* $(function(){
	alert(x)
	$('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
	$(window).resize(function(){
		var height=$(".carousel-inner .item img").eq(0).height() || $(".carousel-inner .item img").eq(1).height() || $(".carousel-inner .item img").eq(2).height()
		$(".carousel-control").css("line-height",height+"px")
	})
}) */

$(function(){
	$(".tab2-text").css("margin-top",($(".tab2 img").height()-$(".tab2-text").height())/2+"px");
	$(window).resize(function(){
		$(".tab2-text").css("margin-top",($(".tab2 img").height()-$(".tab2-text").height())/2+"px");
	})
	
})
</script>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
<div class="container">
<div class="navbar-header">
<a href="#" class="navbar-brand">王家岭LOGO</a>
<button class="navbar-toggle" data-toggle="collapse" data-target="#mycollapse">
<span class="sr-only">切换导航</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>

<div class="navbar-collapse collapse" id="mycollapse">
<ul class="nav navbar-nav navbar-right">
<li class="active"><a href="bootstrap.jsp"><span class="glyphicon
glyphicon-home"></span> 首页</a></li>
<li><a href="information.jsp"><span class="glyphicon
glyphicon-list"></span> 资讯</a></li>
<li><a href="case.jsp"><span class="glyphicon
glyphicon-fire"></span> 案例</a></li>
<li><a href="about.jsp"><span class="glyphicon
glyphicon-question-sign"></span> 关于</a></li>
</ul>
</div>
</div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
<ol class="carousel-indicators">
<li data-slide-to="0" data-target="#myCarousel" class="active"></li>
<li data-slide-to="1" data-target="#myCarousel"></li>
<li data-slide-to="2" data-target="#myCarousel"></li>
</ol>
<div class="carousel-inner">
<div class="item active" style="background:#F8F0E5"><a href="#"><img src="image/one.jpg"></a></div>
<div class="item" style="background:#EFDECC"><a href="#"><img src="image/two.jpg"></a></div>
<div class="item" style="background:#3A1012"><a href="#"><img src="image/three.jpg"></a></div>
</div>
<a href="#myCarousel" data-slide="pre" class="carousel-control left"><span class="glyphicon glyphicon-chevron-left"></span></a>
<a href="#myCarousel" data-slide="next" class="carousel-control right"><span class="glyphicon glyphicon-chevron-right"></a>
</div>

<div class="tab">
<div class="container">
<h2 class="tab-h2">为什么选择李炎恢的Bootstrap</h2>
<p class="tab-p">讲解的详细又不罗嗦</p>
<div class="row">
<div class="col-md-6 col">
<div class="media">
<div class="media-left">
<a href="#" class="media-object"><img src="image/direction.png"></a>
</div>
<div class="media-body">
<div class="media-heading">
<h4>课程内容</h4>
<p class="text-muted">其他：高校不知名的讲师编写，没有任何实战价值的教材！</p>
<p>其他：知名企业家、管理学大师联合编写的具有实现性教材！</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 col">
<div class="media">
<div class="media-left">
<a href="#" class="media-object"><img src="image/direction.png"></a>
</div>
<div class="media-body">
<div class="media-heading">
<h4>课程内容</h4>
<p class="text-muted">其他：高校不知名的讲师编写，没有任何实战价值的教材！</p>
<p>其他：知名企业家、管理学大师联合编写的具有实现性教材！</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 col">
<div class="media">
<div class="media-left">
<a href="#" class="media-object"><img src="image/direction.png"></a>
</div>
<div class="media-body">
<div class="media-heading">
<h4>课程内容</h4>
<p class="text-muted">其他：高校不知名的讲师编写，没有任何实战价值的教材！</p>
<p>其他：知名企业家、管理学大师联合编写的具有实现性教材！</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 col">
<div class="media">
<div class="media-left">
<a href="#" class="media-object"><img src="image/direction.png"></a>
</div>
<div class="media-body">
<div class="media-heading">
<h4>课程内容</h4>
<p class="text-muted">其他：高校不知名的讲师编写，没有任何实战价值的教材！</p>
<p>其他：知名企业家、管理学大师联合编写的具有实现性教材！</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="tab2">
<div class="container">
<div class="row">
<div class="col-sm-6 tab2-text">
<h3>强大的学习体系</h3>
<p>经过管理学大师层层把关、让您的企业突飞猛进。</p>
</div>
<div class="col-sm-6">
<img src="image/teach.png" class="img-responsive center-block tab2-img">
</div>
</div>
</div>
</div>

<footer id="footer" class="text-muted">
<div class="container">
<p>企业培训 | 合作事宜 | 版权投诉</p>
<p>苏 ICP 备 12345678. © 2009-2016 瓢城企训网. Powered by Bootstrap.</p>
</div>
</footer>

</body>
</html>
