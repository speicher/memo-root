/**
 * register.js
 * Author:Danica
 * Date: 2016.5.4
 */

$(document).ready(function(){
//	$.parser.parse(); 
	$('#gender').combobox({
		valueField : "label",
		textField : "value",
		data: [{
			label: '0',
			value: '保密'
		},{
			label: '1',
			value: '男'
		},{
			label: '2',
			value: '女'
		}]
	});
	$('#dataForm').form("enableValidation");
});

function checknameduplicate(){
	var flag = false;
	$.ajax({  
        type : 'POST',
        url : BASEPATH + "/community/usr/name_chk",  
        data: {"memberName" : $('#memberName').val()},
        async : false,
        success : function(total) {
        	if(total > 0){
        		flag = true;
        	} else{
        		flag = false;
        	}
        },  
        error : function() {  
            alert("系统错误");
        }  
    });
	return flag;
}

function checksubmit(){
	if(!isvalidated())
		return;

	//验证用户名
	if($('#oldusrname').val() != $('#memberName').val()){
		if(checknameduplicate()){
			alert('该昵称已存在');
			return;
		}
	}

	var postUrl = BASEPATH + "/community/usr/profile_u";
	var paramJson = {
			"memberId" : $('#memberId').val(),
			"memberName" : $('#memberName').val(),
			"gender": $('#gender').combobox('getValue'),
			"birthDate":$('#birthDate').val(),
			"contectNo": $('#contectNo').val(),
			"address": $('#address').val(),
			"remark": $('#remark').val()
			};
	ajaxpost(postUrl, paramJson, function(resultmsg) {
    	if(resultmsg == "success"){
//    		$('#submit_result').html('保存成功');
    		alert('保存成功');
    	} else{
//    		$('#submit_result').html('保存失败');
    		alert('保存失败');
    	}
    });
}
