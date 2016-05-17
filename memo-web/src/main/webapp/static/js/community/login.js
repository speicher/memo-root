/**
 * register.js
 * Author:Danica
 * Date: 2016.4.30
 */

$(document).ready(function(){
	$('#username').focus();
	$('#formsubmit').click(function(){
		checksubmit();
	});
	
});

function clearpwd() {
	$('#password').val('');
}

function checkusername() {
	if($('#username').val() == '') {
		alert('请输入注册邮箱或用户名');
		$('#username').focus();
		return false;
	}
	return true;
}

function checkpassword() {
	var pwdTarget = $('#password');
	if(pwdTarget.val() == '') {
		alert('请输入密码');
		pwdTarget.focus();
		return false;
	} 
	return true;
}

function checksubmit() {
	if(!checkusername()||!checkpassword()){
		return;
	}
	var postUrl = BASEPATH + "/community/member_login";
	
	var paramJson = {
			"email": $('#username').val(),
			"memberPwd": $('#password').val(),
			};
	ajaxpost(postUrl, paramJson, function(data) {
    	if(data == "success"){
    		//跳转用户个人主页
    		window.open (BASEPATH + "/community", '_top');
    		$('#main_message').attr('style','display:none');
    		$('#main_succeed').removeAttr('style');
    		$('#succeedmessage_href').attr('href',"");
    		
    	} else{
    		//登录失败
    		alert('用户名或密码错误');
    	}
    });
}