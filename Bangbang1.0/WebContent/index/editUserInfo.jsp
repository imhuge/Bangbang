<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮帮网</title>
<link type="text/css" rel="stylesheet" href="css/logReg.css"/>
<link type="text/css" rel="stylesheet" href="css/updateHeader.css"/>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/logReg.js" type="text/javascript"></script>
<script src="js/updateHeader.js" type="text/javascript"></script>
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
            	<a id="personal" href="showUserInfo.action?userId=${requestScope.userId }"><img src="user/<s:property value='#session.username' />/images/cus.jpg" class="cusImg" /></a>
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
                    	<a href="#" class="setinfo">个人设置</a><a href="exit.action" class="exit">退出</a>
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
<div class="wrapper">
	<div class="head-wrap">
        <div class="head-con">
            <h1>个人设置</h1>
        </div>
    </div>
	<div class="wrap-con"> 
        <div class="edit-con">
        	<div class="edit-nav">
                <span>基本信息</span>
            </div>
            <div class="input-userinfo">
            	<form action="editUserInfo.action" enctype="multipart/form-data" method="post">
                    <div class="need-input">
                        <label class="label-name">更换头像:</label>
                        <div class="main-group">
			            	<div class="main-Img">
			            		<label class="uploadButton">
			            			<img id="userHeadImg" class="true-img" src="user/<s:property value='#session.username' />/images/cus.jpg" title="上传头像" />
			                		<input id="updateHeadImg" type="file" name="headImg" accept="image/*" style="display:none;"/>
			                	</label>
			                </div>
			            </div>
                    </div>
                    <div class="need-input">
                        <label class="label-name">昵称:</label>
                        <input type="text" name="username" class="inputCon" />
                    </div>
                    <div class="need-input">
                    	<label class="label-name">性别:</label>
                        <div class="chooseSex">
                        	<s:if test ="#request.userSex">
                        		<s:if test="#request.isMale">
                            		<label class="sex"><input id="male" name="sex" type="radio" value="男" checked="checked" />男</label>
                            		<label class="sex"><input id="female" name="sex" type="radio" value="女" />女</label>
                            	</s:if>
                            	<s:else>
                            		<label class="sex"><input id="male" name="sex" type="radio" value="男" />男</label>
                            		<label class="sex"><input id="female" name="sex" type="radio" value="女" checked="checked" />女</label>
                            	</s:else>
                            </s:if>
                            <s:else>
                            	<label class="sex"><input id="male" name="sex" type="radio" value="男" />男</label>
                            	<label class="sex"><input id="female" name="sex" type="radio" value="女" />女</label>
                            </s:else>
                        </div>
                    </div>
                    <div class="need-input">
                        <label class="label-name">个性签名:</label>
                        <textarea name="signature" class="inputArea"></textarea>
                    </div>
                    <div class="save">
                        <input type="submit" value="保存" />
                    </div>
                </form>
            </div>
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