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
<title>帮帮招领</title>
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
	.txt input{ width:260px; height:32px; padding:0 5px; border:0 none;}
	.form .btn{ float:right;width:70px; height:32px;}
	.btn input{ width:70px; height:32px; border:0; color:#FFC680; font-size:14px; font-family:"微软雅黑"; background-color:#FF8C00; cursor:pointer;}
	.login,.register{ float:right;  height:60px; width:60px; line-height:60px; text-align:center; margin-right:20px; transition:background-color 0.5s;}
	.login:hover{ background-color:#f00; cursor:pointer;}
	.register:hover{ background-color:#333; cursor:pointer;}
	.customer a{ text-decoration:none; color:#666; font-family:"微软雅黑";}
	
	.wraper{ width:100%; margin-top:10px;}
	.showArea{ width:1000px; margin:0 auto; overflow:hidden;}
	.leftwraper{ float:left; width:640px;}
	.question{ height:80px; background-image:url(images/bang_bg.png);}
	.bangDes{ float:left; text-align:center; line-height:80px; margin-left:50px;}
	.bangDes p{ font-size:24px; font-weight:bold; }
	.question .bang a{ float:right; width:160px; height:40px; font-size:14px; color:#fff; background-color:#f01400; margin-right:40px; margin-top:20px; text-align:center; line-height:40px; cursor:pointer;}
	
	.ad-head{ background-color:#fff; height:60px; line-height:60px;}
	.ad-head span{ margin-left:10px; color:#07111b; font-size:16px;}
	.hot-ad .hot-main{ width:640px;}
	.hot-main .hot-con{  height:64px; line-height:64px; border-top:1px solid #ccc; background:url(images/con_bg.png) 2% center no-repeat;}
	.hot-main .hot-con a{ color:#07111b; padding-left:40px;}
	.hot-main .hot-con a:hover{ color:#FD4C58;}
	
	.help{ border-radius:10px; width:620px; background-color:#EDF1F7; margin-bottom:10px; padding:20px 0 15px 20px; }
	.helpTop{ }
	.helpUser{ overflow:hidden;}
	.helpUser img{ float:left; width:50px; border-radius:50%; vertical-align:middle;}
	.helpUserInfo{ float:left; height:60px;}
	.helpUserInfo a{ font-size:16px; font-weight:bold; padding-left:10px; color:#14191e;}
	.helpUserInfo p{ color:#787d82; padding-left:10px;}
	.helpMes{ margin-left:60px;}
	.helpMes a{ font-size:18px; font-weight:600; color:#14191e;}
	.helpMes p{ color:#787d82; padding:5px;}
	.message{ overflow:hidden; margin-top:10px; margin-left:40px;}
	.message a{ float:left; display:block; height:25px; line-height:25px; color:#787d82; border:1px solid #ccc; margin-left:20px; background-color:#fff; border-radius:5px;}
	.message a img{ padding-left:10px; padding-right:5px; vertical-align:middle; }
	.message .zan{ width:60px; }
	.zan img{ vertical-align:middle;}
	.message .share{ width:45px;}
	.message .critique{ width:60px;}
	
	.page{ overflow:hidden; margin:20px auto;}
	.page a{ display:inline-block; margin:0 8px; padding:0 4px; min-width:24px; line-height:32px; font-size:14px; color:#4d555d; text-align:center; border-radius:16px; transition:background-color 0.5s;}
	.page .active{ background-color:#4d555d; color:#fff;}
	.page .enabled:hover{ background-color:#14191e; color:#fff;}
	.page .disabled{ display:inline-block; margin:0 8px; padding:0 4px; min-width:24px; line-height:32px; font-size:14px; color:#4d555d; text-align:center;}
	
	.rightwraper{ float:left; width:340px; margin-left:20px; overflow:hidden;}
	.rightwraper .top-head{ background-color:#fff; height:60px; line-height:60px; margin-top:20px; border-bottom:1px solid #ccc; overflow:hidden;}
	.top-left-head{ float:left; background-color:#fff; height:60px; line-height:60px;}
	.top-left-head span{ margin-left:10px; color:#07111b; font-size:16px;}
	.top-right-head{ float:right; height:60px; line-height:60px; margin-right:5px;}
	.top-right-head a{ color:#14191e;}
	.top-right-head a:hover{ color:#5e5e5e; cursor:pointer;}
	.ranking_list a{ color:#07111b; padding:5px 10px;;}
	.choose{ background-color:#F9E7E9;}
	.topList{ height:65px; line-height:65px;}
	.topList div{ float:left; font-size:14px;}
	.customerMes img{ display:inline-block; width:50px; height:50px; vertical-align:middle; margin-right:10px; border-radius:50%;}
	.customerMes a{ color:#787d92; font-weight:600;}
	.topList a:hover{color:#07111b;}
	.topList .top-count{ float:right; color:#5e5e5e; margin-right:10px;}
	.rank{ margin-left:10px; margin-right:20px; color:#b5b9bc;}
	.top1{ color:#f8b551;}
	.top2{ color:#787d82;}
	.top3{ color:#ec6941;}
	
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
        var page = $('#page');
		var aList = page.children('a');
		console.log(aList.length);
		aList.each(function(index, element) {
            var aa = $(this);
			$(this).bind("click",function(){
				aList.each(function(index, element) {
                    $(this).removeClass("active");
                });
				aa.addClass("active");
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
<div class="wraper">
	<div class="showArea">
    	<div class="leftwraper">
        	<div class="question">
            	<div class="bangDes">
            		<p>交大人自己的帮帮</p>
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
            <div class="hot-ad">
            	<div class="ad-head">
                	<span>推荐</span>
            	</div>
            	<div class="hot-main">
            		<div class="hot-con">
                		<a href="#">黑色钱包一个，一餐丢失，捡到的吱一声！</a>
            		</div>
            		<div class="hot-con">
                		<a href="#">黑色钱包一个，一餐丢失，捡到的吱一声！</a>
            		</div>
                </div>
            </div>
            <div class="mainCon">
            	<s:iterator value="#request.all" id="mes" status="sta">
	            	<div class="help">
	                	<div class="helpTop">
	                        <div class="helpUser">
	                            <a href="showUserInfo.action?userId=<s:property value='#mes.userId'/>"><img src="user/<s:property value='#request.userList[#mes.userId]'/>/images/cus.jpg" /></a>  
	                            <div class="helpUserInfo">
	                                <a href="showUserInfo.action?userId=<s:property value='#mes.userId'/>" class="user"><s:property value='#request.userList[#mes.userId]'/></a>
	                                <p>发表于<s:property value="#mes.date" /></p> 
	                            </div>
	                                
	                        </div>
	                        <div class="helpMes">
	                            <a href="showMessage.action?userId=<s:property value='#mes.userId'/>& id=<s:property value='#mes.id'/>"><s:property value="#mes.title" /></a>
	                            <p><s:property value="#mes.content" /></p>
	                        </div>
	                    </div>
	                    <div class="message">
	                        <a href="#" class="zan" title="赞"><img src="images/zan.png" /><s:property value="#mes.zan" /></a><a href="#" class="share" title="分享"><img src="images/share.png" /></a><a href="#" class="critique" title="评论"><img src="images/critique.png" /><s:property value="#request.critiqueCounts[#sta.index]" /></a>
	                    </div>
	                </div>
                </s:iterator>
            </div>
            <div class="page" id="page">
            	<s:if test="#request.page.hasPrePage">
           			<a href="showFound.action?currentPage=1" class="enabled">首页</a>
                	<a href="showFound.action?currentPage=${page.currentPage - 1 }" class="enabled">上一页</a>
                	<s:bean name="org.apache.struts2.util.Counter" id="counter">
           				<s:param name="first" value="1" />
           				<s:param name="last" value="#request.page.currentPage - 1" />
	           			<s:iterator status="count">
	           				
	           				<a href="showFound.action?currentPage=<s:property value="#count.index  + 1" />" class="enabled"><s:property value="#count.index  + 1" /></a>
	           			</s:iterator>
           			</s:bean>
           		</s:if>
           		<s:else>
           			<span class="disabled">首页</span>
           			<span class="disabled">上一页</span>
           		</s:else>
           		<a href="showFound.action?currentPage=<s:property value="#request.page.currentPage" />" class="active enabled"><s:property value="#request.page.currentPage" /></a>
           		<s:if test="#request.page.hasNextPage">
           			<s:bean name="org.apache.struts2.util.Counter" id="counter">
           				<s:param name="first" value="#request.page.currentPage + 1" />
           				<s:param name="last" value="#request.page.totalPage" />
	           			<s:iterator status="count">
	           				<a href="showFound.action?currentPage=<s:property value="#count.index  + #request.page.currentPage + 1" />" class="enabled"><s:property value="#count.index  + #request.page.currentPage + 1" /></a>
	           			</s:iterator>
           			</s:bean>
           			<a href="showFound.action?currentPage=${page.currentPage + 1 }" class="enabled">下一页</a>
           			<a href="showFound.action?currentPage=${page.totalPage }" class="enabled">尾页</a>
           		</s:if>
           		<s:else>
           			<span class="disabled">下一页</span>
           			<span class="disabled">尾页</span>
           		</s:else>
            </div>
        </div>
        <div class="rightwraper">
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
	                    <div class="customerMes"><a href="showUserInfo.action?userId=<s:property value='#top.userId'/>"><img src="user/<s:property value='#request.userList[#top.userId]'/>/images/cus.jpg" /><s:property value='#request.userList[#top.userId]'/></a></div>
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
</body>
</html>