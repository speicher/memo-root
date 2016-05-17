<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tencent VR开发者社区</title>
</head>
<body id="nv_portal" class="vr_bbs pg_index" onkeydown="if(event.keyCode==27) return false;">
	<div id="append_parent"></div>
	<div id="ajaxwaitid"></div>
	<div id="hd" class="vr_header">
		<div class="wp">
			<div class="vr_user cl">
				<div class="y">
					<div class="vr_um">
						<div id="um">
							<div href="home.php?mod=space&amp;uid=308" class="vr_avt">
								<a href="home.php?mod=space&amp;uid=308" class="vr_ur"> 
								    <img src="<%=path%>/static/css/community/images/portal_img/noavatar.jpg" />
								</a>
							</div>
							<div class="vr_um_ex_info">
								<div class="action">
									<ul>
										<li><a href="home.php?mod=spacecp">设置</a></li>
										<li><a href="home.php?mod=space&amp;do=pm" id="pm_ntc">消息</a></li>
										<li><a href="home.php?mod=space&amp;do=notice" id="myprompt"
											onmouseover="/*showMenu({'ctrlid':'myprompt'});*/">提醒</a> 
											<span id="myprompt_check"></span></li>
										<li><a href="home.php?mod=space&amp;do=favorite&amp;view=me">收藏</a></li>
										<li><a href="member.php?mod=logging&amp;action=logout&amp;formhash=16b1d001">退出</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hdc cl">
				<h2>
					<a href="http://vr.qq.com/" title="Tencent VR开发者社区"><img
						src="template/vr_bbs/images/logo.png" alt="Tencent VR开发者社区"
						border="0" /></a>
				</h2>
				<div id="vr_nv">
					<ul>
						<li class="a" id="mn_portal"><a href="portal.php"
							hidefocus="true" title="Portal">首页<span>Portal</span></a></li>
						<li id="mn_P1"><a
							href="http://vr.qq.com/portal.php?mod=list&catid=1"
							hidefocus="true">资讯</a></li>
						<li id="mn_Ned10"><a href="forum.php?mod=forumdisplay&fid=2"
							hidefocus="true">论坛</a></li>
						<li id="mn_P3"><a
							href="http://vr.qq.com/portal.php?mod=list&catid=3"
							hidefocus="true">活动</a></li>
						<li id="mn_N5dce"><a href="http://vr.tencent.com"
							hidefocus="true">腾讯VR平台</a></li>
					</ul>
				</div>
				<div id="scbar" class="cl">
					<form id="scbar_form" method="post" autocomplete="off"
						onsubmit="searchFocus($('scbar_txt'))"
						action="search.php?searchsubmit=yes" target="_blank">
						<input type="hidden" name="mod" id="scbar_mod" value="search" />
						<input type="hidden" name="formhash" value="16b1d001" /> <input
							type="hidden" name="srchtype" value="title" /> <input
							type="hidden" name="srhfid" value="0" /> <input type="hidden"
							name="srhlocality" value="portal::index" />
						<table cellspacing="0" cellpadding="0">
							<tr>
								<td class="scbar_icon_td"></td>
								<td class="scbar_txt_td"><input type="text" name="srchtxt"
									id="scbar_txt" value="请输入搜索内容" autocomplete="off"
									x-webkit-speech speech /></td>
								<td class="scbar_type_td"><a href="javascript:;"
									id="scbar_type" class="xg1" onclick="showMenu(this.id)"
									hidefocus="true">搜索</a></td>
								<td class="scbar_btn_td"><button type="submit"
										name="searchsubmit" id="scbar_btn" sc="1" class="pn pnc"
										value="true">
										<strong class="xi2">搜索</strong>
									</button></td>
								<td class="scbar_hot_td">
									<div id="scbar_hot">
										<strong class="xw1">热搜: </strong> <a
											href="search.php?mod=forum&amp;srchtxt=%E6%B4%BB%E5%8A%A8&amp;formhash=16b1d001&amp;searchsubmit=true&amp;source=hotsearch"
											target="_blank" class="xi2" sc="1">活动</a> <a
											href="search.php?mod=forum&amp;srchtxt=%E4%BA%A4%E5%8F%8B&amp;formhash=16b1d001&amp;searchsubmit=true&amp;source=hotsearch"
											target="_blank" class="xi2" sc="1">交友</a> <a
											href="search.php?mod=forum&amp;srchtxt=discuz&amp;formhash=16b1d001&amp;searchsubmit=true&amp;source=hotsearch"
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
	<div id="wp" class="wp">
		<style id="diy_style" type="text/css"></style>
		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>
		<script src="template/vr_bbs/images/jquery.min.js"
			type="text/javascript"></script>
		<script src="template/vr_bbs/images/slider.js" type="text/javascript"></script>
		<div class="index_hd">
			<div class="flexslider" id="banner_tabs">
				<ul class="slides">
					<li><a href="javascript:;" title="虚拟现实中的手势交互都有哪些形式？"
						target="_blank"><img src="template/vr_bbs/images/alpha.png"
							style="background: url(data/attachment/portal/201602/25/055504ymw53f4af5fkrllf.jpg) no-repeat center;"></a></li>
				</ul>
				<ul class="flex-direction-nav">
					<li><a href="javascript:;" class="flex-prev">Previous</a></li>
					<li><a href="javascript:;" class="flex-next">Next</a></li>
				</ul>
				<ol class="flex-control-nav flex-control-paging" id="bannerCtrl">
					<li><a href="javascript:;" title="虚拟现实中的手势交互都有哪些形式？"
						target="_blank"><img src="template/vr_bbs/images/alpha.png"
							style="background: url(data/attachment/portal/201602/25/055504ymw53f4af5fkrllf.jpg) no-repeat center;"></a></li>
				</ol>
			</div>
		</div>
		<script type="text/javascript">
jQuery(function() {
var bannerSlider = new Slider(jQuery('#banner_tabs'), {
time: 5000,
delay: 400,
event: 'hover',
auto: true,
mode: 'fade',
controller: jQuery('#bannerCtrl'),
activeControllerCls: 'active'
});
jQuery('#banner_tabs .flex-prev').click(function() {
bannerSlider.prev()
});
jQuery('#banner_tabs .flex-next').click(function() {
bannerSlider.next()
});
})
</script>
		<div class="wp">
		</div>
	</div>
	<script type="text/javascript">
_attachEvent(window, 'load', getForbiddenFormula, document);
function getForbiddenFormula() {
var toGetForbiddenFormulaFIds = function () {
ajaxget('plugin.php?id=cloudsearch&formhash=16b1d001');
};
var a = document.body.getElementsByTagName('a');
for(var i = 0;i < a.length;i++){
if(a[i].getAttribute('sc')) {
a[i].setAttribute('mid', hash(a[i].href));
a[i].onmousedown = function() {toGetForbiddenFormulaFIds();};
}
}
var btn = document.body.getElementsByTagName('button');
for(var i = 0;i < btn.length;i++){
if(btn[i].getAttribute('sc')) {
btn[i].setAttribute('mid', hash(btn[i].id));
btn[i].onmousedown = function() {toGetForbiddenFormulaFIds();};
}
}
}
</script>
	<div id="ft" class=" cl">
		<div id="flk" class=" wp">
			<p>
				<a href="http://vr.qq.com/">首页</a><a
					href="http://vr.qq.com/portal.php?mod=list&catid=1">资讯</a><a
					href="http://vr.qq.com/forum.php?mod=forumdisplay&fid=2">论坛</a><a
					href="http://vr.qq.com/portal.php?mod=list&catid=3">活动</a><a
					href="http://vr.tencent.com/">腾讯VR平台</a>
			</p>
			<p class="xs0">Copyright©2015 Tencent. All Rights Reserved.腾讯公司 版权所有</p>
		</div>
	</div>
	<script src="home.php?mod=spacecp&ac=pm&op=checknewpm&rand=1462214893"
		type="text/javascript"></script>
	<div id="scrolltop">
		<span hidefocus="true">
		    <a title="返回顶部" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a>
		</span>
	</div>
	<script type="text/javascript">_attachEvent(window, 'scroll', function () { showTopLink(); });checkBlind();</script>
</body>
</html>
