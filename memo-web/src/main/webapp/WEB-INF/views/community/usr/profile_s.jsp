<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料－Danica个人社区</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
<link href="<%=path%>/static/assets/css/ui.min.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/static/assets/js/libs/ui.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/community/profile_s.js" type="text/javascript"></script>
</head>
<body id="nv_member" class="vr_bbs pg_register" onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
		<div class="wp home_wp cl">
		    <!-- navigation-start -->
		    <div id="navi" class="bm cl">
				<div class="z">
					<a href="" class="nvhm" title="首页">Danica World</a> <em>&rsaquo;</em>
					<a href="usr/home" title="会员主页">会员主页</a> <em>&rsaquo;</em>
					修改资料
				</div>
			</div>
			<!-- navigation-end -->
			<div class="mn">
				<div class="div_ct">
					<ul class="ct_ul">
						<li class="a"><strong>基本资料</strong></li>
					</ul>
					<form id="dataform" method="post" autocomplete="off" class="cl" >
					    <input type="hidden" name="memberId" id="memberId" value="${member.memberId}" />
					    <div class="c cl">
							<table cellspacing="0" cellpadding="0" class="ct_tb">
								<tr>
									<th>昵称</th>
									<td><input type="hidden" id="oldusrname" value="${member.memberName}" />
									    <input class="easyui-validatebox ipt" name="memberName" id="memberName" value="${member.memberName}" validType="nameCn" tabindex="1"/>
									</td>
								</tr>
								<tr>
									<th>邮箱</th>
									<td><span>${member.email}</span></td>
								</tr>
								<tr>
									<th>性别</th>
									<td>
									    <input class="easyui-combobox ipt" style="width:104px" name="gender" id="gender" value="${member.gender}"/>
									    <div class="rq mtn" id="showerror_gender"></div>
										<p class="d"></p>
									</td>
								</tr>
								<tr>
									<th>生日</th>
									<td>
									    <input class="easyui-datebox ipt" name="birthDate" id="birthDate" value="${birthday}" readonly="readonly" style="width:100px" />
									    <div class="rq mtn" id="showerror_birthDate"></div>
										<p class="d"></p>
									</td>
								</tr>
								<tr>
									<th>联系电话</th>
									<td>
									    <input class="easyui-validatebox ipt" name="contectNo" id="contectNo" value="${member.contectNo}" validType="mobile" tabindex="1"/>
									    <div class="rq mtn" id="showerror_contectNo"></div>
										<p class="d"></p>
									</td>
								</tr>
								<tr>
									<th>联系地址</th>
									<td>
									    <input class="easyui-validatebox ipt" name="address" id="address" value="${member.address}" validType="length[0,100]" tabindex="1" />
									    <div class="rq mtn" id="showerror_address"></div>
										<p class="d"></p>
									</td>
								</tr>
								<tr>
									<th>备注</th>
									<td>
									    <input class="easyui-validatebox ipt" name="remark" id="remark" class="ipt" value="${member.remark}" validType="length[0,255]" tabindex="1" />
									    <div class="rq mtn" id="showerror_remark"></div>
										<p class="d"></p>
									</td>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td>
									    <input class="pn btnl" id="profilesubmit" type="button" value="保存" onclick="checksubmit()" tabindex="1">
									    <span id="submit_result" class="rq"></span>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
