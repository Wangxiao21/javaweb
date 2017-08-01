$(function(){
    	if($("#shop_favor").closest(".mesg_block").attr("value")==0){    		
    		$("#shop_favor").removeClass("glyphicon-heart").addClass("glyphicon-heart-empty");
    	}
    	else{    		
    		$("#shop_favor").removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
    	}
    	var newdate=new Date();    	
    	var stmonth=newdate.getMonth();
    	$.ajax({  
            type:"GET",
            url:"${pageContext.request.contextPath}/order/sellinglist?startmonth="+stmonth+"&shopid=${shop.id}",  
            data:null,
            dataType:'json',
            contentType:'application/json', 
            success:function(data){
            	 for(var key in data){
            		 var count=data[key];
            		 $("#foodid"+key).find(".sold").text(count).attr("value",count);            		 
            	 }
            },  
            error:function() {
            	alert("bad request");
            }  
        });    	
    	
    	
    	var cart=new Map();
    	$(".add").click(function(){              		
      		var $father=$(this).parent();
      		var $count=$father.children(".count");
      		$father.children(".reduce").removeClass("hidden");
      		$count.removeClass("hidden"); 
      		var count=Math.ceil($count.html())+1;
      		if(count>0){
      			$count.html(count);
          		cart.put($father.attr("id"),count); 
      		}  
      		drawcart();
      	});
     	$(".reduce").click(function(){
      		var $father=$(this).parent();
      		var $count=$father.children(".count");
      		var $reduce=$father.children(".reduce");
      		var count=Math.ceil($count.html());
      		if(count==1){
      			$count.addClass("hidden");
      			$reduce.addClass("hidden");
      		}else{
      			$count.html(count-1);
      		}       		
      		cart.put($father.attr("id"),count-1);      			 
      		drawcart();       		
      	});
    	$(".tag_comment").click(function(){
    		$(".menu").addClass("hidden");
    		if($("#commentslist").hasClass("hidden")){
    			$("#commentslist").removeClass("hidden");
    		}
    	});
    	$(".tag_menu").click(function(){
    		if($(".menu").hasClass("hidden")){
    			$(".menu").removeClass("hidden");
    		}
    		$("#commentslist").addClass("hidden");
    	});
    	
    	function drawcart(){
      		$("#orderlist").empty();
      		$("#totalcount").empty();
      		
      		if(cart.size()>0){    
      			var append=""; 	
      			var total=0;		
      			for(var i=0;i<cart.size();i++){
      				var id= cart.keys[i];      				
      				var count=cart.data[id]; 
      				if(count>0){
      					var id="#"+id;      					
      					var name=$(id).find(".name").text();         					
      					var price=$(id).find(".price").text(); 
	      				append+="<tr><td>"+name+"</td><td>"+count+"</td><td>"+price+"</td></tr>";
	      				total=calculate(total,count,price);	      				
      				}
      			}
      			$("#orderlist").append($(append));      
      			$("#totalcount").append($("<div>$"+total+"</div>")); 	      				
      		}
      	}
      	function calculate(total,count,price){
      		var floatprice=parseFloat(price);
      		var result=count*floatprice+total; 
      		return Math.round(result*100)/100;
      	}
      	function Map() {         	       
    	    this.keys = new Array();         	    
    	    this.data = new Object(); 
    	    this.put = function(key, value) {     
    	        if(this.data[key] == null){     
    	            this.keys.push(key);     
    	        }     
    	        this.data[key] = value;     
    	    };     
    	             	   
    	    this.get = function(key) {     
    	        return this.data[key];     
    	    };
    	    this.size = function(){     
    	        return this.keys.length;     
    	    };
    	    this.toString=function(){
    	    	var list="";
    	    	for(var i=0;i<cart.size();i++){
      				var id= cart.keys[i];      				
      				var count=cart.data[id];
      				list+=id+"c"+count+"a";
    	    	}
    	    	return list;
    	    }
    	};
    	$("img").each(function(){
        	var div_width=$(this).closest("div").width();
        	var div_height=$(this).closest("div").height();        	
        	$(this).width(div_width);
        	$(this).height(div_height);
        });
    
    	$("#submit").click(function(){    
    		if($(".header_user").attr("id")==""||$(".header_user").attr("id")==null){
    			alert("please login first");
    		}else{    		
    			var total=$("#totalcount").text().substring(1);
    			//var list=JSON.stringify(cart.data);
    			var list=cart.toString();
    			var formid=(new Date()).getTime();    			
    			var query="shopid=${shop.id}&total="+total+"&list="+list+"&formid="+formid;	
    			window.location.href="${pageContext.request.contextPath}/order/orderform?"+query;        		
    		}
    	});
    	$(".star").each(function(idx,item){	
    		var count=$(item).attr("value");
    		var full="";
    		var empty="";
    		for(var i=1;i<=count;i++){
    			full+="<i class='glyphicon glyphicon-star star'></i>";
    		}
    		for(var j=count+1;j<=5;j++){
    			empty+="<i class='glyphicon glyphicon-star-empty star'></i>";
    		}
    		$(item).append($(full+empty));
    		
    	});    	
    	
    	$("#shop_favor").click(function(){
    		if($(".header_user").attr("id")==""||$(".header_user").attr("id")==null){
    			alert("please login first");
    		}else{ 
	    		if($(this).hasClass("glyphicon-heart-empty")){
	    			$.ajax({  
	                    type:"GET",
	                    url:"${pageContext.request.contextPath}/user/add_favorshop?shopid=${shop.id}",  
	                    data:null,
	                    dataType:'json',
	                    contentType:'application/json', 
	                    success:function(){                         	 
	                    },  
	                    error:function() {
	                    }  
	                });
	        		$(this).removeClass().addClass("glyphicon glyphicon-heart");
	    		}
	    		else if($(this).hasClass("glyphicon-heart")){
	    			$.ajax({  
	                    type:"GET",
	                    url:"${pageContext.request.contextPath}/user/delete_favorshop?shopid=${shop.id}",  
	                    data:null,
	                    dataType:'json',
	                    contentType:'application/json', 
	                    success:function(){                         	 
	                    },  
	                    error:function() {
	                    }  
	                });
	        		$(this).removeClass().addClass("glyphicon glyphicon-heart-empty");
	    		}
	    	}    		
    	});
    	
    	$(".tag_sort").click(function(){
        	var $rows_orig=$("li",$("#food_list"));
        	var $sort_rows = $rows_orig.clone();
        	var type=$(this).attr("id");
        	var $this=$(this);
        	$sort_rows.sort(function (a, b) {
                var text_a = $("."+type,$(a)).text();
                var text_b = $("."+type,$(b)).text();
              
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
        	
        	$("#food_list").empty().append($sort_rows);
        	if($this.hasClass("asc")){
            	$this.removeClass("asc").addClass("desc");                         		
            }
        	else if($this.hasClass("desc")){
            	$this.removeClass("desc").addClass("asc");          
            }
        	
        });
    }); 