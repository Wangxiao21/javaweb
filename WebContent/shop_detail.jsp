<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商户详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.0.3.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script> 
<script type="text/javascript">

$(document).ready(function(){
	
	var passed=true;
	var scrolling=false;
	var is_pass=function(){
		return $(".detail-category1").offset().top+72<$(window).scrollTop();
	}
	$(window).scroll(function(event) {
		console.log($(".detail-category1").offset().left);
		if(is_pass()){
			if(passed){//确保以下代码不重复执行
				//alert($(".detail-menu-category").position().left+$(".detail-menu-category").parent().position().left+$(".detail-menu-category").parent().parent().position().left);
				//$(".detail-category2").css("width",$(".detail-menu-category").css("width"));
				$(".detail-category2").css("left",$(".detail-category1").offset().left+"px");
				$(".detail-category2").removeClass("hidden");
				passed=false;
			}else{
				return;
			}			
		}else{
			if(passed){
				return;
			}else{//确保以下代码不重复执行
				$(".detail-category2").addClass("hidden");
				passed=true;
			}
			
		}		
	});
	var cart={
		list:[],
		minCost:parseFloat($(".cart-min-deliver").data("mincost")),
		
		newItem:function(item){
			this.list.push(item);
			
		},
		addCount:function(id){
			
			for(var i=0;i<this.list.length;i++){
				
				if(id==this.list[i].id){
					
					this.list[i].count+=1;
					
					return this.list[i].count;
				}
			}
			
		},
		reduceCount:function(id){
			for(var i=0;i<this.list.length;i++){
				if(this.list[i].id==id){
					this.list[i].count--;
					if(this.list[i].count==0){
						this.list.splice(i,1);
						return 0;
					}
					return this.list[i].count;
				}
			}
		},
		genForm:function(){
			
		},
		total:function(){
			var total=0;
			for(var i=0;i<this.list.length;i++){
				total+=this.list[i].count*parseFloat(this.list[i].price);
			}
			return total.toFixed(2);
		},
		isMinCost:function(){
			var cost=-1;
			var total=this.total();
			if(total<this.minCost){
				cost=this.minCost-total;
			}
			return cost;//cost=-1满足起送 cost>=0起送差额
		},
		getItemTotal:function(id){
			for(var i=0;i<this.list.length;i++){
				if(this.list[i].id==id){
					return (this.list[i].count*parseFloat(this.list[i].price)).toFixed(2);
				}
			}
		}
		
		
	}
	var minCostFunc=function(){
		var minCost=cart.isMinCost();
	
		if(minCost==-1){
			$(".cart-filled").addClass("hidden");
			$(".cart-submit").removeClass("hidden");
			
		}else{
			$(".cart-min-deliver").html(minCost);
			$(".cart-filled").removeClass("hidden");
			$(".cart-submit").addClass("hidden");
		}
	}
	
	$(".detail-menu-addToCart").on("click",function(){
		$(this).addClass("hidden");
		$(this).next().removeClass("hidden");
		var id=$(this).data("id");
		var name=$(this).data("name");
		var price=parseFloat($(this).data("price")).toFixed(2);		
		cart.newItem({
			id:id,
			name:name,
			price:price,
			count:1
		})
		var html="<div class='cart-countCtrl food"+id+"-countCtrl' data-id='"+id+"' data-price='"+price+"'>"+
			"<span class='cart-ctrlN'>"+name+"</span>"+			
			"<span class='ctrlA cart-ctrlA glyphicon glyphicon-plus-sign' data-id='"+id+"'></span>"+
			"<span class='food"+id+"-count ctrlC'>1</span>"+
			"<span class='ctrlD cart-ctrlD glyphicon glyphicon-minus-sign' data-id='"+id+"'></span>"+
			"<span class='food"+id+"-price cart-ctrlP'>￥"+price+"</span></div>";
		
		$(".cart-list").append(html);	
		$(".cart-total").html(cart.total());
		minCostFunc();
		
	});
	$(document).on("click",".ctrlA",function(){
	
		var id=$(this).data("id");
		
		var cur=cart.addCount(id);			
		$(".food"+id+"-count").html(cur);
		$(".food"+id+"-price").html("￥"+cart.getItemTotal(id));
		$(".cart-total").html(cart.total());
		minCostFunc();
	})
	$(document).on("click",".ctrlD",function(){		
		var id=$(this).data("id");
		var cur=cart.reduceCount(id);	
		
		if(cur==0){
			$(".food"+id+"-countCtrl.detail-menu-countCtrl").addClass("hidden");			
			$(".food"+id+"-countCtrl.detail-menu-countCtrl").prev().removeClass("hidden");		
			$(".food"+id+"-countCtrl.cart-countCtrl").remove();
		}else{			
			$(".food"+id+"-count").html(cur);
			$(".food"+id+"-price").html("￥"+cart.getItemTotal(id));			
		}	
		$(".cart-total").html(cart.total());
		minCostFunc();
	});
	
	
	
	$(".cart-submit").on("click",function(){
		var html="";
		for(var i=0;i<cart.list.length;i++){
			html+="<input type='text' name='billList["+i+"].foodid' value="+cart.list[i].id+">"+
			"<input type='text' name='billList["+i+"].name' value="+cart.list[i].name+">"+
			"<input type='text' name='billList["+i+"].price' value="+cart.list[i].price+">"+
			"<input type='text' name='billList["+i+"].count' value="+cart.list[i].count+">";
		}
		$(".cart-input-mesg").append(html);
		$(".cart").submit();
	})
	/*
	$(window).bind('beforeunload',function(){
		return '您输入的内容尚未保存，确定离开此页面吗？';
		}); 
	*/
	/*is_favor*/
	var userFavor=$(".header-userMesg-favor").html();
	if(userFavor&&userFavor!=" "){
		if(userFavor.indexOf($(".detail-shop-mesg").data("shopid"))!=-1){
			$(".is-favor").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
			$(".is-favor").next().html("已收藏");
			$(".is-favor").next().css("color","#ccc");
		}
	}
	
	/*star*/
	$(".star").each(function(idx,item){	
		var count=$(item).attr("value");
		var full="";
		var empty="";
		for(var i=1;i<=count;i++){
			full+="<i id="+i+" class='glyphicon glyphicon-star star'></i>";
		}
		for(var j=count+1;j<=5;j++){
			empty+="<i id="+i+" class='glyphicon glyphicon-star-empty star'></i>";
		}
		$(item).append($(full+empty));
		
	});
	
});
</script>




</head>

<body data-spy="scroll" data-target=".navbar" data-offset="105">
<div class="stable">
<jsp:include page="header.jsp"/>
</div>

<div class="container">
	<!-- banner -->
	<div class="row detail-banner">
	<div class="col-xs-5">
		<img class="detail-shop-pic" alt="" src="${pageContext.request.contextPath}/res/img/${shop.avatar}">
		<div data-shopid="${shop.id}">
		   <h4 data-shopname="${shop.name}">${shop.name }</h4>
		   <!--  
		   <h5>简介:${shop.tags }</h5>
		   
		   <h5>地址:${shop.address}</h5>	
		   -->	
		   <h5>联系电话:${shop.telephone }</h5>
		   <h5>营业时间：${shop.opentime }</h5>   
		</div>
	</div>
	<div class="col-xs-2">
		<span class="star" value="${shop.star}"></span><br>
		<h5>商家评分</h5>
	</div>
	<div class="col-xs-2">
		<span>${shop.speed}分钟</span><br>
		<h5>平均送货速度</h5>
	</div>
	<div class="col-xs-3">
		<span class="glyphicon glyphicon-heart-empty is-favor"></span>
		<h5>收藏本店</h5>
	</div>
	</div>
	<!-- banner-end  -->
	<!-- main-right -->
	<div class="col-sm-12 col-md-3 col-md-push-9">
		<h4 class="positive">商家公告</h4>
		<div>${shop.tips }</div>
	</div>
	<!-- main-right-end -->
	<!-- main-left -->
	<div class="col-sm-12 col-md-9 col-md-pull-3">
		<ul class="detail-nav">
			<li class="detail-nav-food active">所有商品</li>
			<li class="detail-nav-comment">评价</li>
			<li class="detail-nav-shop">商家资质</li>
		</ul>
		<!-- shop 菜单 -->
		<div id="menu" class="detail-menu">
			<div class="detail-category detail-category1">
				<nav class="navbar" role="navigation">
					<ul class="nav navbar-nav">
						<c:forEach items="${types}" var="type" varStatus="status">
							<li class=""><a href="#type${status.index}">${type}</a></li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<div class="detail-category detail-category2 hidden">
				<nav class="navbar" role="navigation">
					<ul class="nav navbar-nav">
						<c:forEach items="${types}" var="type" varStatus="status">
							<li class=""><a href="#type${status.index}">${type}</a></li>
						</c:forEach>
					</ul>
				</nav>
			</div>
			<ul class="detail-menu-sort">
				<li class="detail-sort-default">默认排序</li>
				<li class="detail-sort-comment">评分</li>
				<li class="detail-sort-count">销量</li>
				<li class="detail-sort-price">价格</li>
				<li>视图</li>
			</ul>
			<div class="fc"></div>
			<c:forEach items="${types}" var="type" varStatus="status">
				<div class="detail-menu-i">
				<div class="detail-title" id="type${status.index}">- / <spsn class="font-family">Menu</spsn> ${type} / -</div>
				<c:forEach items="${foodlist}" var="food" >	
				<c:if test="${type==food.type}">		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
				<div class="detail-menu-food">
					<img class="detail-menu-img" alt="" src="${pageContext.request.contextPath}/res/img/${food.avatar}">				
					<div class="detail-menu-mesg">
						名称:<span class='name'>${food.name}</span><br/>
						价格:<span class='price' value="${food.price}">${food.price}</span><br/>				
						月销量：<span class="sold" value=""></span>				
		            	<div class="reduce choose hidden"><span class="glyphicon glyphicon-minus-sign"></span></div>
		            	<div class="count choose hidden">0</div>
		            	<div class="add choose hidden"><span class="glyphicon glyphicon-plus-sign"></span></div>
					</div>	
					<div class="detail-menu-addToCart text-center" data-name="${food.name}" data-price="${food.price}" data-id="${food.id}">加入购物车</div>	
					<div class="detail-menu-countCtrl food${food.id}-countCtrl hidden">
						<span class="ctrlD menu-ctrlD text-center" data-id="${food.id}">-</span>
						<span class="ctrlC menu-ctrlC text-center food${food.id}-count">1</span>
						<span class="ctrlA menu-ctrlA text-center" data-id="${food.id}">+</span>						
					</div>		
	            </div>
	            </c:if>
				</c:forEach>
				<div class="fc"></div>
				</div>
				<div class="fc"></div>
			</c:forEach>
					  
		</div>
		<!-- 菜单end -->
		<!-- comments -->
		<div class="hidden" id="comments">
			评论
		</div>
		<!-- comments end -->
	</div>	
	<!-- main-left-end -->

</div>

<form class="cart" action=${pageContext.request.contextPath}/shop/index method=post>
	<div class="cart-input-mesg hidden">
		<input type="text" name="shopid" value="${shop.id}">
	</div>
	<div class="cart-header mesg-title">
	购物车<span class="cart-clean cursor-pointer">[清空]</span>
	</div>
	<div class="cart-list">
	
	</div>
	<div class="cart-count mesg-title col-xs-7">		
		<span class="glyphicon glyphicon-shopping-cart"></span>￥<span class="cart-total">0</span>|配送费￥<span class="deliver-cost">${shop.delivercost}</span>
	</div>
	<div class="col-xs-5 ">
		
		<button class="btn cart-filled" type="button">还差<span class="cart-min-deliver" data-mincost="${shop.mincost}">${shop.mincost}</span>元起送</button>
		<button class="btn cart-submit hidden" type="button">去结算</button>
	</div>
</form>
<div class="col-xs-12">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>