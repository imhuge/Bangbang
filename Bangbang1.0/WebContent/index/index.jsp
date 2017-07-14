<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/logReg.css"/>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<title>帮帮网</title>
<style type="text/css">
	*{ margin:0; padding:0;}
	body{ font:14px/1.5 "PingFang SC", Helvetica, "Helvetica Neue", "微软雅黑", Tahoma, Arial, sans-serif;}
	a{ text-decoration:none;}
	input{ padding-left:5px;}
	.header{ width:100%; height:85px; background-color:#207BD9;}
	.mid-box{ width:1000px; height:85px; margin:0 auto;}
	.logo{ float:left; background:url(images/bangbang.jpg) no-repeat center; width:112px; height:59px; padding:10px 0 10px 30px;}
	.bangIndex{ float:left; text-align:center; height:85px; line-height:85px; margin-left:20px; }
	.bangIndex a{ color:#fff; font-size:16px;}
	.bangIndex a:hover{ color:#FFC680;}
	.search{ float:right; width:330px; height:35px; margin-top:25px; margin-right:55px;}
	.form .txt{ float:right; width:260px; height:35px;}
	.txt input{ width:260px; height:35px;padding:0 5px; border:0 none;}
	.form .btn{ float:right;width:70px; height:35px;}
	.btn input{ width:70px; height:35px; border:0; color:#FFC680; font-size:14px; font-family:"微软雅黑"; background-color:#FF8C00; cursor:pointer;}
	.customer{ float:right; width:145px; height:35px; background-color:#FF8C00; line-height:35px; margin-top:25px; margin-right:35px;}
	.customer a{ display:inline-block; width:70px; height:35px; line-height:35px; text-align:center; color:#14191e; font-family:"微软雅黑";}
	.customer a:hover{ color:#f01400;}
	.after-customer{ float:right; width:105px; height:52px; line-height:52px; margin-top:20px; position:relative;}
	.after-customer a{ display:inline-block; width:50px; height:50px; line-height:50px; text-align:center; cursor:pointer;}
	.after-customer .newMes{ color:#fff;}
	.after-customer .newMes:hover{ color:#f01400;}
	.after-customer .cusImg{ width:50px; height:50px; border:2px solid #ccc; border-radius:50%; vertical-align:middle;}
	.after-customer .cusImg:hover{ border-color:#f01400;}
	
	.personal{ display:none; position:absolute; width:240px; padding-top:12px; top:53px; right:0; z-index:100;}
	.triangle{ widht:240px; height:10px; background:url(images/tri.png) 94% center no-repeat;  overflow:hidden;}
	.per-head{ height:80px; background-color:#f01400; overflow:hidden;}
	.per-img{ float:left; width:80px; text-align:center; margin-top:10px;}
	.per-img img{ width:60px; height:60px; border-radius:50%;}
	.per-info{ float:left; color:#fff; line-height:30px;}
	.per-info h3{ font-size:16px; font-weight:600; padding-top:20px;}
	.per-info p{ font-size:14px;}
	.per-bottom{ height:40px; background-color:#fff; overflow:hidden;}
	.per-bottom .setinfo{ float:left; width:80px; height:40px; line-height:40px; text-align:center; color:#787d82;}
	.per-bottom .exit{ float:right; width:80px; height:40px; line-height:40px; text-align:center; color:#787d82;}
	.per-bottom a:hover{ color:#f01400;}
	
	.wraper{ width:100%; margin-top:10px;}
	.showArea{ width:1000px; height:300px; margin:0 auto; overflow:hidden;}
	.navBar{ float:left; width:800px; height:300px; background:url(images/example00.jpg) no-repeat;}
	.rightshow{ float:left; width:196px; height:296px; border:2px solid #207BD9; text-align:center; background-image:url(images/bang_bg.png);}
	.BangLogo{ height:60px; text-align:center; line-height:60px;}
	.BangLogo img{ border-radius:50%;}
	.bangDes{ text-align:left; margin-top:20px; margin-bottom:40px;}
	.bangDes p{ font-size:18px; font-weight:bold; }
	.bangDes span{ padding-left:10px;}
	.rightshow .bang a{ display:block; width:160px; height:40px; font-size:20px; color:#fff; background-color:#207BD9; margin-left:20px; text-align:center; line-height:40px; cursor:pointer;}
	
	.hotTop{ width:1000px; margin:0 auto; overflow:hidden;}
	.hot-head{ background-color:#fff; margin-top:30px; margin-bottom:20px; overflow:hidden;}
	.left-head{ float:left; background-color:#fff; height:30px; line-height:30px;}
	.left-head span{ margin-left:10px; color:#07111b; font-size:16px;}
	.right-head{ float:right; line-height:30px; margin-right:5px;}
	.right-head a{ color:#14191e;}
	.right-head a:hover{ color:#5e5e5e; cursor:pointer;}
	
	.hot-content{ width:1020px; padding-left:20px; margin:0 auto; overflow:hidden;}
	.hot-wrap{ float:left; width:235px; height:171px;; position:relative;}
	.popular{ margin-right:20px;}
	.hot-wrap .hot-img{ display:block; width:235px; cursor:pointer;}
	.hot-wrap img{ width:235px; height:156px; position:absolute; z-index:-1;}
	.hot-des{ width:235px; min-height:120px; padding-top:20px; position:absolute; top:80px; z-index:5;}
	.hot-des:hover{ background-color:#EDF1F7;}
	.hot-des h4{ text-align:center; color:#14191e;}
	.hot-des p{ color:#5e5e5e; font-size:12px; padding:10px;}
	.hot-cus{ width:235px; height:35px; line-height:35px; position:absolute; top:136px; margin-bottom:5px; background-color:#fff; z-index:10; box-shadow:inset 2px 2px 5px #EDF1F7;}
	.hot-cus a{ color:#5e5e5e;}
	.hot-cus .account{ float:left; margin-left:10px;}
	.hot-cus .account:hover{ color:#f00;}
	.hot-cus .count-bang{ float:right; margin-right:10px;}
	
	.hotContent{ width:1000px; margin:0 auto; overflow:hidden;}
	.leftCon{ float:left; width:700px; }
	.leftCon .hot-main{ width:700px; border-top:1px solid #ccc;}
	.leftCon .hot-con{  height:64px; line-height:64px; border-bottom:1px solid #ccc; background:url(images/con_bg.png) 2% center no-repeat;}
	.hot-con a{ float:left; color:#07111b; padding-left:40px;}
	.hot-con a:hover{ color:#FD4C58;}
	.hot-con span{ float:right; color:#787d82; padding-right:5px; font-size:12px;}
	.rightCon{ float:left; width:280px; margin-left:20px; overflow:hidden;}
	.top-head{ background-color:#fff; height:60px; line-height:60px; margin-top:20px; border-bottom:1px solid #ccc; overflow:hidden;}
	.top-left-head{ float:left; background-color:#fff; height:60px; line-height:60px;}
	.top-left-head span{ margin-left:10px; color:#07111b; font-size:16px;}
	.top-right-head{ float:right; height:60px; line-height:60px; margin-right:5px;}
	.top-right-head a{ color:#14191e;}
	.top-right-head a:hover{ color:#5e5e5e; cursor:pointer;}
	.ranking_list a{ color:#07111b; padding:5px 10px;;}
	.choose{ background-color:#F9E7E9;}
	.topList{ height:65px; line-height:65px;}
	.topList div{ float:left; font-size:14px;}
	.customerMes img{ display:inline-block; width:50px; height:50px; border-radius:50%; vertical-align:middle; margin-right:10px;}
	.customerMes a{ color:#787d92; font-weight:600;}
	.topList a:hover{color:#07111b;}
	.topList .top-count{ float:right; color:#5e5e5e; margin-right:5px;}
	.rank{ margin-left:10px; margin-right:20px; color:#b5b9bc;}
	.top1{ color:#f8b551;}
	.top2{ color:#787d82;}
	.top3{ color:#ec6941;}
	
	.footer{ width:100%; margin-top:30px; height:200px; background-color:#D4D4D4;}
	.footer-content{ width:1000px; margin:0 auto;}
	.foot-title{ width:720px; height:40px; font-size:12px; text-align:center; padding-top:40px; margin:0px auto;}
	.foot-title ul{ display:block; width:350px; margin:0 auto; height:20px; list-style:none; text-align:center;}
	.foot-title ul li{ float:left; }
	.foot-title p{ clear:both;}
	.foot-value{ width:600px; height:50px; margin:40px auto;}
	.foot-value ul{ list-style:none;}
	.foot-value li{ display:block; float:left; margin-right:20px;}
	.clear{ clear:both;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var timer;
		clearInterval(timer);
		var hotList = $('.hot-wrap');
		//热门推荐动画
		$.each(hotList,function(){
			var des = $(this).find('.hot-des');
			des.bind("mouseover",function(){
				rollIn(des);
			});
			des.bind("mouseout",function(){
				rollOut(des);
			});
		});
		function rollIn(obj){
			clearInterval(obj.timer);
			obj.timer = setInterval(function(){
				var top = obj.position().top;
				if(top>20){
					top -= 5;
					obj.css('top',top);
				}else{
					clearInterval(obj.timer);	
				}
			},50);
		}
		function rollOut(obj){
			clearInterval(obj.timer);
			obj.timer = setInterval(function(){
				var top = obj.position().top;
				if(top<80){
					top += 5;
					obj.css('top',top);
				}else{
					clearInterval(obj.timer);	
				}
			},30);
		}
		
    });
	
</script>
</head>

<body>
<div class="header">
    <div class="mid-box">
        <a href="showIndex.action"><div class="logo"></div></a>
        <div class="bangIndex"><a href="showFound.action">帮帮招领</a></div>
        <s:if test="!#session.username"> 
	        <div class="customer">
	            <a href="#" id="wantSign">登录</a><a href="#" id="wantRegis">注册</a>
	        </div>
        </s:if>
        <s:else>
        	<div class="after-customer">
            	<a href="#" class="newMes">消息</a>
            	<a id="personal" href="showUserInfo.action?userId=${requestScope.userId }"><img src="user/<s:property value='#session.username' />/images/cus.jpg" class="cusImg" /></a>
        		<div class="personal" id="personalInfo">
                	<div class="triangle"></div>
                	<div class="per-head">
                    	<div class="per-img"><img src="user/<s:property value='#session.username' />/images/cus.jpg" /></div>
                        <div class="per-info">
                            <h3><s:property value='#session.username' /></h3>
                            <p><s:property value="#request.bang" />帮帮</p>
                        </div>
                        <div class="clear"></div>
                    </div> 
                    <div class="per-bottom">
                    	<a href="showEditUserInfo.action" class="setinfo">个人设置</a><a href="exit.action" class="exit">退出</a>
                    </div>
            	</div>
        	</div>
        </s:else>
        <div class="search">
            <form action="#" method="get" class="form">
                <div class="btn"><input type="submit" value="搜 索" /></div>
                <div class="txt"><input type="text" /></div>
            </form>
        </div>
    </div>
</div>
<div class="wraper">
	<div class="showArea">
        <div class="navBar"></div>
        <div class="rightshow">
        	<div class="BangLogo"><img src="images/logoko.jpg" /></div>
            <div class="bangDes">
            	<p>交大人自己的帮帮</p>
                <span>专为交大学生打造的互帮互助平台，愿同学们工作学习愉快！</span>
            </div>
            <div class="bang">
            	<s:if test="!#session.username">
            		<a id="wantHelp" href="#">我要帮帮</a>
            	</s:if>
            	<s:else>
            		<a id="wantHelp" href="wantBang.jsp">我要帮帮</a>
            	</s:else>
            </div>
        </div>
    </div>
    <div class="hotTop">
        <div class="hot-head">
            <div class="left-head">                    
        		<span>热门帮帮</span>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="hot-content" id="hotContent">
	    <s:iterator value="#request.hot" id="mes" status="sta">
	        <div class="hot-wrap popular">
	            <a href="showMessage.action?username=<s:property value='#request.userList[#mes.userId]'/>
	                	& id=<s:property value='#mes.id'/>" class="hot-img">
		            <img src="user/<s:property value='#request.userList[#mes.userId]'/>/images/askBang.jpg" />
		            <div class="hot-des">
		                <h4><s:property value='#mes.title'/></h4>
		                <p><s:property value='#mes.content'/></p>
		            </div>
	            </a>
	            <div class="hot-cus">
	                <a href="showUserInfo.action?userId=<s:property value='#mes.userId'/>" class="account">UP:<s:property value='#request.userList[#mes.userId]'/></a><a class="count-bang"><s:property value='#mes.zan'/>赞</a>
	            </div>
	        </div>
	    </s:iterator>
    </div>
    <div class="hotContent">
        <div class="leftCon">
            <div class="hot-head">
                <div class="left-head">
                    <span>帮帮招领</span>
                </div>
                <div class="right-head">
                    <a href="showFound.action">更多&gt;</a>
                </div>
            </div>
            <div class="hot-main">
            	<s:iterator value="#request.new5" id="new5" status="sta">
	            	<div class="hot-con">
	                	<a href="showMessage.action?username=<s:property value='#request.userList[#new5.userId]' />
	                	& id=<s:property value='#new5.id'/>"><s:property value="#new5.title" /></a>
	            		<span><s:property value='#new5.date'/></span>
	            	</div>
            	</s:iterator>
            </div>
        </div>
        <div class="rightCon">
     		<div class="top-head">
                <div class="top-left-head">
                    <span>帮帮雷锋榜</span>
                </div>
                <div class="top-right-head ranking_list">
                    <a href="#" class="choose">今日</a><a href="#">一周</a>
                </div>
            </div>
            <div class="chartTop">
	            <s:iterator value="#request.bangTop" id="top" status="sta">
	            	<div class="topList">
	                	<div class="rank top1"><s:property value="#sta[index] + 1" /></div>
	                    <div class="customerMes"><a href="showUserInfo.action?userId=<s:property value='#top.userId' />"><img src="user/<s:property value='#request.userList[#top.userId]' />/images/cus.jpg" /><s:property value="#top.username" /></a></div>
	                    <div class="top-count"><s:property value="#top.bang" />帮帮</div>
	                </div>
	            </s:iterator>
            </div>
        </div> 	
    </div>
</div>
<div id="signIn" class="sign-in">
	<div class="login-head">
        	<button id="close" type="button" class="close"></button>
        	<span id="login">登录</span>
            <span id="register">注册</span>
    </div>
	<div class="login-wrap">
        <div class="login-content" id="logCon">
            <form action="login.action" method="post">
                <div class="user">
                    <p>邮箱/用户名/已验证手机</p>
                    <div><input type="text" id="username" class="username" name="username"/></div>
                </div>
                <div class="user">
                    <p>密码</p>
                    <div><input type="password" id="password" class="pwd"  name="password"/></div>
                </div>
                <div class="auto">
                    <label><input type="checkbox" id="autoLogin" />自动登录</label><span><a href="#">忘记密码?</a></span>
                </div>
                <div class="login-btn">
                    <input id="beginLog" type="submit" value="登录" onclick="save()" />
                </div>
            </form>
        </div> 
        <div class="register-content" id="regCon">
        	<div class="hints" id="hints"></div>
        	<form action="register.action" method="post">
	            <div class="user">
	                <p><img src="images/annotation.jpg" />账户名</p>
	                <input type="text" id="inusername" class="username" name="username"/>
	            </div>
	            <div class="user">
	                <p><img src="images/annotation.jpg" />请设置密码</p>
	                <input type="password" id="inpassword" class="pwd"  name="password"/>
	            </div>
	            <div class="user">
	                <p><img src="images/annotation.jpg" />请确认密码</p>
	                <input type="password" id="repassword" class="pwd"  name="repassword"/>
	            </div>
	            <div class="user">
	                <p><img src="images/annotation.jpg" />邮箱</p>
	                <input type="email" id="email" class="bg_img" name="email"/>
	            </div>
	            <div class="protocol">
	                <label><input type="checkbox" id="agreeBook" />我已阅读并同意</label><span><a href="#">《用户注册协议》</a></span>
	            </div>
	          `	<div class="login-btn">
	                <input type="submit" value="提交" id="beginReg" disabled="disabled" />
	            </div>
            </form>
        </div>
    </div>
    <div class="backcover"></div>
</div>
<div class="footer">
    <div class="footer-content">
        <div class="foot-title">
            <ul>
                <li>帮帮简介| </li>
                <li>帮帮公告| </li>
                <li>招贤纳士| </li>
                <li>联系我们| </li>
                <li>客服热线：400-675-1234</li>
            </ul>
            <p>Copyright @ 2006-2014 木刻版区所有 京ICP备09037834号 京ICP证B1034-8373号 某市公安局XX分局备案编号：123456789123</p>
        </div>
        <div class="foot-value">
            <ul>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
                <li><img src="images/credit.jpg" /></li>
            </ul>
        </div>
    </div>
</div>
</html>