$(document).ready(function(){
});

parseParam=function(param){
    var paramStr="";
   {
        $.each(param,function(i){
        	paramStr+='&'+i+'='+param[i];
        });
    }
return paramStr.substr(1);
}; 

//它将jquery系列化后的值转为name:value的形式。
function convertArray(o) { 
	var v = {};
	for ( var i in o) {
		if (typeof (v[o[i].name]) == 'undefined')
			v[o[i].name] = o[i].value;
		else
			v[o[i].name] += "," + o[i].value;
	}
	return JSON.stringify(v);
}

checkExistFun = function(url,checkColumnJsonData){
	var checkExist=false;
 	$.ajax({
		  type: 'get',
		  url: url,
		  data: checkColumnJsonData,
		  cache: true,
		  async:false, // 一定要
		  success: function(totalData){
			  totalData = parseInt(totalData,10);
			  if(totalData>0){
				  checkExist=true;
			  }
		  }
     });
 	return checkExist;
};

//浮点数加法运算  
function FloatAdd(arg1,arg2){  
  var r1,r2,m;  
  try{
	  r1=arg1.toString().split(".")[1].length;
   }catch(e){
	   r1=0;
   } 
  try{
	  r2=arg2.toString().split(".")[1].length;
   }catch(e){
	   r2=0;
   }  
  m=Math.pow(10,Math.max(r1,r2)) ; 
  return (arg1*m+arg2*m)/m  ;
 }  

function trimBlank(thisObj){
	 var value=$(thisObj).val();
	  value=jQuery.trim(value);
	  $(thisObj).val(value);  	 	
}  

function accAdd(arg1, arg2) {
	 var r1, r2, m;
	 try {
	  r1 = arg1.toString().split(".")[1].length;
	 } catch (e) {
	  r1 = 0;
	 }
	 try {
	  r2 = arg2.toString().split(".")[1].length;
	 } catch (e) {
	  r2 = 0;
	 }
	 m = Math.pow(10, Math.max(r1, r2));
	 return accDiv((arg1 * m + arg2 * m) , m);
}

//js 除法函数
//调用：accDiv(arg1,arg2)
//返回值：arg1除以arg2的精确结果
function accDiv(arg1, arg2) {
var t1 = 0, t2 = 0, r1, r2;
try {
t1 = arg1.toString().split(".")[1].length;
} catch (e) {
}
try {
t2 = arg2.toString().split(".")[1].length;
} catch (e) {
}
with (Math) {
r1 = Number(arg1.toString().replace(".", ""));
r2 = Number(arg2.toString().replace(".", ""));
return (r1 / r2) * pow(10, t2 - t1);
}
}

//格式化 - 金额千分位
function commafy(num) {
	num = num+""; 
	var v_regex = /(-?\d+)(\d{3})/;
	while(v_regex.test(num)){
		num=num.replace(v_regex,"$1,$2");
	} 
	return num;
}

//当前月初日期
function firstDayOfMonth(){
	var returnV;
	//yyyy-MM-dd格式的时候  
	var a = new Date();
	returnV = (a.getFullYear()) + "-"
	+ ((a.getMonth()+1)<10?'0':'') + (a.getMonth()+1) + "-" +  "01"; 
	return returnV;
}
//当前月底日期
function lastDayOfMonth(){ 
	var d = new Date(); //获取当前时间
	var vYear = d.getFullYear(); //获取当前年份
	var vMon  = d.getMonth() + 1; //获取当前月份
	var isrun = vYear%400==0||(vYear%4==0&vYear%100!=0); // 是否闰年
	var ddate = 30;                                      //月末日期,默认30号
	if(vMon==1||vMon==3||vMon==5||vMon==7||vMon==8||vMon==10||vMon==12){
	   ddate=31;                                         //大月31号
	}
	else if(vMon==2){     //二月
	  ddate=isrun?29:28;  //闰年29号,平年28号
	}	
	return (vYear + "-"+ (vMon<10?'0':'') + vMon + "-" + ddate);
}

function checkPowerJS(powerValue,index){
        var flag=false;
        var  temp =parseInt(Math.pow(2,index));
          var result = powerValue&temp;
            if(result== temp){
                 flag=true;
            }
        return flag;
 }

function redHighLightSyler(value,row,index){
    return 'color:red;';
};