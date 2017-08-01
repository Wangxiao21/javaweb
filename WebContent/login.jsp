<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String context = request.getContextPath();
	pageContext.setAttribute("context_", context);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login User</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/style.css">

</head>
<body class="login-page">
<div class="login-header">
	<jsp:include page="header.jsp"/>
</div>
<div class="login-wrap">
	<div class="col-xs-12 col-md-push-6 col-md-5 login-formWrap">
		<span class="login-entry active">手机号登录</span>
		<span class="login-entry">其他方式登录</span>
		<form action=${pageContext.request.contextPath}/user/login method=post>
			<input type="text" class="form-control login-input" placeholder="手机号" name="phone" value="123">
			<input type="password" class="form-control login-input" placeholder="密码" name="password" value="123">
			<button type="submit" class="btn btn-primary login-btn" data-loading-text="Loading...">登录</button>

		</form>
		<div>
			<input type="checkbox"><span class="login-remember">记住帐号</span>
			<span class="login-forget fr">忘记密码?</span>
		</div>
	</div>
	<div class="col-xs-12 col-md-pull-3 col-md-6 login-picWrap">
		info
	</div>
	<div class="login-bottom">
		&copy;2015 meituan.com <span>京ICP证070791号</span> 京公网安备11010502025545号
	</div>
</div>


</body>  
</html>