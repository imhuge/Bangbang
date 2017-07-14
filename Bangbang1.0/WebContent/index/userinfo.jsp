<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/userinfo.css"/>
<link type="text/css" rel="stylesheet" href="css/logReg.css"/>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<title>个人主页</title>
<style type="text/css">
	*{ margin:0; padding:0;}
	body{ font:14px/1.5 "PingFang SC", Helvetica, "Helvetica Neue", "微软雅黑", Tahoma, Arial, sans-serif;}
	a{ text-decoration:none;}
	.header{ width:100%; height:60px; background-color:#000;}
	.mid-box{ width:1000px; height:60px; margin:0 auto;}
	.logo{ float:left; background:url(images/head_bg.png) no-repeat center; width:134px; height:60px;}
	.index{ float:left; height:60px; width:60px; text-align:center; line-height:60px; margin-left:20px; transition:background-color 0.5s;}
	.index:hover{ background-color:#333;}
	.index a{ color:#fff; font-size:14px;}
	.bangIndex{ float:left; text-align:center; height:60px; width:80px; line-height:60px; transition:background-color 0.5s; }
	.bangIndex a{ color:#fff;  font-size:14px;}
	.bangIndex:hover{ background-color:#333;}
	.search{ float:right; width:330px; height:32px; margin-top:14px; margin-right:55px;}
	.form .txt{ float:right; width:260px; height:32px;}
	.txt input{ width:260px; height:32px; border:0 none;}
	.form .btn{ float:right;width:70px; height:32px;}
	.btn input{ width:70px; height:32px; border:0; color:#FFC680; font-size:14px; font-family:"微软雅黑"; background-color:#FF8C00; cursor:pointer;}
	.login,.register{ float:right;  height:60px; width:60px; line-height:60px; text-align:center; margin-right:20px; transition:background-color 0.5s;}
	.login:hover{ background-color:#f00; cursor:pointer;}
	.register:hover{ background-color:#333; cursor:pointer;}
	.customer a{ text-decoration:none; color:#666; font-family:"微软雅黑";}
	
	.user-wrap{ width:100%; height:220px; background:url(images/user_bg.jpg) no-repeat;}
	.user-detail{ width:1000px; margin:0 auto;}
	.user-info{ margin-left:300px; padding-top:40px;}
	.user-info span{ font-size:32px; font-weight:600; line-height:40px; text-align:left; color:#fff;}
	.user-info .about-info{ display:block; font-size:14px; color:#fff; line-height:20px; text-align:left; margin-top:6px;}
	.user-info .user-desc{ display:block; font-size:14px; line-height:24px; color:#fff; text-align:left; margin-top:20px; word-break:break-all; word-wrap:break-word; opacity:0.5;}
	
	
	.wraper{ width:100%;}
	.showArea{ width:1000px; margin:0 auto; overflow:hidden;}
	.content-wrap{ margin-top:20px; overflow:hidden;}
	.leftwraper{ float:left; width:300px;}
	.leftwraper .user-img{ width:150px; height:150px; margin-top:40px; margin-left:auto;margin-right:auto;}
	.leftwraper .user-img img{ width:150px; height:150px; border-radius:50%;}
	.leftwraper .nav-slider ul{ list-style:none;}
	.leftwraper .nav-slider li{ height:60px; border-bottom:1px solid #EDF1F2; width:160px; margin:0 auto; display:list-item; text-align:-webkit-match-parent;}
	.nav-slider li a{ display:block; height:60px; font-size:16px; line-height:60px; text-align:center; color:#5e5e5e;}
	.nav-slider li .nav-hover:hover{  color:#14191e;}
	.nav-slider li .active{ color:#F01400;}
	.nav-list img{ vertical-align:middle;}
	.nav-list .main-page{ position:relative; left:-25px;}
	.nav-list .arrow{ position:relative; right:-45px;}
	
	.rightwraper{ float:left; width:600px; overflow:hidden;}
	.dynamic{ height:60px; line-height:60px; border-bottom:1px solid #CFD5D8;}
	.dynamic span{ color:#787d82; font-size:14px;}
	.ques-answer{ padding-top:20px; padding-bottom:24px; border-bottom:1px solid #d0d6d9;}
	.user-mes{ overflow:hidden; height:50px; line-height:50px;}
	.user-mes img{ float:left; width:50px; border-radius:50%; vertical-align:middle;}
	.userInfo{ float:left; height:50px; line-height:50px;}
	.userInfo a{ font-size:16px; font-weight:bold; padding-left:10px; color:#14191e;}
	.ans-date{ float:right; color:#787d82; padding-left:10px;}
	.helpTitle{ margin-left:60px; height:40px; font-size:16px; color:#07111b; line-height:40px;}
	.helpMes{ padding:10px 10px; margin-left:60px; background-color:#f2f4f6;}
	.helpMes a{ color:#4d555d; font-size:18px; font-weight:bold; line-height:35px; white-space:nowrap; overflow:hidden;}
	.helpMes a:hover{ color:#14191e;}
	.ans-append{ margin-top:20px; box-sizing:border-box; padding-left:50px;}
	.ans-append span{ display:inline-block; line-height:24px; font-size:12px; color:#787d82; margin-right:20px; cursor:pointer;}
	.ans-append span:hover{ color:#14191e;}
	.ans-append .agree{ height:24px; border:1px solid #d0d6d9; padding:0 9px; transition:border-color 0.5s;}
	.ans-append .agree:hover{ border-color:#14191e;}
	
	
	.footer{ width:100%; margin-top:30px; height:200px; background-color:#000;}
	.footer-content{ width:1000px; margin:0 auto;}
	.foot-title{ width:720px; height:40px; font-size:12px; text-align:center; padding-top:40px; margin:0px auto;}
	.foot-title ul{ display:block; width:350px; margin:0 auto; height:20px; list-style:none; text-align:center;}
	.foot-title ul li{ float:left; color:#fff; }
	.foot-title p{ clear:both; color:#666;}
	.foot-value{ width:600px; height:50px; margin:40px auto;}
	.foot-value ul{ list-style:none;}
	.foot-value li{ display:block; float:left; margin-right:20px;}
	.clear{ clear:both;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
        var slider = $('#slider');
		var navList = slider.find('a');
		navList.each(function(index, element) {
            var navItem = $(this);
			$(this).bind("click",function(){
				navList.each(function() {
                    $(this).removeClass("active");
					$(this).addClass("nav-hover");
                });
				navItem.removeClass("nav-hover");
				navItem.addClass("active");
			});
        });
    });
</script>
</head>

<body>
<div class="header">
    <div class="mid-box">
        <div class="logo"></div>
        <div class="index">
        	<a href="showIndex.action">首页</a>
        </div>
        <div class="bangIndex"><a href="showFound.action">帮帮招领</a></div>
        <s:if test="!#session.username">
        	<div class="customer register">
            	<a id="wantRegis" href="#">注册</a>
        	</div>
        	<div class="customer login">
            	<a id="wantSign" href="#">登录</a>
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
<div class="user-wrap">
	<div class="user-detail">
        <div class="user-info">
            <span><s:property value="#request.username" /></span>
            <p class="about-info"><s:property value="#request.bang" />帮帮</p>
            <p class="user-desc">${empty requestScope.signature ? "这位同学很懒，木有签名的说~" : requestScope.signature  }</p>
        </div>
    </div>
</div>
<div class="wraper">
	<div class="showArea">
        <div class="content-wrap">
            <div class="leftwraper">
                <div class="user-img"><img src="user/<s:property value="#request.username" />/images/cus.jpg" /></div>
                <div class="nav-slider" id="slider">
                	<ul>
                    	<li><a href="#" class="nav-list active"><img src="images/main-page.png" class="main-page" />主页<img src="images/arrow.png" class="arrow" /></a></li>
                        <li><a href="#" class="nav-list nav-hover"><img src="images/main-page.png" class="main-page" />帮帮<img src="images/arrow.png" class="arrow" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="rightwraper">
                <div class="dynamic"><span>最新动态</span></div>
                <s:iterator value="#request.userAll" id="allMes" status="sta">
	                <div class="ques-answer">
	                    <div class="user-mes">
	                        <a href="#"><img src="user/<s:property value="#request.username" />/images/cus.jpg" /></a>  
	                        <div class="userInfo">
	                            <a href="#" class="user"><s:property value="#request.username" /></a>
	                        </div>
	                        <div class="ans-date">
	                            <s:property value="#allMes.date" /> 
	                        </div>    
	                    </div>
	                    <div class="helpTitle">在帮帮寻求帮友~</div>
	                    <div class="helpMes">
	                        <a href="showMessage.action?userId=<s:property value='#allMes.userId'/>
	                		& id=<s:property value='#allMes.id'/>"><s:property value="#allMes.title" /></a>
	                    </div>
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
</body>
</html>