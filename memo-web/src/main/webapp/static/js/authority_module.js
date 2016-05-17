var authority_module = {};

$(document).ready(function(){
	
//	$('.jsChk').click(function(){
//		var _this = $('.lgn-rmb-chk');
//		if (_this.hasClass('chked')){
//		    $('#cookieFlag').attr('value','0');
//			_this.removeClass('chked');
//		} else{
//		    $('#cookieFlag').attr('value','1');
//			_this.addClass('chked');
//		}
//	});
});

authority_module.checkForm = function(){
	var usrId = $('#memberId').val();
	var pwd = $('#memberPwd').val();
	
	if (usrId == ''){
		$('#memberId').focus();
		return;
	}
	if (pwd == ''){
		$('#memberPwd').focus();
		return;
	}

	var paramJson = {
			"memberId" : usrId,
			"memberPwd": pwd
			}; 
	var queryUrl = BasePath + "/user/obj_check"; 
	
	 $.ajax({  
         type : 'GET', 
//         contentType : 'application/json',
         url : queryUrl,  
         data: paramJson,  
//         dataType : 'text',
//         async : false,  //同步
         success : function() {  
//             if(null == data) {  
//                 alert("用户不存在！");  
//                 $('#memberId').focus();
//             } else if(usrId == data.memberId && pwd == data.memberPwd){
//            	 alert("Welcome "+data.memberName+" !");
//            	 window.location = BasePath +"/user/welcome";
//             }  else {
//            	 alert("用户名或密码输入错误！");
//                 $('#memberId').focus();
//             }  
         },  
         error : function() {  
             alert("系统查询错误"); 
         }  
     });
};