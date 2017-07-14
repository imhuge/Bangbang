<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<title>您的问题已提交成功</title>
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
	.login:hover{ background-color:#f00;}
	.register:hover{ background-color:#333;}
	.customer a{ text-decoration:none; color:#666; font-family:"微软雅黑";}
	
	.after-customer{ float:right; height:60px; position:relative;}
	.after-customer .newMes,.cus-img{ display:inline-block; width:60px; height:60px; line-height:60px; text-align:center; transition:background-color 0.5s; cursor:pointer;}
	.after-customer .newMes{ color:#999;}
	.after-customer .newMes:hover{ background-color:#f01400; color:#fff;}
	.after-customer .cusImg{ width:50px; height:50px; border:2px solid #ccc; border-radius:50%; vertical-align:middle;}
	.after-customer .cusImg:hover{ border-color:#f01400;}
	
	.personal{ display:none; position:absolute; width:240px; padding-top:5px; background-color:#000; top:55px; right:0; z-index:100;}
	.triangle{ width:240px; height:10px; background-color:#fff; overflow:hidden;}
	.triangle img{ float:right; margin-right:18px;}
	.per-head{ height:80px; background-color:#f01400; overflow:hidden;}
	.per-img{ float:left; width:80px; text-align:center; margin-top:10px;}
	.per-img img{ width:60px; height:60px; border-radius:50%;}
	.per-info{ float:left; color:#fff; line-height:30px;}
	.per-info h3{ font-size:16px; font-weight:600; padding-top:20px;}
	.per-info p{ font-size:14px;}
	.per-bottom{ height:40px; width:238px; background-color:#fff; border:1px solid #ccc; overflow:hidden;}
	.per-bottom .setinfo{ float:left; width:80px; height:40px; line-height:40px; text-align:center; color:#787d82;}
	.per-bottom .exit{ float:right; width:80px; height:40px; line-height:40px; text-align:center; color:#787d82;}
	.per-bottom a:hover{ color:#f01400;}
	
	.wraper{ width:100%; margin-top:10px;}
	.showArea{ width:1000px; margin:0 auto; overflow:hidden;}
	.ques-head{ height:60px; line-height:60px; margin:0 20px; border-bottom:1px solid #d0d6d9;}
	.ques-head h3{ font-size:18px; font-weight:400;}
	.ques-con{ padding:80px 0; text-align:center; color:#787d82;}
	.ques-con span{ background:url(images/right.png) no-repeat; width:130px; height:130px; display:inline-block;  margin-bottom:10px;}
	.ques-con h3{ font-size:24px;}
	.ques-con p{ font-size:14px;}
	.ques-con .return{ width:160px; height:40px; line-height:40px; margin:15px auto; background-color:#00b33b; border:1px solid #00b33b; cursor:pointer; transition:all 0.3s;} 
	.return:hover{ background-color:#00d747; border-color:#00d747;}
	.return a{ color:#fff; font-size:14px;}
	.ques-con .look a{ color:#14191e;}
	.look a:hover{ color:#f00;}
	
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
</head>

<body>
<div class="header">
    <div class="mid-box">
        <div class="logo"></div>
        <div class="index">
        	<a href="showIndex.action">首页</a>
        </div>
        <div class="bangIndex"><a href="showFound.action">帮帮招领</a></div>
        <div class="after-customer">
           	<a href="#" class="newMes">消息</a>
           	<a id="personal" href="#"><img src="user/<s:property value='#session.username' />/images/cus.jpg" class="cusImg" /></a>
       		<div class="personal" id="personalInfo">
               	<div class="triangle"><img src="images/triangle.png" /></div>
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
        <div class="ques-head">
            <h3>问题发布成功</h3>
        </div>
        <div class="ques-con">
        	<span></span>
        	<h3>您的问题已经提交成功！</h3>
            <p>请耐心等待，肯定会有很多热心的帮友帮助你的</p>
            <p>为鼓励大家互相帮帮，请在他们成功帮助你之后，将你手中的帮帮投给他们</p>
            <div class="return"><a href="showFound.action">返回帮帮招领</a></div>
            <div class="look"><a href="showMessage.action?username=<s:property value='#session.username'/>
            					& id=<s:property value='#session.id'/>">查看我的问题</a></div>
        </div>
    </div>
         	
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