<%@page import="njau.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String context = request.getContextPath();
	pageContext.setAttribute("context_", context);
%>


<script type="text/javascript">
$(function(){

	var dropMenu=false;
	$(".header-login").on("mouseleave",function(){
		dropMenu=false;
		setTimeout(function () {
			if(!dropMenu){
				$(".header-login").removeClass("open");
			}
		},100);
	});
	$(".dropdown-menu").on("mouseenter",function () {
		dropMenu=true;
	});
	$(".dropdown-menu").on("mouseleave",function () {
		$(".header-login").removeClass("open");
	});
	$(".dropdown-toggle").on("mouseenter",function(){
		$(".dropdown-toggle").dropdown("toggle");
	});
});
</script>
<nav class="container">
	<ul class="nav col-xs-12 h-wrap">
		<li class="col-md-2 col-sm-4 h-title-lg chosen"><a href="${pageContext.request.contextPath}/shop/index">首页</a></li>
		<li class="col-md-2 hidden-sm h-title-lg"><a href="#">我的订单</a></li>
		<li class="col-md-2 col-sm-4 h-title-lg" ><a href="#">合作加盟</a></li>

		<li class="col-md-1 col-md-offset-3 hidden-sm h-title-md"><a href="#">客服中心</a></li>

		<li class="col-md-1 hidden-sm h-title-md"><a href="#">手机应用</a></li>
		<%
			if(null!=session.getAttribute("user")){
				User user=(User)session.getAttribute("user");
				out.print(
						"<li class=\'col-md-1 col-sm-4 dropdown\'>"+
								"<img src='/res/img/"+user.getAvatar()+"' class=\'dropdown-toggle cursor-pointer header-avatar\' id=\'dropdownMenu1\' data-toggle=\'dropdown\'>"+
								"<ul class=\'dropdown-menu\'>"+
								"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href=\'#\'>用户中心</a></li>"+
								"<li class=\'header-userMesg-favor hidden\' role=\'presentation\'>"+user.getFavor()+"</li>"+
								"<li role=\'presentation\' class=\'divider\'></li>"+
								"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href=\'#\'>购物车</a></li>"+
								"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href='"+context+"/user/logout'>注销</a></li>"+
								"</ul>"+
								"</li>");
			}else{
				out.print("<li class='col-md-1 col-sm-4 hidden-sm h-title-md'><a href='/user/login'>登陆/注册</a></li>"+
						"<li class='col-md-1 col-sm-offset-2 col-sm-2 hidden-md hidden-lg h-title-md dropdown header-login'>"+
						"<span class=\'dropdown-toggle\'>登录/注册</span>"+
						"<ul class=\'dropdown-menu\'>"+
						"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href=\'#\'>我的订单</a></li>"+
						"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href=\'#\'>客服中心</a></li>"+
						"<li role=\'presentation\'><a role=\'menuitem\' tabindex=\'-1\' href=\'#\'>手机应用</a></li>"+
						"</ul>"+
						"</li>"
				);
			}
		%>
	</ul>

</nav>


