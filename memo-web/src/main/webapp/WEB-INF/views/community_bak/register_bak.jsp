<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-Danica个人社区</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
</head>

<body id="nv_member" class="vr_bbs pg_register" onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
		<script src="<%=path%>/static/js/community/register.js" type="text/javascript"></script>

		<div id="ct" class="ptm wp vr_ptmt cl">
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
			<div class="mn">
				<div class="bm vr_dl  r_list_dv" id="main_message">
					<div class="" id="main_hnav"></div>
					<p id="returnmessage4"></p>
					<style type="text/css">
						#layer_reginfo_b .rfm {padding: 0; text-align: center;}
						.rfm th {display: none;}
						.b1lr .rfm th {display: block; swidth: auto;}
					</style>
					<form method="post" autocomplete="off" name="register" id="registerform" enctype="multipart/form-data"
						onsubmit="checksubmit();return false;" action="register">
						<div id="layer_reg" class="bm_c r_list_dv">
							<input type="hidden" name="regsubmit" value="yes" />
							<input type="hidden" name="formhash" value="09a2169c" />
							<input type="hidden" name="referer" value="http://vr.qq.com/./" />
							<input type="hidden" name="activationauth" value="" />
							<div class="mtw">
								<div id="reginfo_a">
									<div class="rfm r_d">
										<table>
											<tr>
												<th><span class="rq">*</span><label for="userid">用户名:</label></th>
												<td><input type="text" id="userid" name="" class="px"
													tabindex="1" autocomplete="off" size="25"
													placeholder="请设置你的昵称" maxlength="40" required />
												</td>
												<td class="tipcol">
												    <i id="tip_userid" class="p_tip">用户名由3 到 40 个字符组成</i>
												    <kbd id="chk_userid" class="p_chk"></kbd>
												</td>
											</tr>
										</table>
									</div>

									<div class="rfm r_b">
										<table>
											<tr>
												<th><span class="rq">*</span><label for="pwd">密码:</label></th>
												<td><input type="password" id="pwd" name=""
													placeholder="请设置你的密码" size="25" tabindex="1" class="px" required />
												</td>
												<td class="tipcol">
												    <i id="tip_pwd" class="p_tip">请填写密码, 最小长度为 6 个字符</i>
												    <kbd id="chk_pwd" class="p_chk"></kbd>
												</td>
											</tr>
										</table>
									</div>
									<div class="rfm r_c">
										<table>
											<tr>
												<th><span class="rq">*</span><label for="QtF2yF">确认密码:</label></th>
												<td>
												    <input type="password" id="QtF2yF" name="" size="25" tabindex="1" class="px" placeholder="确认你的密码" required />
												</td>
												<td class="tipcol">
												    <i id="tip_QtF2yF" class="p_tip">请再次输入密码</i>
												    <kbd id="chk_QtF2yF" class="p_chk"></kbd>
												</td>
											</tr>
										</table>
									</div>
									<div class="rfm  r_a">
										<table>
											<tr>
												<th><label for="email">Email:</label></th>
												<td><input type="text" id="email" name="" autocomplete="off" size="25" tabindex="1"
													placeholder="请输入你的邮箱" class="px" value="" /><br />
												    <em id="emailmore">&nbsp;</em>
												</td>
												<td class="tipcol">
												    <i id="tip_email" class="p_tip">请输入正确的邮箱地址</i>
												    <kbd id="chk_email" class="p_chk"></kbd>
												</td>
											</tr>
										</table>
									</div>
									<!-- 验证码 -->
									<div class="rfm r_e">
										<div class="sec_code vm">
											<input id="randcodehash" type="hidden" value="${rand}" />
											<input type="text" style="ime-mode: disabled; width: 130px !important; background: white;"
												class="txt px vm" autocomplete="off" value="" id="randcode" name="" 
												placeholder="验证码" >
											<img src="<%=path%>/verifyCode" class="seccodeimg" />
										</div>
										<script src="<%=path%>/static/js/community/jquery.min.js" type="text/javascript"></script>
										<script type="text/javascript">
											(function() {
												jQuery('.seccodeimg').on('click', function(){
													jQuery('#randcode').attr('value', '');
													var tmprandom = 'S'+ Math.floor(Math.random() * 1000);
													//jQuery('#seccodehash').attr('value', tmprandom);
													jQuery(this).attr('src', '<%=path%>/verifyCode?idhash=' + tmprandom);
												});
											})();
										</script>
									</div>
								</div>
							</div>
						</div>
						<div id="layer_reginfo_b">
							<div class="rfm mbw bw0 d">
								<span id="reginfo_a_btn">
									<button class="pn pnc" id="registerformsubmit" type="submit" name="regsubmit" value="true" tabindex="1">
										<strong>提交</strong>
									</button>
								</span>
							</div>
							<div class="rfm bw0  mbw">
								快捷登录: <a href="http://vr.qq.com/connect.php?mod=login&op=init&referer=http%3A%2F%2Fvr.qq.com%2F.%2F&statfrom=login"
									target="_top" rel="nofollow">
									    <img src="<%=path%>/static/css/community/images/qq_login.gif" class="vm" /></a>
							</div>
						</div>
					</form>
				</div>
				<div id="layer_regmessage" class="f_c blr nfl" style="display: none">
					<div class="c">
						<div class="alert_right">
							<div id="messageleft1"></div>
							<p class="alert_btnleft" id="messageright1"></p>
						</div>
					</div>
					<div id="layer_bbrule" style="display: none">
						<div class="c" style="width: 700px; height: 350px; overflow: auto">
							<br /> <br /> <br />
						</div>
						<p class="fsb pns cl hm">
							<button class="pn pnc" onclick="$('agreebbrule').checked = true;hideMenu('fwin_dialog', 'dialog');">
								<span>同意</span>
							</button>
							<button class="pn" onclick="location.href='http://vr.qq.com/'">
								<span>不同意</span>
							</button>
						</p>
					</div>

					<script type="text/javascript">
						var ignoreEmail = false;// =true : email is not nessasory
						addFormEvent('registerform', 0);
						function showBBRule(){
							showDialog($('layer_bbrule').innerHTML, 'info', 'Danica个人社区 网站服务条款'); 
							$('fwin_dialog_close').style.display = 'none';
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
