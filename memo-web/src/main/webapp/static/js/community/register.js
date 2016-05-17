/**
 * register.js
 * Author:Danica
 * Date: 2016.4.25
 */

var lastuserid = '';
var lastemail = '';
var stmp = new Array(); 
var profileTips = '请输入必填项';
var pwdlength = 6;
var ignoreEmail = false;
$(document).ready(function(){
	ignoreEmail = false;// =true : email is not nessasory
	addFormEvent('registerform', 0);
	$('#formsubmit').click(function(){
		checksubmit();
	});
});

function showInputTip(id) {
	var p_tips = $('#registerform').find('i');
	
	for(var i = 0;i < p_tips.length;i++){
		var obj = p_tips[i].id;
		if(p_tips[i].className == 'p_tip'){
			$('#'+obj).attr('display','none');
		}
	}
	if($('#tip_' + id)) {
		$('#tip_' + id).attr('display','block');
	}
}

function errorMessage(id, msg) {
	if($('#'+id)) {
		try {
			showInputTip();
		} catch (e) {}
		
		msg = !msg ? '' : msg;
		if($('#tip_' + id)) {
			if(msg == 'succeed') {
				msg = '';
				changeParentClass('tip_'+id, 'p_right');
			} else if(msg !== '') {
				var tipclass = $('#tip_' + id).parent().attr("class");
				$('#tip_' + id).parent().attr('class', tipclass.replace(' p_right', ''));
			}
		}
		if ($('#chk_' + id)) {
			$('#chk_' + id).html(msg);
		}
		
		var idclass = $('#'+id).attr('class');
		$('#'+id).attr('class', idclass.replace(/ er/, ''));
		idclass = $('#'+id).attr('class');
		idclass += !msg ? '' : ' er';
		$('#'+id).attr('class', idclass);
	}
}

function changeParentClass(id, replaceclass){
	var oldclass = $('#' + id).parent().attr("class");
	$('#' + id).parent().attr('class', oldclass.replace(' '+replaceclass, ''));
	oldclass = $('#' + id).parent().attr("class");
	$('#' + id).parent().attr('class', oldclass+' '+replaceclass);
}

function addFormEvent(formid, focus){
	var si = 0;
	var formNode = $('#'+formid).find("input[type!='hidden']");
	
	for(var i = 0;i < formNode.length;i++) {
		var id = formNode[i].id;
		if(formNode[i].name == '') {
			$('#'+id).attr('name', id);
			stmp[si] = i;
			si++;
		}
		if(formNode[i].type == 'text' || formNode[i].type == 'password'){
			$('#'+id).focus( function(){
				showInputTip(id);
			});
		}
	}
	if(!si) {
		return;
	}
	
	var objId = formNode[stmp[0]].id;
	
	$('#'+objId).blur(function(){
		checkuserid(objId);
	});
	checkPwdComplexity(formNode[stmp[1]].id, formNode[stmp[2]].id);
	try {
		if(!ignoreEmail) {
			addMailEvent();
		}
	} catch(e) {}

	try {
		$('#'+objId).focus();
	} catch(e) {}
}

function checkuserid(id) {
	errorMessage(id);
	var userid = trim($('#'+id).val());
	var parentTarget = $('#tip_' + id).parent();
	if (parentTarget.attr('class').match(/ p_right/) && (userid == '' || userid == lastuserid)) {
		return;
	} else {
		lastuserid = userid;
	}
	if(userid.match(/<|"/ig)) {
		errorMessage(id, '用户名包含敏感字符');
		return;
	}
	
	if(/^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(userid)){
		var unlen = userid.replace(/[^\x00-\xff]/g, "**").length;

		if(unlen < 6 || unlen > 16) {
			errorMessage(id, unlen < 3 ? '用户名不得小于 6 个字符' : '用户名不得大于 16 个字符');
			return;
		}
		
		//检查用户名重复与否
		var parentclass = parentTarget.attr('class');
		parentTarget.attr('class', parentclass.replace(/ p_right/, ''));
		
		var geturl = BASEPATH + "/community/get_count.json"; 
		var paramjson = {"memberId" : $('#userid').val()}; 
		
		if(checkeduniqueid(geturl, paramjson)){
			errorMessage(id, '用户名已存在');
		} else{
			errorMessage(id, 'succeed');
		}
	} else{
		errorMessage(id, '字母开头，允许6-16字节，允许字母数字下划线');
		return;
	}
	
}

function checkPwdComplexity(firstId, secondId) {
	var firstObj = $('#'+firstId);
	var secondObj = $('#'+secondId);
	firstObj.blur(function () {
		if (firstObj.val() == '') {
			var pwmsg = '请填写密码';
			if(pwdlength > 0) {
				pwmsg += ', 最小长度为 '+pwdlength+' 个字符';
			}
			errorMessage(firstId, pwmsg);
		} else{
			errorMessage(firstId, 'succeed');
		}
		checkpassword(firstId, secondId);
	});
	firstObj.keyup(function () {
		if(pwdlength == 0 || firstObj.val().length >= pwdlength) {
			var passlevels = new Array('','弱','中','强');
			var passlevel = checkstrongpwd(firstId);
			errorMessage(firstId, '<span class="passlevel passlevel'+passlevel+'">密码强度:'+passlevels[passlevel]+'</span>');
		}
	});
	secondObj.blur(function () {
		if(secondObj.val() == '') {
			errorMessage(secondId, '请再次输入密码');
		}
		checkpassword(firstId, secondId);
	});
}

function checkpassword(id1, id2) {
	if(!$('#'+id1).val() && !$('#'+id2).val()) {
		return;
	}
	if(pwdlength > 0) {
		if($('#'+id1).val().length < pwdlength) {
			errorMessage(id1, '密码太短，不得少于 '+pwdlength+' 个字符');
			return;
		}
	}
	
	errorMessage(id2);
	if($('#'+id1).val() != $('#'+id2).val()) {
		errorMessage(id2, '两次输入的密码不一致');
	} else {
		errorMessage(id2, 'succeed');
	}
}

function checkstrongpwd(id) {
	var passlevel = 0;
	if($('#'+id).val().match(/\d+/g)) {
		passlevel ++;
	}
	if($('#'+id).val().match(/[a-z]+/ig)) {
		passlevel ++;
	}
	if($('#'+id).val().match(/[^a-z0-9]+/ig)) {
		passlevel ++;
	}
	return passlevel;
}

function addMailEvent() {
    var mailObj = $('#email');
//	mailObj.click(function (event) {
//		emailMenu(event, mailObj.attr('id'));
//	});
//	mailObj.keyup(function (event) {
//		emailMenu(event, mailObj.attr('id'));
//	});
//	mailObj.keydown(function (event) {
//		emailMenuOp(4, event, mailObj.attr('id'));
//	});
	mailObj.blur(function () {
		if(mailObj.val() == '') {
			errorMessage('email', '请输入正确的邮箱地址');
		}
		emailMenuOp(3, null, 'email');
	});
}
var emailMenuST = null, emailMenui = 0, emaildomains = ['qq.com', '163.com', 'sina.com', 'sohu.com', 'aliyun.com', 'gmail.com'];

function emailMenuOp(op, e, id) {
	checkemail(id);
//	if(op == 3 && BROWSER.ie && BROWSER.ie < 7) {
//		checkemail(id);
//	}
//	if(!$('#emailmore_menu')) {
//		return;
//	}
//	if(op == 1) {
//		$('#emailmore_menu').style.display = 'none';
//	} else if(op == 2) {
//		showMenu({'ctrlid':'emailmore','pos': '13!'});
//	} else if(op == 3) {
//		emailMenuST = setTimeout(function () {
//			emailMenuOp(1, id);
//			checkemail(id);
//		}, 500);
//	} else if(op == 4) {
//       	e = e ? e : window.event;
//        var obj = $('#'+id);
//    	if(e.keyCode == 13) {
//            var v = obj.val().indexOf('@') != -1 ? obj.val().substring(0, obj.val().indexOf('@')) : obj.val();
//            obj.val(v + '@' + emaildomains[emailMenui]);
//            doane(e);
//    	}
//	} else if(op == 5) {
//        var as = $('emailmore_menu').find('a');
//        for(var i = 0 ; i < as.length ; i++){
//            as[i].className = '';
//        }
//	}
}

function emailMenu(e, id) {
	if(BROWSER.ie && BROWSER.ie < 7) {
		return;
	}
	e = e ? e : window.event;
    var obj = $('#'+id);
	if(obj.val().indexOf('@') != -1) {
		$('#emailmore_menu').attr('style','display:none');
		return;
	}
	var value = e.keyCode;
	var v = obj.val();
	if(!obj.val().length) {
		emailMenuOp(1);
		return;
	}

        if(value == 40) {
		emailMenui++;
		if(emailMenui >= emaildomains.length) {
			emailMenui = 0;
		}
	} else if(value == 38) {
		emailMenui--;
		if(emailMenui < 0) {
			emailMenui = emaildomains.length - 1;
		}
	} else if(value == 13) {
  		$('#emailmore_menu').attr('style','display:none');
  		return;
 	}
        if(!$('#emailmore_menu')) {
		menu = document.createElement('div');
		menu.id = 'emailmore_menu';
		menu.style.display = 'none';
		menu.className = 'p_pop';
		menu.setAttribute('disautofocus', true);
		$('#append_parent').appendChild(menu);
	}
	var s = '<ul>';
	for(var i = 0; i < emaildomains.length; i++) {
		s += '<li><a href="javascript:;" onmouseover="emailMenuOp(5)" ' + (emailMenui == i ? 'class="a" ' : '') + 'onclick="$(stmp[\'email\']).value=this.innerHTML;display(\'emailmore_menu\');checkemail(stmp[\'email\']);">' + v + '@' + emaildomains[i] + '</a></li>';
	}
	s += '</ul>';
	$('#emailmore_menu').innerHTML = s;
	emailMenuOp(2);
}

function checkemail(id) {
	errorMessage(id);
	var emailval = trim($('#'+id).val());

	if(emailval == ''){
		errorMessage(id, '请输入邮箱');
		return;
	}
//	if($('#'+id).parent().attr('class').match(/ p_right/) && (email == '' || email == lastemail)) {
//		return;
//	} else {
//		lastemail = email;
//	}
	if(emailval.match(/<|"/ig)) {
		errorMessage(id, 'Email 包含敏感字符');
		return;
	}

	var cls = $('#tip_' + id).parent().attr('class');
	$('#tip_' + id).parent().attr('class', cls.replace(/ p_right/, ''));
	
	var geturl = BASEPATH + "/community/get_count.json"; 
	var paramjson = {"email" : $('#email').val()}; 
	
	if(checkeduniqueid(geturl, paramjson)){
		errorMessage(id, '邮箱已注册');
	} else{
		errorMessage(id, 'succeed');
	}
}

function checksubmit() {
	var p_chks = $('#registerform').find('kbd');

	var flag = true;
	for(var i = 0 ; i < p_chks.length ; i++){
		
		if(p_chks[i].className == 'p_chk'){
			var chkId = p_chks[i].id.replace('chk_', '');
			if($('#'+chkId).val() == '' || p_chks[i].innerHTML != ''){
				$('#'+chkId).focus();
				flag = false;
				return false;
			}
			p_chks[i].innerHTML = '';
		}
	}
	if (flag) {
		var postUrl = BASEPATH + "/community/member_reg"; 
		var paramJson = {
				"memberId" : $('#userid').val(),
				"memberPwd": $('#pwd').val(),
				"email":$('#email').val()
				}; 
		ajaxpost(postUrl, paramJson, function(data) {
        	if(data.flag == "success"){
        		//跳转用户个人主页
        		window.open (BASEPATH + "/community", '_top');
        		$('#main_message').attr('style','display:none');
        		$('#main_succeed').removeAttr('style');
        		$('#succeedmessage_href').attr('href',"");
        	} else{
        		alert("注册失败");
        	}
        });
	}
}