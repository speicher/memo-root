<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Dany's BookMarket !</title>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%=request.getContextPath()%>/static/js/authority_module.js" type="text/javascript"></script>
</head>
<body>
    <form action="">
	  <table>
	    <tbody>
	      <tr>
	        <td>用户名：<input type="text" name="memberId" id="memberId"></td>
	      </tr>
	      <tr>
	        <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" name="memberPwd" id="memberPwd"></td>
	      </tr>
	      <tr>
	        <td>
	          <!-- <input type="button" id="submit" onclick="authority_module.checkForm()" value="登录"> -->
	          <a id="submit" href="" onclick="authority_module.checkForm()">登录</a>
	          <input type="button" id="cancel" onclick="" value="取消">
	        </td>
	      </tr>
	    </tbody>
	  </table>
    </form>
</body>
</html>