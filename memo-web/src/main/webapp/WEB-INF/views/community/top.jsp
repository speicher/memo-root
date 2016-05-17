<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="hd" class="vr_header">
	<div class="wp">
		<div class="hdc cl">
			<h2>
				<a href="" title="Danica World">
				  <img src="" alt="Danica World" border="0" />
				</a>
			</h2>
			<!-- 头部链接 -->
			<div id="hd_nv">
				<ul>
					<li class="a" id="mn_portal">
					    <a href="" hidefocus="true" title="Portal">首页</a>
					</li>
					<li id="mn_P1">
					    <a href="works/index" hidefocus="true">作品</a>
					</li>
					<!-- <li id="mn_Ned10">
					    <a href="forum/index" hidefocus="true">论坛</a>
					</li> -->
				</ul>
			</div>
			<div class="y">
				<div class="p_um">
					<div id="um">
				    <% if(null == request.getSession().getAttribute("memberId")) {%>
					    <p class="login">
							<a href="login">登录</a>
							<span class="pipe">|</span> 
							<a href="register">注册</a>
						</p>
					<%} else{ %>
						<div class="hd_avt" href="usr/home">
							<a class="vr_ur" href="usr/home"> 
							    <img src="<%=path%>/static/css/community/images/pc_css_img/login_im.jpg">
							</a>
						</div>
						<div class="hd_usr_info">
							<div class="action">
								<ul>
									<li><a href="usr/profile_s">设置</a></li>
									<li><a href="logout">退出</a></li>
								</ul>
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>