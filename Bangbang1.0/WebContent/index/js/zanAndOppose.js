// JavaScript Document
$(document).ready(function() {
	
	var critiqueList = $(".ques-answer");
	//添加回复
	var zan,oppose,reply,critId;
	$.each(critiqueList,function(){
		//显示回复
		var critique = $(this);
		zan = $(this).children(".ans-append").children(".agree");
		oppose = $(this).children(".ans-append").children(".oppose");
		reply = $(this).children(".ans-append").children(".addReply");
		//显示回复
		reply.bind("click",function(){
			var answer = $(this).children(".showReply").html();
			var replyArea = $(this).parent().parent().children(".replyArea");
			var critId = $(this).siblings(".criId").html();
			console.log("评论id是:"+critId);
			if(answer == "回复"){
				console.log("展开回复");
				$.ajax({
					type: "POST",
					url: "getAnswer.action",
					data: "currentPage=1&id="+critId,
					dataType: "json",
					success: function(data) {
							console.log("返回json数据为"+data);
							if(data.error == "error"){
								alert("出现错误!");
							}else{
								//console.log(data);
								replyArea.html("");
								console.log("返回html是:"+data.html);
								console.log("当前页面是:"+data.currentPage);
								console.log("总数页面是:"+data.totalPage);
								replyArea.append(data.html);
								replyArea.css("display","block");
								replyArea.siblings(".ans-append").find(".showReply").html("取消回复");
								replyArea.siblings(".ans-append").find(".replyCount").css("display","none");
								//添加回复
								var addAns = replyArea.find(".add-ans");
								//判断是否登录
								addAns.parent().siblings(".reply-input").children(".anscontent").bind("click",function(){
									console.log("用户名:"+($(this).parent().siblings(".user").val() == "null"));
									if($(this).parent().siblings(".user").val() == 'null'){
										popLogin();
									}
								});
								//对回复添加回复
								var answerCus = replyArea.find(".reply");
								console.log(answerCus.length);
								$.each(answerCus,function(){
									var reply = $(this);
									reply.bind("click",function(){
										var addReply = $(this).parent().parent().parent().siblings(".add-reply");
										var clickUser = addReply.find(".user").val();
										console.log("谁点击回复："+clickUser);
										clickUser = clickUser+":";
										console.log("谁点击回复："+clickUser);
										var wantToReplyUser = $(this).parent().siblings("a").html();
										console.log("回复的用户名："+wantToReplyUser);
										if(clickUser != wantToReplyUser ){
											var con = addReply.find(".anscontent");
											console.log(con.attr("class"));
											con.val("回复"+wantToReplyUser);
										}else{
											$(this).unbind("click");
										}
									});
								});
								//进行页面切换
								
								var pageList = replyArea.find(".ans-page").children("a");
								var currentPage = data.currentPage;
								var totalPage = data.totalPage;
								addPageEvent(pageList,currentPage,totalPage);
								//绑定添加回复按钮
								addAns.bind("click",function(){
									var replyZone = $(this).parent().parent().parent();
									var inputCon = $(this).parent().siblings(".reply-input").children(".anscontent");
									var content = inputCon.val();
									var critiqueId = $(this).parent().siblings(".critiqueId").val();
									var	user = $(this).parent().siblings(".user").val();
									console.log("用户名:"+user);
									if(user == ""){
										popLogin();
									}else{
										$.ajax({
											type: "POST",
											url: "addAnswer.action",
											dataType: "text",
											data: "content="+content+"&id="+critiqueId,
											success: function(data) {
													if(data == "success"){
														var html = "<div class='showAns'><a href='#' class='ans-headImg'><img src='user/"+user+"/images/cus.jpg' /></a>"
																	+"<div class='ans-person'>"
												                        +"<a href='#'>"+user+":</a>"
												                        +"<span>"+content+"</span>"
												                        +"<div class='ans-bottom'><span class='reply'>回复</span><span class='reply-time'><s:property value='#ans.date' /></span></div>"
												                    +"</div>"
												                +"</div>";					
														console.log(replyZone.attr("class"));
														var replyNum = replyZone.parent().children(".ans-append").find(".replyCount").html();
														replyZone.parent().children(".ans-append").find(".replyCount").html(++replyNum);
														if(replyZone.children(".showAns").length == 0){
															replyZone.children(".add-reply").before(html);
														}else{
															replyZone.children(".showAns").last().after(html);
														}
														
													}else{
														alert("出现错误!");
													}
												} 
										});
									}	
								});
							}
						}
				});	
			}else{
				console.log("关闭回复");
				replyArea.css("display","none");	
				replyArea.siblings(".ans-append").find(".showReply").html("回复");
				replyArea.siblings(".ans-append").find(".replyCount").css("display","inline");
				
			}
			
		});
		zan.bind("click",function(){
			var zanCount = $(this).children("i").html();
			var fontWeight = $(this).css("font-weight");
			var color = $(this).css("color");
			var zan = $(this);
			var oppose = $(this).siblings(".oppose");
			var criId = $(this).siblings(".criId").html();
			var zan = $(this);
			var username = $(this).siblings(".loginUser").html();
			if(username == ""){
				console.log("zz");
				popLogin();
			}else{
				if(fontWeight == 400 && (oppose.css("font-weight") != 600)){
					$.ajax({
						type: "POST",
						url: "zanAndOppose.action",
						data: "click=zan&command=plus&criId="+criId,
						success: function(data) {
								console.log(data);
								if(data == "success"){
									zanCount++;
									console.log(zanCount);
									zan.css("font-weight","600");
									zan.css("color","#FF8C00");
									zan.children("i").html(zanCount);
								}else{
									alert("出现错误！");
								}
							}
					});	
				}else if(fontWeight == 600){
					$.ajax({
						type: "POST",
						url: "zanAndOppose.action",
						data: "click=zan&command=minus&criId="+criId,
						success: function(data) {
								console.log(data);
								if(data == "success"){
									console.log(data);
									zanCount--;
									zan.css("font-weight","normal");
									zan.css("color","#787d82");
									zan.children("i").html(zanCount);
								}else{
									alert("出现错误！");
								}
							}           
					});	
				}else{
					if(window.confirm("您已拉进小黑屋，原谅吗？")){
						$.ajax({
							type: "POST",
							url: "zanAndOppose.action",
							dataType: "text",
							data: "click=oppose&command=minus&criId="+criId,
							success: function(data) {
									if(data == "success"){
										var opposeCount = $("#oppose").children("i").html();
										opposeCount--;
										oppose.css("font-weight","normal");
										oppose.css("color","#787d82");
										oppose.children("i").html(opposeCount);
									}
								} 
						});
					}
				}
			}
		});
		oppose.bind("click",function(){
			var opposeCount = $(this).children("i").html();
			var fontWeight = $(this).css("font-weight");
			var oppose = $(this);
			var zan = $(this).siblings(".agree");
			var criId = $(this).siblings(".criId").html();
			var oppose = $(this);
			var username = $(this).siblings(".loginUser").html();
			if(username == ""){
				console.log("zz");
				popLogin();
			}else{
				if(fontWeight == 400 && (zan.css("font-weight") != 600)){
					$.ajax({
						type: "POST",
						url: "zanAndOppose.action",
						dataType: "text",
						data: "click=oppose&command=plus&criId="+criId,
						success: function(data) {
								if(data == "success"){
									opposeCount++;
									console.log(opposeCount);
									oppose.css("font-weight","600");
									oppose.css("color","#FF8C00");
									oppose.children("i").html(opposeCount);	
								}else{
									alert("出现错误！");
								}
							}    
					});
				}else if(fontWeight == 600){
					$.ajax({
						type: "POST",
						url: "zanAndOppose.action",
						dataType: "text",
						data: "click=oppose&command=minus&criId="+criId,
						success: function(data) {
								if(data == "success"){
									opposeCount--;		
									oppose.css("font-weight","normal");
									oppose.css("color","#787d82");
									oppose.children("i").html(opposeCount);
								}else{
									alert("出现错误！");
								}
							}
					});
				}else{
					if(window.confirm("您已夸赞Banger为雷锋,是否取消？")){
						$.ajax({
							type: "POST",
							url: "zanAndOppose.action",
							dataType: "text",
							data: "click=zan&command=minus&criId="+criId,
							success: function(data) {
									if(data == "success"){
										var zanCount = $("#zan").children("i").html();
										zanCount--;
										zan.css("font-weight","normal");
										zan.css("color","#787d82");   
										zan.children("i").html(zanCount);
									}
								} 
						});
					}
				}
			}
		});
	});
	
	
	
});
function popLogin(){
	$('#login').addClass("active");
	$("#signIn").css("display","block");
	$('#logCon').css("display","block");
}
//新页面绑定事件
function addPageEvent(obj,now,whole){
	
	console.log(obj.length);
	console.log("当前页面是:"+now);
	$.each(obj,function(){
		var currentPage = now;
		var totalPage = whole;
		$(this).bind("click",function(){
			var pageCount = $(this).html();
			console.log(currentPage);
			console.log(totalPage);
			if(pageCount == "首页"){
				pageCount = 1;
			}else if(pageCount == "上一页"){
				pageCount = --currentPage;
			}else if(pageCount == "下一页"){
				pageCount = ++currentPage;
			}else if(pageCount == "尾页"){
				pageCount = totalPage;
			}
			console.log("跳转页面是:"+pageCount);
			var replyRegion = $(this).parent().parent();
			console.log(replyRegion.attr("class"));
			var id = $(this).parent().parent().siblings(".ans-append").children(".criId").html();
			console.log("评论id:"+id);
			$.ajax({
				type: "POST",
				url: "getAnswer.action",
				data: "currentPage="+pageCount+"&id="+id,
				dataType: "json",
				success: function(data){
					if(data.error == "error"){
						alert("出现错误!");
					}else{
						replyRegion.html("");
						replyRegion.append(data.html);
						//加载的新页面添加事件
						var pageList = replyRegion.find(".ans-page").children("a");
						var currentPage = data.currentPage;
						var totalPage = data.totalPage;
						addPageEvent(pageList,currentPage,totalPage);
					}
				}
			});
		});
	});
	
}
