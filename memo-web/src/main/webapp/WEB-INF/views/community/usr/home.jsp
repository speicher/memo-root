<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Danica个人资料－Danica World</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
</head>
<body id="nv_member" class="vr_bbs pg_register" onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
	    
		<div class="wp home_wp cl">
		    <!-- navigation-start -->
		    <div id="navi" class="bm cl">
				<div class="z">
					<a href="" class="nvhm" title="首页">Danica World</a> <em>&rsaquo;</em>
					会员主页
				</div>
			</div>
			<!-- navigation-end -->
			<div class="mn"> 
			  <div class="div_ct">
			    <div class="usr_avatar cl">
			      <div id="avatar_dv_ct">
					<div class="avatar_m">
						<span>
						    <a><img src="<%=path%>/static/css/community/images/pc_css_img/login_im.jpg" /></a>
						</span>
					</div>
					<div>
						<h2 class="name">
							<a><%=request.getSession().getAttribute("memberName")%></a>
						</h2>
						<p></p>
						<p class="on">
							等级：<span>LV<%=request.getSession().getAttribute("memberLevel")%></span>
						</p>
					</div>
				  </div>
				</div>
				<div class="home_mod">
					<a href="usr/profile_s">修改资料</a>
				</div>
				<div id="home_ls_dv">
					<div class="home_list">
						<h2>
							<a href="home.php?mod=space&amp;uid=308&amp;do=favorite&amp;view=me&amp;type=thread">我关注的作品/问答</a>
						</h2>
						<div id="my_vr_threadlist"></div>
					</div>
					<div class="home_list">
						<h2>
							<a href="home.php?mod=space&amp;uid=308&amp;do=thread&amp;view=me&amp;from=space">我的发布</a>
						</h2>
						<div id="my_vr_threadlistmy"></div>
					</div>
				</div>
			  </div>
			</div>
		</div>
	</div>
	<%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
