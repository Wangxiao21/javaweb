<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.0.3.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	$(".idx-list-wrap").on("click","div.idx-shop-wrap",function () {
		window.open("${pageContext.request.contextPath}/shop/detail/21");
	});
	function init() {
		$(".idx-shop-wrap").popover({placement:function(e,g){
			if(g.offsetLeft>$(window).width()*0.6){
				return "left";
			}else{
				return "right";
			}
		},content:function(){
			return $(this).data('tips');
		},trigger:"hover"});
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
	}
	init();
	
    $(".tag_sort").click(function(){
    	var $rows_orig=$("li",$("#shop_list"));
    	var $sort_rows = $rows_orig.clone();
    	var type=$(this).attr("id");
    	var $this=$(this);
    	$sort_rows.sort(function (a, b) {
            var text_a = $("."+type,$(a)).attr("value");
            var text_b = $("."+type,$(b)).attr("value");
          
            if (text_a === text_b) {
                return 0;
            } else {
                if($this.hasClass("asc")){                	
                    return (text_a > text_b ? 1 : -1);               		
                }
               	if($this.hasClass("desc")){                
                  return (text_a < text_b ? 1 : -1);
                  
                }
               
            }
        });
    	
    	$("#shop_list").empty().append($sort_rows);
    	if($this.hasClass("asc")){
        	$this.removeClass("asc").addClass("desc");                         		
        }
    	else if($this.hasClass("desc")){
        	$this.removeClass("desc").addClass("asc");          
        }
    	
    });
    


    $(".idx-classify-main").delegate("li","click",function () {
		$(".idx-classify-main li").removeClass("chosen");
		$(this).addClass("chosen");
		let i=parseInt($(this).data("index"));
		$(".idx-classify-child").addClass("hidden");
		if(i==0){
			let query="${pageContext.request.contextPath}/shop/getAll";
			hasMore=true;
			curPage=0;
			sendAjax(query,select);
		}else{
			$(".idx-classify"+i).removeClass("hidden");
		}
	});
	function select(data) {
		$(".idx-list-wrap").empty();
		try {
			if (data.result && data.result.length > 0) {
				for (var i = 0; i < data.result.length; i++) {
					let str=genShop(data.result[i]);
					$(".idx-list-wrap").append(str);
				}
			} else {
				$(".idx-list-wrap").append("<p class=''>暂无搜索结果</p>")
			}
		}catch(e){
			console.log(e);
		}
		init();
	}
	$(".idx-select-btn").click(function () {

		let value=$(".idx-input").val();
		let query="${pageContext.request.contextPath}/shop/select?value="+value;
		sendAjax(query,select);
	});
	function getByTag(data) {
		$(".idx-list-wrap").empty();
		hasMore=false;
		try {
			if (data.result && data.result.length > 0) {
				for (var i = 0; i < data.result.length; i++) {
					let str=genShop(data.result[i]);
					$(".idx-list-wrap").append(str);
				}
			} else {
				$(".idx-list-wrap").append("<p class=''>暂无搜索结果</p>")
			}
		}catch(e){
			console.log(e);
		}
		init();
	}
	$(".idx-classify-child").delegate("li","click",function () {
		let query="${pageContext.request.contextPath}/shop/getByTag?tag=";
		if($(this).data("name")){
			query+=$(this).data("name");
		}else{
			query+=$(this).text();
		}
		sendAjax(query,getByTag);
	});
	function genShop(shop) {
		return '<div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 idx-shop-wrap" data-tips="'+shop.tips+'" data-id="'+shop.id+'">'+
					'<div class="idx-shopL">'+
						'<img class="idx-shop-pic" alt="" src="${pageContext.request.contextPath}/res/img/'+shop.avatar+'">'+
						'<span class="shopSpeed" value="'+shop.speed+'">'+shop.speed+'分钟</span>'+
					'</div>'+
					'<div class="idx-shopR">'+
						'<p class="mesg-main"><a href=${pageContext.request.contextPath}/shop/detail?id='+shop.id+'>'+shop.name+'</a></p>'+
						'<span class="shopId hidden" value="'+shop.id+'"></span>'+
						'<span class="star" value="'+shop.star+'"></span><br>'+
						'<span>月售x单</span><br>'+
						'<span class="shopDiliver">配送费:￥'+shop.delivercost+'</span><br>'+
						'<span class="shopBenefit hidden">优惠信息：'+shop.star+'</span>'+
					'</div></div>';
	}
	var curPage=0;
	var size=12;
	var hasMore=true;
	var outProcess=true;
	function sendAjax(url,callback) {
		$.ajax({
			type:"GET",
			url:url,
			data:null,
			dataType:'json',
			contentType:'application/json;charset=utf-8',
			success:callback,
			error:function(){
			}
		});
	}
	function getMore(data) {
		try {
			if (data.result && data.result.length > 0) {

				for (var i = 0; i < data.result.length; i++) {
					let str=genShop(data.result[i]);
					$(".idx-bottom").addClass("hidden");

					$(".idx-list-wrap").append(str);

				}
				init();
			} else {
				hasMore=false;
				$(".idx-bottom").text("没有更多结果了").removeClass("hidden");
			}
		}catch(e){
			console.log(e);
		}
		outProcess=true;
	}
	$(window).scroll(function(event) {
		console.log(hasMore+":"+outProcess)
		let dy=document.body.scrollHeight-document.body.clientHeight;
		if($(window).scrollTop()>dy&&hasMore&&outProcess){
			$(".idx-bottom").removeClass("hidden");
			outProcess=false;
			curPage++;
			let query="${pageContext.request.contextPath}/shop/getMore?start="+curPage*size+"&size="+size;
			sendAjax(query,getMore);
		}
	});
});
    </script>
</head>

<body>

<div class="positive idx-header-wrap">
<jsp:include page="header.jsp"/>
</div>
<div class="container">
	<div class="idx-banner">
		<div class="col-xs-3">
			<img class="idx-banner-pic" alt="baner" src="${pageContext.request.contextPath}/res/img/baner.gif">
		</div>
		<div class="col-xs-9">
			<div class="idx-select-wrap">
				<input type="text" class="idx-input" name="keyword" placeholder="搜索商家，美食">
				<button type="button" class="idx-select-btn">搜索</button>
				<div class="">
					热搜：<a href="">火锅</a>&nbsp&nbsp&nbsp<a href="">烤肉</a>&nbsp&nbsp&nbsp<a href="">料理</a>
				</div>
			</div>
		</div>
	</div>
	<div class="idx-classify">
		<span class="idx-classify-title">商家分类：</span>
		<ul class="idx-classify-group idx-classify-main">
			<li class="chosen" data-index=0>全部商家</li>
			<li data-index=1>快餐便当</li>
			<li data-index=2>特色菜系</li>
			<li data-index=3>异国料理</li>
			<li data-index=4>小吃夜宵</li>
		</ul>
		<ul class="idx-classify-group idx-classify-child hidden idx-classify1">
			<li data-name="快餐">全部快餐便当</li>
			<li>简餐</li>
			<li>盖浇饭</li>
			<li data-name="面馆">米粉面馆</li>
			<li>黄焖鸡米饭</li>
			<li>麻辣烫</li>
		</ul>
		<ul class="idx-classify-group idx-classify-child hidden idx-classify2">
			<li data-name="菜系">全部菜系</li>
			<li>川湘菜</li>
			<li>浙江菜</li>
			<li>海鲜</li>
			<li>粤菜</li>
			<li>鲁菜</li>
			<li>新疆菜</li>
		</ul>
		<ul class="idx-classify-group idx-classify-child hidden idx-classify3">
			<li data-name="异国料理">全部异国料理</li>
			<li>日韩料理</li>
			<li>西餐</li>
			<li>东南亚菜</li>
		</ul>
		<ul class="idx-classify-group idx-classify-child hidden idx-classify4">
			<li data-name="小吃夜宵">全部小吃夜宵</li>
			<li>地方小吃</li>
			<li>炸鸡炸串</li>
			<li>小龙虾</li>
			<li>烧烤</li>
			<li>零食</li>
		</ul>


	</div>

	<div class="idx-list-wrap">
	<c:forEach items="${shoplist}" var="shop" >
	<div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 idx-shop-wrap" data-tips="${shop.tips}" data-id="${shop.id}">
		<div class="idx-shopL">
			<img class="idx-shop-pic" alt="" src="${pageContext.request.contextPath}/res/img/${shop.avatar}">
			<span class="shopSpeed" value="${shop.speed}">${shop.speed}分钟</span>
		</div>
   	  	<div class="idx-shopR">
   	  		<p class="mesg-main"><a href=${pageContext.request.contextPath}/shop/detail?id=${shop.id}>${shop.name}</a></p>	      	  	
    	  	<span class="shopId hidden" value="${shop.id}"></span>
    	  	<span class="star" value="${shop.star}"></span><br>
    	  	<span>月售x单</span><br>    	  	
    	  	<span class="shopDiliver">配送费:￥${shop.delivercost}</span><br>
    	  	<span class="shopBenefit hidden">优惠信息：${shop.star}</span>
   	  	</div>     	  
	</div>
	</c:forEach>
	</div>
	<div class="idx-bottom hidden fc">加载中</div>
</div>
<div class="col-xs-12">
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>