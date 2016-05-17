<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-Danica World</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
<script src="<%=path%>/static/js/community/login.js" type="text/javascript"></script>
</head>
<body onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
		<div id="ct" class="ptm wp vr_ptmt w cl">
			<div class="nfl" id="main_succeed" style="display: none">
				<div class="f_c altw">
					<div class="alert_right">
						<p id="succeedmessage"></p>
						<p id="succeedlocation" class="alert_btnleft"></p>
						<p class="alert_btnleft">
							<a id="succeedmessage_href">如果您的浏览器没有自动跳转，请点击此链接</a>
						</p>
					</div>
				</div>
			</div>
			<div class="mn vr_login cl" id="main_message">
				<div class="bm">
					<div>
						<span class="y"></span>
						<div id="main_messaqge_Lgn" class="vr_dl">
							<div id="layer_login">
								<form method="post" autocomplete="off" id="loginform" class="cl" >
									<div class="c cl">
										<div class="rfm a">
											<input type="text" name="username" id="username"
												placeholder="请输入您注册的邮箱或用户名" autocomplete="off" size="30"
												class="px p_fre" tabindex="1" value="" />
										</div>
										<div class="rfm b">
											<input type="password" id="password" name="password"
												placeholder="请输入您的密码" onfocus="clearpwd()" size="30"
												class="px p_fre" tabindex="1" />
										</div>
										<!-- 验证码 -->
										<%-- <div class="rfm e" style="position: relative;">
											<div class="sec_code vm">
												<input id="randcodehash" type="hidden" value="" />
												<input type="text" style="ime-mode: disabled; width: 130px !important; background: white;"
													class="txt px vm" autocomplete="off" value="" id="randcode" name="" 
													placeholder="验证码" >
												<img src="<%=path%>/verifyCode" class="seccodeimg" />
											</div>
											<script type="text/javascript">
												(function() {
													jQuery('.seccodeimg').on('click', function(){
														jQuery('#randcode').attr('value', '');
														var tmprandom = 'S'+ Math.floor(Math.random() * 1000);
														jQuery(this).attr('src', '<%=path%>/verifyCode?idhash=' + tmprandom);
													});
												})();
											</script>
										</div> --%>
										<div class="rfm mbw bw0 d">
										    <input class="pn" id="formsubmit" type="button" value="登录" tabindex="1">
											</div>
										<div class="rfm zz">
											<a href="register">注册</a>
										</div>
										<div class="rfm login_ck_dv cl">
											<a class="y" href="javascript:;"
												onclick="display('layer_login');display('layer_lostpw');"
												title="找回密码">找回密码</a>
										</div>
									</div>
								</form>
							</div>
							<div id="layer_lostpw" style="display: none;">
								<form method="post" autocomplete="off" id="lostpwform_Lgn" class="cl" action="">
									<div class="c cl">
										<div class="rfm a">
											<input type="text" name="email" id="lostpw_email" size="30"
												value="" placeholder="请输入您注册的邮箱" tabindex="1"
												class="px p_fre" />
										</div>
										<div class="rfm b">
											<input type="text" name="username" id="lostpw_username"
												size="30" placeholder="请输入您注册的用户名" value="" tabindex="1"
												class="px p_fre" />
										</div>
										<div class="rfm mbw bw0 d">
											<button class="pn" type="submit" name="lostpwsubmit" value="true" tabindex="100">提交</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
