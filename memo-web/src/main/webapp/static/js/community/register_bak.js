/**
 * register.js
 * Author:Danica
 * Date: 2016.4.25
 */

var lastuserid = '';
var lastpassword = ''; 
var lastemail = '';
var stmp = new Array(); 
var profileTips = '请输入必填项';
var strongpwd = new Array();
strongpwd[0] = 1;
var pwdlength = 6;

function errorMessage(id, msg) {
	if($(id)) {
		try {
			showInputTip();
		} catch (e) {}
		msg = !msg ? '' : msg;
		if($('tip_' + id)) {
			if(msg == 'succeed') {
				msg = '';
				$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
				$('tip_' + id).parentNode.className += ' p_right';
			} else if(msg !== '') {
				$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
			}
		}
		if($('chk_' + id)) {
			$('chk_' + id).innerHTML = msg;
		}
		$(id).className = $(id).className.replace(/ er/, '');
		$(id).className += !msg ? '' : ' er';
	}
}

function addFormEvent(formid, focus){
	var si = 0;
	var formNode = $(formid).getElementsByTagName('input');
	for(var i = 0;i < formNode.length;i++) {
		if(formNode[i].name == '') {
			formNode[i].name = formNode[i].id;
			stmp[si] = i;
			si++;
		}
		if(formNode[i].type == 'text' || formNode[i].type == 'password'){
			formNode[i].onfocus = function(){
				showInputTip(!this.id ? this.name : this.id);
			};
		}
	}
	if(!si) {
		return;
	}
	formNode[stmp[0]].onblur = function () {
		checkuserid(formNode[stmp[0]].id);
	};
	checkPwdComplexity(formNode[stmp[1]], formNode[stmp[2]]);
	try {
		if(!ignoreEmail) {
			addMailEvent(formNode[stmp[3]]);
		}
	} catch(e) {}

	try {
		if(focus) {
//			$('invitecode').focus();
		} else {
			formNode[stmp[0]].focus();
		}
	} catch(e) {}
}

function checkPwdComplexity(firstObj, secondObj, modify) {
	firstObj.onblur = function () {
		if (firstObj.value == '') {
			var pwmsg = '请填写密码';
			if(pwdlength > 0) {
				pwmsg += ', 最小长度为 '+pwdlength+' 个字符';
			}
			errorMessage(firstObj.id, pwmsg);
		} else{
			errorMessage(firstObj.id, 'succeed');
		}
		checkpassword(firstObj.id, secondObj.id);
	};
	firstObj.onkeyup = function () {
		if(pwdlength == 0 || $(firstObj.id).value.length >= pwdlength) {
			var passlevels = new Array('','弱','中','强');
			var passlevel = checkstrongpwd(firstObj.id);
			errorMessage(firstObj.id, '<span class="passlevel passlevel'+passlevel+'">密码强度:'+passlevels[passlevel]+'</span>');
		}
	};
	secondObj.onblur = function () {
		if(secondObj.value == '') {
			errorMessage(secondObj.id, '请再次输入密码');
		}
		checkpassword(firstObj.id, secondObj.id);
	};
}

function addMailEvent(mailObj) {

	mailObj.onclick = function (event) {
		emailMenu(event, mailObj.id);
	};
	mailObj.onkeyup = function (event) {
		emailMenu(event, mailObj.id);
	};
	mailObj.onkeydown = function (event) {
		emailMenuOp(4, event, mailObj.id);
	};
	mailObj.onblur = function () {
		if(mailObj.value == '') {
			errorMessage(mailObj.id, '请输入正确的邮箱地址');
		}
		emailMenuOp(3, null, mailObj.id);
	};
	stmp['email'] = mailObj.id;
}

function checkstrongpwd(id) {
	var passlevel = 0;
	if($(id).value.match(/\d+/g)) {
		passlevel ++;
	}
	if($(id).value.match(/[a-z]+/ig)) {
		passlevel ++;
	}
	if($(id).value.match(/[^a-z0-9]+/ig)) {
		passlevel ++;
	}
	return passlevel;
}

function showInputTip(id) {
	var p_tips = $('registerform').getElementsByTagName('i');
	for(var i = 0;i < p_tips.length;i++){
		if(p_tips[i].className == 'p_tip'){
			p_tips[i].style.display = 'none';
		}
	}
	if($('tip_' + id)) {
		$('tip_' + id).style.display = 'block';
	}
}

//function showbirthday(){
//	var el = $('birthday');
//	var birthday = el.value;
//	el.length=0;
//	el.options.add(new Option('鏃�', ''));
//	for(var i=0;i<28;i++){
//		el.options.add(new Option(i+1, i+1));
//	}
//	if($('birthmonth').value!="2"){
//		el.options.add(new Option(29, 29));
//		el.options.add(new Option(30, 30));
//		switch($('birthmonth').value){
//			case "1":
//			case "3":
//			case "5":
//			case "7":
//			case "8":
//			case "10":
//			case "12":{
//				el.options.add(new Option(31, 31));
//			}
//		}
//	} else if($('birthyear').value!="") {
//		var nbirthyear=$('birthyear').value;
//		if(nbirthyear%400==0 || (nbirthyear%4==0 && nbirthyear%100!=0)) el.options.add(new Option(29, 29));
//	}
//	el.value = birthday;
//}

function trim(str) {
	return str.replace(/^\s*(.*?)[\s\n]*$/g, '$1');
}

var emailMenuST = null, emailMenui = 0, emaildomains = ['qq.com', '163.com', 'sina.com', 'sohu.com', 'aliyun.com', 'gmail.com'];
function emailMenuOp(op, e, id) {
	if(op == 3 && BROWSER.ie && BROWSER.ie < 7) {
		checkemail(id);
	}
	if(!$('emailmore_menu')) {
		return;
	}
	if(op == 1) {
		$('emailmore_menu').style.display = 'none';
	} else if(op == 2) {
		showMenu({'ctrlid':'emailmore','pos': '13!'});
	} else if(op == 3) {
		emailMenuST = setTimeout(function () {
			emailMenuOp(1, id);
			checkemail(id);
		}, 500);
	} else if(op == 4) {
	       	e = e ? e : window.event;
                var obj = $(id);
        	if(e.keyCode == 13) {
                        var v = obj.value.indexOf('@') != -1 ? obj.value.substring(0, obj.value.indexOf('@')) : obj.value;
                        obj.value = v + '@' + emaildomains[emailMenui];
                        doane(e);
        	}
	} else if(op == 5) {
                var as = $('emailmore_menu').getElementsByTagName('a');
                for(var i = 0;i < as.length;i++){
                        as[i].className = '';
                }
	}
}

function emailMenu(e, id) {
	if(BROWSER.ie && BROWSER.ie < 7) {
		return;
	}
	e = e ? e : window.event;
        var obj = $(id);
	if(obj.value.indexOf('@') != -1) {
		$('emailmore_menu').style.display = 'none';
		return;
	}
	var value = e.keyCode;
	var v = obj.value;
	if(!obj.value.length) {
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
  		$('emailmore_menu').style.display = 'none';
  		return;
 	}
        if(!$('emailmore_menu')) {
		menu = document.createElement('div');
		menu.id = 'emailmore_menu';
		menu.style.display = 'none';
		menu.className = 'p_pop';
		menu.setAttribute('disautofocus', true);
		$('append_parent').appendChild(menu);
	}
	var s = '<ul>';
	for(var i = 0; i < emaildomains.length; i++) {
		s += '<li><a href="javascript:;" onmouseover="emailMenuOp(5)" ' + (emailMenui == i ? 'class="a" ' : '') + 'onclick="$(stmp[\'email\']).value=this.innerHTML;display(\'emailmore_menu\');checkemail(stmp[\'email\']);">' + v + '@' + emaildomains[i] + '</a></li>';
	}
	s += '</ul>';
	$('emailmore_menu').innerHTML = s;
	emailMenuOp(2);
}

function checksubmit() {
	var p_chks = $('registerform').getElementsByTagName('kbd');
	for(var i = 0;i < p_chks.length;i++){
		if(p_chks[i].className == 'p_chk'){
			p_chks[i].innerHTML = '';
		}
	}
//	ajaxpost('registerform', 'returnmessage4', 'returnmessage4', 'onerror');
	var usrId = $('#userid').val();
	var pwd = $('#pwd').val();
	var email = $('#email').val();
	var postUrl = path + "/community/member_reg"; 
	console.log(postUrl);
	var paramJson = {
			"memberId" : usrId,
			"memberPwd": pwd,
			"email":email
			}; 
	$.ajax({  
        type : 'POST', 
//        contentType : 'application/json',
        url : postUrl,  
        data: paramJson,  
//        dataType : 'text',
//        async : false,  //同步
        success : function(data) {
        	if(data.flag == "success"){
        		alert("注册成功");
        		console.log(data.model);
        	} else{
        		alert("注册失败");
        	}
        },  
        error : function() {  
            alert("系统错误"); 
        }  
    });
	return;
}

function checkuserid(id) {
	errorMessage(id);
	var userid = trim($(id).value);
	if ($('tip_' + id).parentNode.className.match(/ p_right/) && (userid == '' || userid == lastuserid)) {
		return;
	} else {
		lastuserid = userid;
	}
	if(userid.match(/<|"/ig)) {
		errorMessage(id, '用户名包含敏感字符');
		return;
	}
	var unlen = userid.replace(/[^\x00-\xff]/g, "**").length;

	if(unlen < 3 || unlen > 40) {
		errorMessage(id, unlen < 3 ? '用户名不得小于 3 个字符' : '用户名不得大于 40 个字符');
		return;
	}
//	var x = new Ajax();
	$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
//	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkuserid&userid=' + (BROWSER.ie && document.charset == 'utf-8' ? encodeURIComponent(userid) : userid.replace(/%/g, '%25').replace(/#/g, '%23')), function(s) {
//		errorMessage(id, s);
//	});
}

function checkpassword(id1, id2) {
	if(!$(id1).value && !$(id2).value) {
		return;
	}
	if(pwdlength > 0) {
		if($(id1).value.length < pwdlength) {
			errorMessage(id1, '密码太短，不得少于 '+pwdlength+' 个字符');
			return;
		}
	}
	if(strongpwd) {
		var strongpwd_error = false, j = 0;
		var strongpwd_str = new Array();
		for(var i in strongpwd) {
			if(strongpwd[i] === 1 && !$(id1).value.match(/\d+/g)) {
				strongpwd_error = true;
				strongpwd_str[j] = '鏁板瓧';
				j++;
			}
			if(strongpwd[i] === 2 && !$(id1).value.match(/[a-z]+/g)) {
				strongpwd_error = true;
				strongpwd_str[j] = '灏忓啓瀛楁瘝';
				j++;
			}
			if(strongpwd[i] === 3 && !$(id1).value.match(/[A-Z]+/g)) {
				strongpwd_error = true;
				strongpwd_str[j] = '澶у啓瀛楁瘝';
				j++;
			}
			if(strongpwd[i] === 4 && !$(id1).value.match(/[^A-Za-z0-9]+/g)) {
				strongpwd_error = true;
				strongpwd_str[j] = '鐗规畩绗﹀彿';
				j++;
			}
		}
		if(strongpwd_error) {
			errorMessage(id1, '瀵嗙爜澶急锛屽瘑鐮佷腑蹇呴』鍖呭惈 '+strongpwd_str.join('锛�'));
			return;
		}
	}
	errorMessage(id2);
	if($(id1).value != $(id2).value) {
		errorMessage(id2, '两次输入的密码不一致');
	} else {
		errorMessage(id2, 'succeed');
	}
}

function checkemail(id) {
	errorMessage(id);
	var email = trim($(id).value);
	if($(id).parentNode.className.match(/ p_right/) && (email == '' || email == lastemail)) {
		return;
	} else {
		lastemail = email;
	}
	if(email.match(/<|"/ig)) {
		errorMessage(id, 'Email 包含敏感字符');
		return;
	}
//	var x = new Ajax();
	$('tip_' + id).parentNode.className = $('tip_' + id).parentNode.className.replace(/ p_right/, '');
//	x.get('forum.php?mod=ajax&inajax=yes&infloat=register&handlekey=register&ajaxmenu=1&action=checkemail&email=' + email, function(s) {
//		errorMessage(id, s);
//	});
}
