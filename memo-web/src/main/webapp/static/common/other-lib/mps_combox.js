var cacheCode={};

//查询字典表 p_id格式如：'#colId'  hasNull 是否包含控制  0-包含  1-不包含
function selectFromDic4Combox(p_id, p_code,p_default_value,hasNull){
	if(typeof top.All_CacheCode == 'undefined' || typeof top.All_CacheCode[p_code] == 'undefined'){
		$(p_id).combobox({
			url : BasePath + '/initCache/standard_dtl?lookupcode=' + p_code + '&hasNull='+hasNull,
			valueField : "itemValue",
			textField : "itemName",
			method : 'get',
			panelHeight : "auto",
			editable : false
		});
	} else{
		$(p_id).combobox({
			data:getSysStandardData(p_code,hasNull),
			//url : BasePath + '/initCache/standard_dtl?lookupcode=' + p_code + '&hasNull='+hasNull,
			valueField : "itemValue",
			textField : "itemName",
			method : 'get',
			panelHeight : "auto",
			editable : false//字典类型不让手动修改
			//readonly:true 
		});
	}
	if(typeof p_default_value =="undefined"){
		$(p_id).combobox("unselect", '');
	} else{
		$(p_id).combobox("select", p_default_value);
	}
}

function getSysStandardData(p_code,hasNull){
	if(!top.All_CacheCode[p_code]){
		$.ajax({
			  type: 'GET',
			  url: BasePath + '/initCache/standard_dtl?lookupcode=' + p_code,
			  dataType: "json",
			  data: null,
			  cache: false,
			  async : false,
			  success: function(result){
				  top.All_CacheCode[p_code]=result;  					  
			  }
		});
	}
	if(hasNull==1){
		 var data=new Array();
		 $.each(top.All_CacheCode[p_code],function(index,item){
			 if(item.itemValue!=""){
				 data.push(item);
			 }
		 });
		 return data;
	}else {
		return top.All_CacheCode[p_code];
	}
}
//日期比较
function compareDate(p_id1,p_id2,msg){
	var v_date1 = formatDate($('#'+p_id1).datebox('getValue'));
	var v_date2 = formatDate($('#'+p_id2).datebox('getValue'));
	if(v_date1 != '' && v_date2 != ''){
		if(v_date1 > v_date2){
			alert(msg);
			return true;
		}
	}
	return false;
}

//格式化
function formatDate(p_date_str){
	if(p_date_str == ''){
		return '';
	}
	//只取年月日
	var strArray = p_date_str.split(' ')[0].split('-');
	if(strArray.length == 3){
		return new Date(strArray[0],strArray[1] - 1,strArray[2]);
	}else{
		return '';
	}
};
//日期形式返回yyyy-MM-dd
function formatDatebox(value){
	if (value == null || value == '') {
	       return '';
	   }
	   var dt;
	   if (value instanceof Date) {
	       dt = value;
	   } else {
	       dt = new Date(value);
	       if (isNaN(dt)) {
	           value = value.replace(/\/Date\((-?\d+)\)\//, '$1'); 
	           dt = new Date();
	           dt.setTime(value);
	       }
	   }
	  return dt.format("yyyy-MM-dd");
}

function checkAlreadyDel(p_check_rows,p_property,p_value,p_message){
	for(var i=0;i<p_check_rows.length;i++){
		if(p_check_rows[i][p_property] == p_value){
			alert(p_message);
			return true;
		}
	}
	return false;
}

//异常统一打印
function printExceptionMsg(data,type,msg){
	if(data != null ){
		if(type == null || type == '' || type == 0){
			var data1 = eval('(' + data + ')');
		    if(data1.errorMessage != undefined){
		    	alert(data1.errorMessage);
		    }
		} else if(type == 1){
	    	if(data.errorMessage == undefined){
		        return data;
		    }else{
		        alert(data.errorMessage);
		        var result={};
		        result.total=0;
		        result.rows=[];
				return result;
		    }
	    }		
	}else{
		if(msg != null && msg != ''){
			alert(msg, 2);
		}
	}
}

//删除所有表格
function deleteAllTables(p_grid_id){
	var $dg = $('#'+p_grid_id);
	var v_rows = $dg.datagrid('getRows');
	if(v_rows){
		for(var v_index = v_rows.length - 1;v_index >= 0;v_index--){
			$dg.datagrid('deleteRow',$dg.datagrid('getRowIndex',v_rows[v_index]));
		}
	}
}
//验证
function checkExistFun(url, checkColumnJsonData) {
	var checkExist = false;
	$.ajax({
		type : 'get',
		url : url,
		data : checkColumnJsonData,
		cache : true,
		async : false, // 一定要
		success : function(totalData) {
			totalData = parseInt(totalData, 10);
			if (totalData > 0) {
				checkExist = true;
			}
		}
	});
	return checkExist;
};

function ajaxRequest4JsonSync(url,reqParam,callback){
	$.ajax({
		  type: 'POST',
		  url: url,
		  data: reqParam,
		  cache: true,
		  async:false,
		  dataType: "json",
		  success: callback
	});
}

function ajaxRequest4Json(url,reqParam,callback){
	$.ajax({
		  type: 'POST',
		  url: url,
		  data: reqParam,
		  cache: true,
		  dataType: "json",
		  success: callback
	});
}
function ajaxRequest4JsonAsyn(url,reqParam,callback){
	$.ajax({
		  type: 'GET',
		  url: url,
		  contentType:"application/json;charset=UTF-8",
		  dataType: "json",
		  data: reqParam,
		  cache: false,
		  async : true,
		  success: callback
 });
}

function ajaxRequest4JsonAsynForGet(url,reqParam,callback){
	$.ajax({
		  type: 'GET',
		  url: url,
		  contentType:"application/json;charset=UTF-8",
		  dataType: "json",
		  data: reqParam,
		  cache: false,
		  async : false,
		  success: callback
 });
}

function ajaxRequest4JsonAsynPost(url,reqParam,callback){
	$.ajax({
		  type: 'POST',
		  url: url,
		  contentType:"application/json;charset=UTF-8",
		  dataType: "json",
		  data: reqParam,
		  cache: false,
		  async : true,
		  success: callback
 });
}
//按enter键搜索
/**
$(function(){
	document.onkeydown = function(e){ 
        var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
			ev.preventDefault();
	     	$("#btn-search").trigger('click');
	    }
    };
}); 
**/
//验证两个字段相等，例如密码框
$.extend($.fn.validatebox.defaults.rules, {
    /*必须和某个字段相等*/
    equalTo: { validator: function (value, param) { return $(param[0]).val() == value; }, message: '字段不匹配' }
});
//禁止
function IsNum(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 || k == 46) {
    	if(k == 46){
    		if(obj.value.split(".").length > 1){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
    		};
    	}
    	if(k == 48){//输入0
    		if(obj.value <= 0){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
        	}
    	}
    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}
//整数
function IsNum2(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 ) {
    	if(k == 48){//输入0
    		if(obj.value <= 0){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
        	}
    	}
    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}
//整数
function IsNum3(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 ) {
//    	if(k == 48){//输入0
//    		if(obj.value < 0){
//    			if (window.event) {
//    				window.event.returnValue = false;
//    			}
//    			else {
//    				e.preventDefault(); //for firefox 
//    			}
//        	}
//    	}
    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}
function IsNum4(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 || k == 45 || k == 46) {
    	if(k == 46){
    		if(obj.value.split(".").length > 1){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
    		};
    	}
    	if(k == 45){
    		if(obj.value.split("-").length > 1){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
    		};
    	}
    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}
function IsNum5(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 || k == 46) {
    	if(k == 46){
    		if(obj.value.split(".").length > 1){
    			if (window.event) {
    				window.event.returnValue = false;
    			}
    			else {
    				e.preventDefault(); //for firefox 
    			}
    		};
    	}
    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}

function noCode(e,obj) {
    var k = window.event ? e.keyCode : e.which;
    alert(k);
    if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 ) {

    } else {
        if (window.event) {
            window.event.returnValue = false;
        }
        else {
            e.preventDefault(); //for firefox 
        }
    }
}
//保留两位小数
function parse2Float(obj){
	if(obj.value != ''){
		var value = parseFloat(obj.value);
		value = value.toFixed(2);
		obj.value = value;
	}
}
//保留两位小数
function parse2Int(obj){
	if(obj.value != ''){
		var value = parseInt(obj.value);
		obj.value = value;
	}
}

//正在处理提示
function loadProgressMsg(msg) {
	$.easyui.loading({
		topMost: false,
		msg: msg
	});
}

function closeProgressMsg() {
	$.easyui.loaded(); //关闭
}

//小数格式化
function pointFormatter(value){
	if(value || value == '0'){
	      //数字转换为字符串
	      value += "";
	      var index = value.indexOf(".");
	      if(index < 0){
	          return value + ".00";
	      }else if(value.length - index == 2){ //value类似123.4，需要转换为123.40
	          return value + "0";
	      }
	}
    return value;
};

/**
 * 光标定位明细的第一个列  dgId:明细datagrid的id;field:需要光标定位的列
 */
function locationDetailFocus(dgId ,field){
	var $dg=$('#'+dgId);
	var selectRow = $dg.datagrid("getSelected");
	var selectRowIndex= $dg.datagrid("getRowIndex",selectRow);
	if(selectRowIndex < 0){
		selectRowIndex = 0;
	}
	var editor = $dg.datagrid("getEditor",{index:selectRowIndex,field: field});
	setFocus($(editor.target));
};

//百分比格式化
function percentFormatterWithOutMuli(value) {
	  if(value != undefined && value != ''){
		  //数字转换为字符串
	      value += "";
		  var index = value.indexOf(".");
	      if(index < 0){
	          return value + ".00%";
	      }else if(value.length - index == 2){ //value类似123.4，需要转换为123.40
	          return value + "0%";
	      }else{
	    	  return value + "%";
	      }
	  }
	  return value;
};
//除法
function accDiv(arg1, arg2){
    var t1 = 0, t2 = 0, r1, r2;
    try{
    	t1 = arg1.toString().split(".")[1].length;
    }catch(e){
    	
    }
    try{
    	t2 = arg2.toString().split(".")[1].length;
    }catch(e){
    	
    }
    with(Math){
        r1 = Number(arg1.toString().replace(".",""));
        r2 = Number(arg2.toString().replace(".",""));
        return (r1/r2) * pow(10, t2-t1);
    }
}

//乘法
function accMul(arg1, arg2){
    var m = 0,s1 = arg1.toString(), s2 = arg2.toString();
    try{
    	m += s1.split(".")[1].length;
    }catch(e){
    		
    }
    try{
    	m += s2.split(".")[1].length;
    }catch(e){
    	
    }
    return Number(s1.replace(".","")) * Number(s2.replace(".","")) / Math.pow(10,m);
}

//加法
function accAdd(arg1, arg2) {
    var r1, r2, m;
    try { r1 = arg1.toString().split(".")[1].length; } catch (e) { r1 = 0; }
    try { r2 = arg2.toString().split(".")[1].length; } catch (e) { r2 = 0; }
    m = Math.pow(10, Math.max(r1, r2));
    return (accMul(arg1, m) + accMul(arg2, m)) / m;
}

//减法函数，用来得到精确的减法结果
function subtr(arg1, arg2) {
    var r1, r2, m;
    try { r1 = arg1.toString().split(".")[1].length; } catch (e) { r1 = 0; }
    try { r2 = arg2.toString().split(".")[1].length; } catch (e) { r2 = 0; }
    m = Math.pow(10, Math.max(r1, r2));
    //last modify by deeka
    //动态控制精度长度
    return (accMul(arg1, m) - accMul(arg2, m)) / m;
}

//导入成功后提示：默认4秒
function showImportSuc(msg) {
    top.$.messager.show({
        title: '提示',
        msg: msg,
//        timeout: 3000,
        position:'center',
        showType: 'slide'
    });
}

function getDataGridChanges(dataGridId, param, index){
	 var $dg = $("#"+dataGridId+"");
	 endEditCommon(dataGridId);
//	 var param = {};
	 if($dg.datagrid('getChanges').length) {
        var inserted= $dg.datagrid('getChanges', "inserted");
        var deleted = $dg.datagrid('getChanges', "deleted");
        var updated = $dg.datagrid('getChanges', "updated");

        if(index == 1){
        	if (inserted.length) {
            	param.inserted = JSON.stringify(inserted);
            }
            
            if (deleted.length) {
            	param.deleted = JSON.stringify(deleted);
            }
            
            if (updated.length) {
            	param.updated = JSON.stringify(updated);
            }
        } else if(index == 2){
        	if (inserted.length) {
            	param.inserted2 = JSON.stringify(inserted);
            }
            
            if (deleted.length) {
            	param.deleted2 = JSON.stringify(deleted);
            }
            
            if (updated.length) {
            	param.updated2 = JSON.stringify(updated);
            }
        } else if(index == 3){
        	if (inserted.length) {
            	param.inserted3 = JSON.stringify(inserted);
            }
            
            if (deleted.length) {
            	param.deleted3 = JSON.stringify(deleted);
            }
            
            if (updated.length) {
            	param.updated3 = JSON.stringify(updated);
            }
        }
	 }	
	 return param;
}

/**
 * 通过经营城市和品牌找寻店铺
 * @param id
 */
function initOrganNoQuery(id){
	$("#" + id).filterbuilder({
	    type:'organ', //新增参数，可以先不调整，使用原url
	    organFlag: 2,
	    roleType:'bizCity', 
	    onSave : function(result) { 
	    }
	});
};

/**
 * 查询商品通用机构，返回sql
 * @param id
 */
function initItemQuery(id){
	$("#" + id).filterbuilder({
		type:'item',  //新增参数，可以先不调整，使用原url
	    maxRowNum:3000,
	    sqlFlag:1,
	    onSave : function(result) { 
	    }
	});
};
/**
 * 查询编号时去空格，转大写
 */
function dealString(thisObj){
	var value = $(thisObj).val();
	value = jQuery.trim(value);
	$(thisObj).val(value.toUpperCase());
};


function getShopSettlementDate(shopNo){
	var params = {
			"_method" : "get",
			shopNo : shopNo
		};
	var st="2000-01-01";
	$.ajax({
		  type: 'GET',
		  url: BasePath + '/shared_method/rate/settlement_date',
		  dataType: "json",
		  data: params,
		  cache: false,
		  async : false,
		  success: function(result){
			  if(result != null){
				  if(!String.isNullOrEmpty(result.balanceEndDate)){
					  st = result.balanceEndDate;
				  }
			  };		    					  
		  }
	});
	return st;
}

//提示信息
function showInfo(msg,fun) {
	if(typeof fun==="function"){
		top.$.messager.alert('提示', msg, 'info',fun);
	}else{
		top.$.messager.alert('提示', msg, 'info');
	}
}

//警告操作提示
function showWarn(msg,fun) {
	if(typeof fun==="function"){
		 top.$.messager.alert('提示', msg, 'warning',fun);
	}else{
		 top.$.messager.alert('提示', msg, 'warning');
	}
}

//错误操作提示
function showError(msg,fun) {
	if(typeof fun==="function"){
		top.$.messager.alert('提示', msg, 'error',fun);
	}else{
		top.$.messager.alert('提示', msg, 'error');
	}
    
}
