// JavaScript Document	
$(document).ready(function() {
	var signIn = $("#signIn");
	var login = $('#login');
	var register = $('#register');
	var loginCon = $('#logCon');
	var registerCon = $("#regCon");
	var wantSign = $('#wantSign');
	var wantRegis = $('#wantRegis');
	//��¼ע������
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
		console.log("�ر�֮ǰ��"+$(this).css("display")+" "+
		$('#login').attr("class")+" "+
		$('#register').attr("class")+" "+
		$('#login').css("display")+" "+
		$('#register').css("display")+" "+
		$('#login').css("display")+" "+
		$('#logCon').css("display")+" "+
		$("#regCon").css("display"));
		
		signIn.css("display","none");
		login.removeClass("active");
		register.removeClass("active");
		loginCon.css("display","none");
		registerCon.css("display","none");
		
		console.log("�ر�֮��"+$(this).css("display")+" "+
		$('#login').attr("class")+" "+
		$('#register').attr("class")+" "+
		$('#login').css("display")+" "+
		$('#register').css("display")+" "+
		$('#login').css("display")+" "+
		$('#logCon').css("display")+" "+
		$("#regCon").css("display"));
	});
		//ע����֤
		var hints = $('#hints');
		var validateMes;
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
		//��ȡ����
        if($.cookie("auto") == "true"){
			$('#autoLogin').attr("checked",true);
			$('#username').val($.cookie("username"));
			$('#password').val($.cookie("password"));
		}
		//ע����֤
		
		$('#username').bind("click",function(){
			if($(this).val() == "") {
				hints.html("�û�������Ϊ��");
				validateMes = false;
			}else{
				hints.html("");
				validateMes = true;
			}	
		});
		$("#password").bind("focusin focusout",function(){
			if($(this).val() == "") {
				hints.html("���벻��Ϊ��");
				validateMes = false;
			}else if($(this).val() != $('#repassword').val()){
				hints.html("�������벻һ��");
				validateMes = false;
			}else{
				hints.html("");
				validateMes = true;
			}
		});
		$("#repassword").bind("focusin focusout",function(){
			if($(this).val() == "") {
				hints.html("���벻��Ϊ��");
				validateMes = false;
			}else if($(this).val() != $('#password').val()){
				hints.html("�������벻һ��");
				validateMes = false;
			}else{
				hints.html("");
				validateMes = true;
			}
		});
		$("#email").bind("focusin focusout",function(){
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
			if(!$(this).prop("checked")){
				$("#beginReg").css("background-color","#787d82");
			}
			if($(this).val() == "") {
				hints.html("����д�����ַ");
				validateMes = false;
			}else if(!$(this).val().match(reg)){
				hints.html("�����ʽ����ȷ");
				validateMes = false;
			}
			else{
				hints.html("");
				validateMes = true;
			}
		});
		$("#agreeBook").bind("click",function(){
			if($(this).prop("checked") && validateMes){
				$("#beginReg").prop("disabled","false");
				$("#beginReg").css("background-color","#f01400");
			}else{
				$("#beginReg").css("background-color","#787d82");
			}
		});
	
	//��ȡ����
	if($.cookie("auto") == "true"){
		$('#autoLogin').attr("checked",true);
		$('#username').val($.cookie("username"));
		$('#password').val($.cookie("password"));
	}
});
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
