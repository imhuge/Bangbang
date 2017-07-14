// JavaScript Document	
$(document).ready(function() {
	var signIn = $("#signIn");
	var login = $('#login');
	var register = $('#register');
	var loginCon = $('#logCon');
	var registerCon = $("#regCon");
	var wantSign = $('#wantSign');
	var wantRegis = $('#wantRegis');
	$("#beginReg").css("background-color","#787d82");
	$("#beginReg").bind("click",function(){
		if(this.attr("disabled") == false){
			hints.html("请检查信息是否有误，如用户名重复、邮箱格式！");
		}
	});
	//登录注册设置
	wantSign.bind("click",function(){
		login.addClass("active");
		signIn.css("display","block");
		loginCon.css("display","block");
	});
	wantRegis.bind("click",function(){
		register.addClass("active");
		signIn.css("display","block");
		registerCon.css("display","block");
	});
	login.bind("click",function(){
		register.removeClass("active");
		login.addClass("active");
		registerCon.css("display","none");
		loginCon.css("display","block");
		
	});
	register.bind("click",function(){
		login.removeClass("active");
		register.addClass("active");
		loginCon.css("display","none");
		registerCon.css("display","block");
		
	});
	$("#close").bind("click",function(){	
		signIn.css("display","none");
		login.removeClass("active");
		register.removeClass("active");
		loginCon.css("display","none");
		registerCon.css("display","none");
	});
	//读取缓存
	if($.cookie("auto") == "true"){
		$('#autoLogin').attr("checked",true);
		$('#username').val($.cookie("username"));
		$('#password').val($.cookie("password"));
	}
	//注册验证
	var hints = $('#hints');
	var userMes = false;
	var pwdMes = false;
	var emailMes = false;
	login.bind("click",function(){
		register.removeClass("active");
		login.addClass("active");
		loginCon.css("display","block");
		registerCon.css("display","none");
	});
	register.bind("click",function(){
		login.removeClass("active");
		register.addClass("active");
		loginCon.css("display","none");
		registerCon.css("display","block");
	});
	//注册验证
	
	$('#inusername').bind("input",function(){
		if($(this).val() == "") {
			hints.html("用户名不能为空");
			userMes = false;
		}else{
			hints.html("");
			userMes = true;
		}
		readySubmit(userMes,pwdMes,emailMes);
	});
	$('#inusername').bind("focusout",function(){
		var username = $(this).val();
		$.ajax({
            type: "POST",
            url: "check.action",
            data: "username="+ username,
            success: function(data) {
            	console.log(data);
                if (data == "success") {
                	hints.html("");
                	userMes = true;
                }
                else {
                	hints.html("用户名重复");
                	userMes = false;
                }
            }
        });
		readySubmit(userMes,pwdMes,emailMes);
	});
	$("#inpassword").bind("input",function(){
		if($(this).val() == "") {
			hints.html("密码不能为空");
			pwdMes = false;
		}else if(($(this).val() != $('#repassword').val()) && ($('#repassword').val() != "")){
			hints.html("两次密码不一致");
			pwdMes = false;
		}else{
			hints.html("");
			pwdMes = true;
		}
		readySubmit(userMes,pwdMes,emailMes);
	});
	$("#repassword").bind("input",function(){
		if($(this).val() == "") {
			hints.html("密码不能为空");
			pwdMes = false;
		}else if($(this).val() != $('#inpassword').val() && ($('#inpassword').val() != "")){
			hints.html("两次密码不一致");
			pwdMes = false;
		}else{
			hints.html("");
			pwdMes = true;
		}
		readySubmit(userMes,pwdMes,emailMes);
	});
	$("#email").bind("input",function(){
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if(!$(this).prop("checked")){
			$("#beginReg").css("background-color","#787d82");
		}
		if($(this).val() == "") {
			hints.html("请填写邮箱地址");
			emailMes = false;
		}else if(!$(this).val().match(reg)){
			hints.html("邮箱格式不正确");
			emailMes = false;
		}
		else{
			hints.html("");
			emailMes = true;
		}
		readySubmit(userMes,pwdMes,emailMes);
	});
	$("#agreeBook").bind("click",function(){
		if($(this).prop("checked") && userMes && pwdMes&& emailMes){
			$("#beginReg").attr("disabled",false);
			$("#beginReg").css("background-color","#f01400");
		}else{
			$("#beginReg").css("background-color","#787d82");
		}
	});
	//先登录后发帮帮
	
	$("#addBang").bind("click",function(){
		var loginId = $("#loginOrNot").val();
		console.log(loginId);
		if(loginId == ""){
			login.addClass("active");
			signIn.css("display","block");
			loginCon.css("display","block");
		}else{
			$(this).hide();
			$("#iframeBox").show();
		}
	});
	
	$("#ques-submit").bind("click",function(){
		var id = $(this).siblings("input").val();
		console.log("id:"+id);
		var imgW = "";
		var content="";
		if($("#uploadEditor").contents().find("ul").length > 0){
			imgW = $("#uploadEditor").contents().find("ul").html();
		}
		if($("#uploadEditor").contents().find("p").length > 0){
			content = $("#uploadEditor").contents().find("p").html();
		}
		console.log("评论内容是："+content);
		console.log("上传图片是："+imgW);
		$.ajax({
            type: "POST",
            url: "addCritique.action",
            data: "id="+ id+"&content="+content+"&image="+imgW,
            success: function(data) {
                console.log("评论成功！");
                $("#uploadEditor").contents().find("body").empty();
                $("#uploadEditor").contents().find("body").html("<p><br /></p>");
                window.location.reload();
            },
			error: function(data) {
	            alert("评论失败！");
	        }
        });
		
	});
	$("#wantHelp").bind("click",function(){
		if($(this).attr("href") == "#"){
			//$(this).attr("href","javascript:;");
			login.addClass("active");
			signIn.css("display","block");
			loginCon.css("display","block");
		}
		
	});
	//弹出个人信息弹窗
	$("#personal").bind("mouseover",function(){
		$("#personalInfo").css("display","block");
		
	});
	$("#personal").bind("mouseout",function(){
		$("#personalInfo").css("display","none");
	});
	$("#personalInfo").bind("mouseover",function(){
		$(this).css("display","block");
		//$("#personal").unbind("mouseout");
	});
	$("#personalInfo").bind("mouseout",function(){
		$(this).css("display","none");
		//$("#personal").bind("mouseout");
	});
	
});
function readySubmit(userMes,pwdMes,emailMes){
	if($("#agreeBook").prop("checked") && userMes && pwdMes&& emailMes){
		$("#beginReg").attr("disabled",false);
		$("#beginReg").css("background-color","#f01400");
	}else{
		$("#beginReg").css("background-color","#787d82");
	}
}
function save(){
	if($('#autoLogin').prop("checked")){
		console.log($('#autoLogin').prop("checked"));
		var username = $('#username').val();
		var pwd = $('#password').val();
		$.cookie("auto","true",{expires:7});
		$.cookie("username",username,{expires:7});
		$.cookie("password",pwd,{expires:7});
	}
	else{
		$.cookie("auto","false",{expires:-1});
		$.cookie("username","",{expires:-1});
		$.cookie("password","",{expires:-1});
	}
}
