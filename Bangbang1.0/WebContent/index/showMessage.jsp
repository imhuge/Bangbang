<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/logReg.css"/>
<link type="text/css" rel="stylesheet" href="css/userinfo.css"/>
<link type="text/css" rel="stylesheet" href="css/upload.css"/>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<script src="js/zanAndOppose.js" type="text/javascript"></script>
<script src="js/upload.js" type="text/javascript"></script>
<title></title>
<style type="text/css">
	*{ margin:0; padding:0;}
	body{ font:14px/1.5 "PingFang SC", Helvetica, "Helvetica Neue", "微软雅黑", Tahoma, Arial, sans-serif;}
	a{ text-decoration:none;}
	input{ padding:2px 5px; outline:none;}
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
	.txt input{ width:250px; height:32px; padding:0 5px; border:0 none;}
	.form .btn{ float:right;width:70px; height:32px;}
	.btn input{ width:70px; height:32px; border:0; color:#FFC680; font-size:14px; font-family:"微软雅黑"; background-color:#FF8C00; cursor:pointer;}
	.login,.register{ float:right;  height:60px; width:60px; line-height:60px; text-align:center; margin-right:20px; transition:background-color 0.5s;}
	.login:hover{ background-color:#f00; cursor:pointer;}
	.register:hover{ background-color:#333; cursor:pointer;}
	.customer a{ text-decoration:none; color:#666; font-family:"微软雅黑";}
	
	.wraper{ width:100%; margin-top:40px;}
	.showArea{ width:1000px; margin:0 auto; overflow:hidden;}
	.leftwraper{ float:left; width:600px;}
	.question{ width:600px;}
	.question h2{ font-size:24px; line-height:36px; word-break:break-all; word-wrap:break-word;}
	.question .detail-ques{ line-height:36px; font-size:16px; margin-top:16px; word-break:break-all; word-wrap:break-word; overflow:hidden;}
	.user{ height:40px; margin-top:20px; line-height:40px;}
	.user .ques-provider{ color:#0088cc; font-size:12px; padding:2px 4px 2px 5px; background-color:#e5f3fa;}
	.user .author{ font-size:14px; color:#787d82; margin:0 2px 0 6px;}
	
	.add-ques{ background-color:#f6f6f6; padding:20px 30px;}
	.add-ques h3{ font-size:16px; font-weight:400; line-height:32px; margin:5px 0 3px;}
	.add-input{}
	.add-input input{ height:40px; width:552px; padding-left:5px; outline:none;}
	.answer{ margin:20px 0 5px; min-height:40px; width:570px;}
	.answer .submit-ques{ float:right; width:78px; height:38px; font-size:14px; color:#fff; border:0; background-color:#f01400; border-color:#f01400; cursor:pointer;}
	
	.mainCon{}
	.mainCon .ans_num{ color:#b5b9bc; font-size:18px; margin-top: 21px; line-height:58px; border-bottom:1px solid #d0d6d9;}
	.ques-answer{ padding-top:20px; padding-bottom:24px; border-bottom:1px solid #d0d6d9;}
	.user-mes{ overflow:hidden; height:50px; line-height:50px;}
	.user-mes img{ float:left; width:50px; border-radius:50%; vertical-align:middle;}
	.userInfo{ float:left; height:50px; line-height:50px;}
	.userInfo a{ font-size:16px; font-weight:bold; padding-left:10px; color:#14191e;}
	.ans-date{ float:right; color:#787d82; padding-left:10px;}
	.helpMes{ margin-left:60px;}
	.helpMes a{ font-size:18px; font-weight:600; color:#14191e;}
	.helpMes p{}
	.helpMes ul{ list-style:none; display:block; marigin-top:10px;}
	.helpMes ul li{ display:inline-block; margin:5px;}
	.ans-append{ margin-top:20px; margin-bottom:10px; box-sizing:border-box; padding-left:50px;}
	.ans-append i{ font-style:normal; font-size:12px; padding-left:2px;}
	.ans-append span{ display:inline-block; line-height:24px; font-size:12px; font-weight:normal; color:#787d82; margin-right:20px; cursor:pointer;}
	.ans-append span:hover{ color:#14191e;}
	.ans-append .agree{ height:24px; border:1px solid #d0d6d9; padding:0 9px; transition:border-color 0.5s;}
	.ans-append .afterClick{ font-weight:600; color:#FF8C00;}
	.ans-append .agree:hover{ border-color:#14191e;}
	
	.replyArea{ display:none;}
	.showAns{ margin:0 0 2px 60px; padding:10px 20px; background-color:#f3f3f3; overflow:hidden;}
	.showAns .ans-headImg{ float:left; width:50px;}
	.ans-headImg img{ border-radius:50%; width:50px; height:50px;}
	.ans-person{ float:left; margin-left:5px; margin-top:8px; width:440px; line-height:28px; word-break:break-all; padding-right:5px;}
	.ans-person span{ color:#14191e;}
	.ans-bottom{ height:30px; line-height:30px; }
	.ans-bottom span{ color:#787d82;}
	.ans-bottom .addReply{ float:left; width:40px; cursor: pointer;}
	.ans-bottom .reply{ cursor:pointer;}
	.ans-bottom .reply:hover{ color:#14191e;}
	.ans-bottom .reply-time{ float:right; margin-right:5px; font-size:12px;}
	.add-reply{ margin-left:60px; margin-top:20px; background-color:#f3f3f3; padding:10px 20px; overflow:hidden;}
	.add-reply h3{ font-size:16px; font-weight:400; line-height:32px; margin:5px 0 3px;}
	.reply-input{ height:40px;}
	.reply-input input{ height:40px; width:495px;}
	.reply{ margin:20px 0 5px; min-height:40px; width:510px;}
	.reply .add-ans{ float:right; width:78px; height:38px; font-size:14px; color:#fff; border:0; background-color:#f01400; border-color:#f01400; cursor:pointer;}
	.ans-page{ height:20px; margin-left:60px;}
	.ans-page a{ display:inline-block; margin:0 4px; padding:0 4px; min-width:24px; line-height:20px; font-size:12px; color:#4d555d; text-align:center; border-radius:12px; transition:background-color 0.5s;}
	.ans-page .active{ background-color:#4d555d; color:#fff;}
	.ans-page .enabled:hover{ background-color:#14191e; color:#fff; cursor:pointer;}
	.ans-page .disabled{ display:inline-block; margin:0 4px; padding:0 4px; min-width:24px; line-height:20px; font-size:12px; color:#4d555d; text-align:center;}
	
	.page{ overflow:hidden; margin:20px auto;}
	.page a{ display:inline-block; margin:0 8px; padding:0 4px; min-width:24px; line-height:32px; font-size:14px; color:#4d555d; text-align:center; border-radius:16px; transition:background-color 0.5s;}
	.page .active{ background-color:#4d555d; color:#fff;}
	.page .enabled:hover{ background-color:#14191e; color:#fff;}
	.page .disabled{ display:inline-block; margin:0 8px; padding:0 4px; min-width:24px; line-height:32px; font-size:14px; color:#4d555d; text-align:center;}
	
	.rightwraper{ float:left; width:360px; padding-left:20px; margin-left:20px; overflow:hidden;}
	.rightwraper .bang a{ display:block; width:280px; height:60px; line-height:60px; color:#fff; font-size:18px; background-color:#f01400; margin-right:40px; margin-top:20px; text-align:center; cursor:pointer;}
	.rightwraper .hot-head{ background-color:#fff; margin-top:20px; padding-bottom:15px; border-bottom:1px solid #d0d6d9; overflow:hidden;}
	.hot-head .left-head{ float:left; background-color:#fff; height:30px; line-height:30px;}
	.hot-head .left-head span{ color:#07111b; font-size:16px;}
	.hot-head .right-head{ float:right; line-height:30px; margin-right:5px;}
	.hot-head .right-head span:hover{ color:#5e5e5e; cursor:pointer;}
	.quesList{ margin-top:10px;}
	.quesList .problem{ padding:9px 0 10px; line-height:21px;}
	.problem .quesName{ color:#14191e;}
	.problem .quesReply{ color:#b5b9bc; font-size:12px; margin-left:6px; font-style:normal; display:inline-block;}
	
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
		var ansPage = $("#ans-page");
		var ansList = ansPage.children("a");
		aList.each(function(index, element) {
            var aa = $(this);
			$(this).bind("click",function(){
				aList.each(function(index, element) {
                    $(this).removeClass("active");
                });
				aa.addClass("active");
			});
        });
		ansList.each(function(index, element) {
            var aa = $(this);
			$(this).bind("click",function(){
				ansList.each(function(index, element) {
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
            	<h2><s:property value="#request.message.title" escape="false"/></h2>
                <div class="detail-ques">
                	<p><s:property value="#request.message.content" escape="false"/></p>
                </div>
                <div class="user">
                	<span class="ques-provider">提问者</span>
                    <a href="showUserInfo.action?userId=${requestScope.message.userId }" class="author" target="_blank"><s:property value="#request.userList[#request.message.userId]" escape="false"/></a>
                </div>
            </div>
            <div class="add-ques">
            	<h3>添加回答</h3>
		    	<div class="add-input">
		    		<input id="addBang" type="text" name="content" />
		    	</div>
		    	<div id="iframeBox" class="addInputBox">
			    	<div class="orderList">
				    	<div class="order01">
				        	<div id="clickUpload" class="order01-img" title="添加图片"></div>
				        </div>
				    </div>
		    		<iframe id="uploadEditor" style="width:100%; height:100%;" frameborder="0" src="upload_iframe.html">
		        	</iframe>
		        </div>
                <div class="answer">
                	<input type="hidden" id="loginOrNot" name="id" value="${requestScope.message.id }"/>
                	<button id="ques-submit"  class="submit-ques">回答</button>
                </div>
			    <!--  
            	<form action="addCritique.action" method="post">
	                <input type="hidden" name="id" value="${requestScope.message.id }"/>
	                <div class="add-input"><input id="addBang" type="text" name="content" /></div>
	                <div class="answer">
	                	<button id="ques-submit"  class="submit-ques">回答</button>
	                </div>
                </form>
                -->
            </div>
            <div class="mainCon">
            	<div class="ans_num"><s:property value="#request.length" />回答</div>
            </div>
            <s:iterator value="#request.allCri" id="cri">
	            <div class="ques-answer">
	            	<div class="user-mes">
	                    <a href="showUserInfo.action?userId=<s:property value='#cri.userId'/>"><img src="user/<s:property value="#request.userList[#cri.userId]" />/images/cus.jpg" /></a>  
	                    <div class="userInfo">
	                        <a href="showUserInfo.action?userId=<s:property value='#cri.userId'/>" class="user"><s:property value="#request.userList[#cri.userId]" /></a>
	                    </div>
	                    <div class="ans-date">
	                    	<s:property value="#cri.date" /> 
	                    </div>    
	                </div>
	                <div class="helpMes">
	                    <p><s:property value="#cri.content" escape="false"/></p>
	                    <s:if test="#cri.image != ''">
	                    	<ul>
	                    		<s:property value="#cri.image" escape="false"/></p>
	                    	</ul>
	                    </s:if>
	                </div> 
	                <div class="ans-append">
	                	<p class="criId" style="display:none;"><s:property value="#cri.id" /></p>
	                	<p class="loginUser" style="display:none"><s:property value="#session.username" /></p>
	                	<s:if test="#request.zanList.size() !=0">
	                		<s:if test="#request.zanList[#cri.id] != 1">
		                		<span class="agree">雷锋<i><s:property value="#cri.zan" /></i></span>
		                	</s:if>
		                	<s:else>
		                		<span class="agree afterClick">雷锋<i><s:property value="#cri.zan" /></i></span>
		                	</s:else>            
	                	</s:if>
	           			<s:else>
	           				<span class="agree">雷锋<i><s:property value="#cri.zan" /></i></span>
	           			</s:else>
	           			<s:if test="#request.opList.size() !=0">
		                	<s:if test="#request.opList[#cri.id] != 1">
		                		<span class="oppose">小黑屋<i><s:property value="#cri.oppose" /></i></span>
		                	</s:if>
		                	<s:else>
		                		<span class="oppose afterClick">小黑屋<i><s:property value="#cri.oppose" /></i></span>
		                	</s:else>
	                	</s:if>
	           			<s:else>
	           				<span class="oppose">小黑屋<i><s:property value="#cri.oppose" /></i></span>
	           			</s:else>
                    	<span class="addReply"><i class="showReply">回复</i><i class="replyCount"><s:property value="#cri.answer" /></i></span>
	                </div>  
                	<div class="replyArea"></div>
	            </div>
            </s:iterator>
            <div class="page" id="page">
            	<s:if test="#request.page.hasPrePage">
           			<a href="showMessage.action?currentPage=1&id=${message.id}" class="enabled">首页</a>
                	<a href="showMessage.action?currentPage=${page.currentPage - 1 }
                			&id=${message.id}" class="enabled">上一页</a>
                	<s:bean name="org.apache.struts2.util.Counter" id="counter">
           				<s:param name="first" value="1" />
           				<s:param name="last" value="#request.page.currentPage - 1" />
	           			<s:iterator status="count">
	           				
	           				<a href="showMessage.action?currentPage=<s:property value="#count.index  + 1" />
	           						&id=${message.id}" class="enabled"><s:property value="#count.index  + 1" /></a>
	           			</s:iterator>
           			</s:bean>
           		</s:if>
           		<s:else>
           			<span class="disabled">首页</span>
           			<span class="disabled">上一页</span>
           		</s:else>
           		<a href="showMessage.action?currentPage=<s:property value="#request.page.currentPage" />" class="active enabled"><s:property value="#request.page.currentPage" /></a>
           		<s:if test="#request.page.hasNextPage">
           			<s:bean name="org.apache.struts2.util.Counter" id="counter">
           				<s:param name="first" value="#request.page.currentPage + 1" />
           				<s:param name="last" value="#request.page.totalPage" />
	           			<s:iterator status="count">
	           				<a href="showMessage.action?currentPage=<s:property value='#count.index  + #request.page.currentPage + 1'/>
	           						&id=${message.id}" class="enabled"><s:property value="#count.index  + #request.page.currentPage + 1" /></a>
	           			</s:iterator>
           			</s:bean>
           			<a href="showMessage.action?currentPage=${page.currentPage + 1 }
           					&id=${message.id}" class="enabled">下一页</a>
           			<a href="showMessage.action?currentPage=${page.totalPage }
           					&id=${message.id}" class="enabled">尾页</a>
           		</s:if>
           		<s:else>
           			<span class="disabled">下一页</span>
           			<span class="disabled">尾页</span>
           		</s:else>
            </div>
        </div>
        <div class="rightwraper">
        	<div class="bang">
            	<s:if test="!#session.username">
            		<a id="wantHelp" href="#">我要帮帮</a>
            	</s:if>
            	<s:else>
            		<a id="wantHelp" href="wantBang.jsp">我要帮帮</a>
            	</s:else>
            </div>
        	<div class="hot-head">
                <div class="left-head">
                    <span>相关问题</span>
                </div>
            </div>
            <div class="quesList">
	            <s:iterator value="#request.ansTop" id="ans">
	            	<div class="problem">
	                	<a class="quesName" href="showMessage.action?username=<s:property value='#ans.username'/>
	                	& id=<s:property value='#ans.id'/>"><s:property value="#ans.title" /></a>
	                    <span class="quesReply"><s:property value="#ans.answer" />回复</span>
	                </div> 
	            </s:iterator>
            </div> 
        </div>
        
    </div>
         	
</div>
<div id="uploadfixed" class="upload">
	<div class="uploadMainFrame">
    	<div class="frameShadow"></div>
        <div class="up-head">
            <span class="title">多图上传</span><span class="shut" id="shutUpload"><img src="images/close.png" /></span>
        </div>
        <div class="tabhead"><span class="local">本地上传</span></div>
        <div id="up-content" class="up-content">
            <div class="img-area">
                <div id="chooseImg" class="pick-upload">点击选择图片</div>
                <div class="img-upload"><label><input class="uploadImg" type="file" name="file" accept="image/*" multiple="multiple"/></label></div>
            </div>
        </div>
        <div class="up-bottom">
            <div id="confirm" class="confirm">确认</div>
            <div id="clickCancel" class="cancel">取消</div>
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