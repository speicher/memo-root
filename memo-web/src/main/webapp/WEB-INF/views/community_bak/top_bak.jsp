<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="qmenu_menu" class="p_pop blk" style="display: none;">
	<div class="ptm pbw hm">
		请 <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>登录</strong></a>
		后使用快捷导航<br />没有帐号？<a href="register" class="xi2 xw1">立即注册</a>
	</div>
	<div id="fjump_menu" class="btda"></div>
</div>
<div id="hd" class="vr_header">
	<div class="wp">
		<div class="vr_user cl">
			<div class="y">
				<div class="vr_um">
					<div id="um">
						<p class="login">
							<a href="login">登录</a>
							<span class="pipe">|</span> 
							<a href="register">注册</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="hdc cl">
			<h2>
				<a href="" title="Danica个人社区">
				  <img src="" alt="Danica个人社区" border="0" />
				</a>
			</h2>
			<!-- 头部链接 -->
			<div id="vr_nv">
				<ul>
					<li class="a" id="mn_portal">
					    <a href="" hidefocus="true" title="Portal">首页<span>Portal</span></a>
					</li>
					<li id="mn_P1">
					    <a href="myWork" hidefocus="true">作品</a>
					</li>
					<li id="mn_Ned10">
					    <a href="forume" hidefocus="true">论坛</a>
					</li>
				</ul>
			</div>
			<div id="scbar" class="cl">
				<form id="scbar_form" method="post" autocomplete="off"
					onsubmit="searchFocus($('scbar_txt'))"
					action="search.php?searchsubmit=yes" target="_blank">
					<input type="hidden" name="mod" id="scbar_mod" value="search" />
					<input type="hidden" name="formhash" value="09a2169c" /> 
					<input type="hidden" name="srchtype" value="title" /> 
					<input type="hidden" name="srhfid" value="0" />
					<input type="hidden" name="srhlocality" value="portal::index" />
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td class="scbar_icon_td"></td>
							<td class="scbar_txt_td"><input type="text" name="srchtxt"
								id="scbar_txt" value="请输入搜索内容" autocomplete="off"
								x-webkit-speech speech /></td>
							<td class="scbar_type_td">
							    <a href="javascript:;" id="scbar_type" class="xg1" 
							    onclick="showMenu(this.id)" hidefocus="true">搜索</a>
							</td>
							<td class="scbar_btn_td">
							    <button type="submit" name="searchsubmit" id="scbar_btn" sc="1" class="pn pnc" value="true">
									<strong class="xi2">搜索</strong>
								</button>
					        </td>
							<td class="scbar_hot_td">
								<div id="scbar_hot">
									<strong class="xw1">热搜: </strong> <a
										href="search.php?mod=forum&amp;srchtxt=%E6%B4%BB%E5%8A%A8&amp;formhash=09a2169c&amp;searchsubmit=true&amp;source=hotsearch"
										target="_blank" class="xi2" sc="1">活动</a> <a
										href="search.php?mod=forum&amp;srchtxt=%E4%BA%A4%E5%8F%8B&amp;formhash=09a2169c&amp;searchsubmit=true&amp;source=hotsearch"
										target="_blank" class="xi2" sc="1">交友</a> <a
										href="search.php?mod=forum&amp;srchtxt=discuz&amp;formhash=09a2169c&amp;searchsubmit=true&amp;source=hotsearch"
										target="_blank" class="xi2" sc="1">discuz</a>

								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<ul id="scbar_type_menu" class="p_pop" style="display: none;">
				<li><a href="javascript:;" rel="article">文章</a></li>
				<li><a href="javascript:;" rel="forum" class="curtype">帖子</a></li>
				<li><a href="javascript:;" rel="user">用户</a></li>
			</ul>
			<script type="text/javascript">
				initSearchmenu('scbar', '');
			</script>
		</div>
		<div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div>
		<div id="mu" class="cl"></div>
	</div>
</div>