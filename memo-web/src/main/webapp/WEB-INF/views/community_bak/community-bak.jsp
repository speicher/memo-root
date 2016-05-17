<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Danica个人社区</title>

<meta name="keywords" content="首页" />
<meta name="description" content="首页 " />
<meta name="author" content="Danica" />
<meta name="copyright" content="2016-04-19 by Danica" />
<!-- <meta name="MSSmartTagsPreventParsing" content="True" /> 
说明：在Microsoft IE 6 中有一个 Smart tag 开关，如果您包含下面标记，访问这将看不到某些相关连接，
这样可以避免访问者流失到竞争对手的网站上去。
-->
<!-- 是否在IE中关闭xp 的主题。如下定义表示打开xp 的蓝色立体按钮系统显示。
<meta http-equiv="MSThemeCompatible" content="Yes" />
 -->
<!--  -->
<base href="http://vr.qq.com/" />
<link rel="stylesheet" type="text/css" href="data/cache/style_2_common.css?Ou9" />
<script type="text/javascript">
	var STYLEID = '2', 
	STATICURL = 'static/', 
	IMGDIR = 'static/image/common', 
	VERHASH = 'Ou9', 
	charset = 'utf-8', 
	discuz_uid = '0', 
	cookiepre = 'yxct_2132_', 
	cookiedomain = '', 
	cookiepath = '/', 
	showusercard = '1', 
	attackevasive = '0', 
	disallowfloat = 'newthread', 
	creditnotice = '1|威望|,2|金钱|,3|贡献|', 
	defaultstyle = '', 
	REPORTURL = 'aHR0cDovL3ZyLnFxLmNvbS8=', 
	SITEURL = 'http://vr.qq.com/', 
	JSPATH = 'static/js/', 
	CSSPATH = 'data/cache/style_', 
	DYNAMICURL = '';
</script>
<script src="static/js/common.js?Ou9" type="text/javascript"></script>
<!-- "application-name" 元数据定义固定网站应用程序实例的名称。
当光标悬停在 Windows 7 任务栏的固定网站按钮上时，此名称将出现在工具提示中。
该应用程序名称还将附加到固定网站应用程序实例的窗口标题中。 -->
<meta name="application-name" content="Danica个人社区" />
<!-- "msapplication-tooltip" 元数据提供其他工具提示文本，
当光标悬停在 Windows 的“开始”菜单中或桌面上的固定网站快捷方式上时，将会出现这些文本。 -->
<meta name="msapplication-tooltip" content="Danica个人社区" />
<!-- 它能够将一个网站如同程序固定在 Windows Vista 和 Windows 7 的任务栏中，并且在点击图标后显示一个相关网站的列表。
与其他网站元数据一样，可使用 meta 元素定义静态任务。下一个任务向跳转列表 -->
<meta name="msapplication-task"
	content="name=首页;action-uri=http://vr.qq.com/portal.php;icon-uri=http://vr.qq.com/static/image/common/portal.ico" />
<meta name="msapplication-task"
	content="name=论坛;action-uri=http://vr.qq.com/forum.php;icon-uri=http://vr.qq.com/static/image/common/bbs.ico" />
<script src="static/js/portal.js?Ou9" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="template/vr_bbs/images/pc_css.css" />
<script src="template/vr_bbs/images/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		var h = jQuery(window).height();
		var ht = h - 271;
		jQuery("#wp").css("min-height", ht + 'px')
	})
</script>
</head>

<body id="nv_portal" class="vr_bbs pg_index"
	onkeydown="if(event.keyCode==27) return false;">
	<div id="append_parent"></div>
	<div id="ajaxwaitid"></div>
	<div id="qmenu_menu" class="p_pop blk" style="display: none;">
		<div class="ptm pbw hm">
			请 <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>登录</strong></a>
			后使用快捷导航<br />没有帐号？<a href="member.php?mod=register" class="xi2 xw1">立即注册</a>
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
								<a href="member.php?mod=logging&amp;action=login&amp;referer=">登录</a>
								<span class="pipe">|</span> <a href="member.php?mod=register">注册</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="hdc cl">
				<h2>
					<a href="http://vr.qq.com/" title="Danica个人社区">
					  <img src="template/vr_bbs/images/logo.png" alt="Tencent VR开发者社区" border="0" />
					</a>
				</h2>
				<div id="vr_nv">
					<ul>
						<li class="a" id="mn_portal">
						    <a href="portal.php" hidefocus="true" title="Portal">首页<span>Portal</span></a>
						</li>
						<li id="mn_P1">
						    <a href="http://vr.qq.com/portal.php?mod=list&catid=1" hidefocus="true">资讯</a>
						</li>
						<li id="mn_Ned10">
						    <a href="forum.php?mod=forumdisplay&fid=2" hidefocus="true">论坛</a>
						</li>
						<li id="mn_P3">
						    <a href="http://vr.qq.com/portal.php?mod=list&catid=3" hidefocus="true">活动</a>
						</li>
						<li id="mn_N5dce">
						    <a href="http://vr.tencent.com" hidefocus="true">腾讯VR平台</a>
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
	<div id="wp" class="wp">
		<style id="diy_style" type="text/css"></style>
		<div class="wp">
			<div id="diy1" class="area"></div>
		</div>
		<script src="template/vr_bbs/images/jquery.min.js" type="text/javascript"></script>
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
					time : 5000,
					delay : 400,
					event : 'hover',
					auto : true,
					mode : 'fade',
					controller : jQuery('#bannerCtrl'),
					activeControllerCls : 'active'
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
			<div class="index_ct cl">
				<div class="index_mn">
					<div class="index_tj cl">
						<ul>
							<li class="tj_1"><a
								href="http://vr.qq.com/portal.php?mod=view&aid=16"
								title="Tencent VR：开发VR游戏要善用平台优势" target="_blank"><img
									src="data/attachment/portal/201603/10/074307ljjh5hstrrh2ky4l.png" />
								<p>
										<font style="color: #FFFFFF;">Tencent VR：开发VR游戏要善用平台优势</font>
									</p>
									<span> <em style="background: #da1a6b;">资讯</em></span></a></li>
							<li class="tj_2"><a
								href="http://vr.qq.com/forum.php?mod=viewthread&tid=53"
								title="深度解读VR游戏开发：导航、avatar和视觉设计" target="_blank"><img
									src="data/attachment/portal/201604/18/093613f2rcixjxyyrjxyzr.gif" />
								<p>深度解读VR游戏开发：导航、avatar和视觉设计</p>
									<span> <em style="background: #da1a6b;">观点</em></span></a></li>
							<li class="tj_3"><a
								href="http://vr.qq.com/portal.php?mod=view&aid=8"
								title="VR项目开发过程中的梳理总结" target="_blank"><img
									src="data/attachment/portal/201603/10/074622u52hb8z39v3kbiy9.jpg" />
								<p>VR项目开发过程中的梳理总结</p>
									<span> <em style="background: #da1a6b;">推荐</em></span></a></li>
						</ul>
					</div>
					<div class="index_list">
						<ul>
							<li>
								<div class="imdex_list_l">
									<a href="portal.php?mod=view&aid=24"
										title="扎克伯格为FB规划未来：连接全人类 让VR侵入生活" target="_blank"> <img
										src="data/attachment/portal/201604/13/081630o99qy59fe9kxgkve.jpg" />
										<span></span>
									</a>
								</div>
								<div class="imdex_list_c">
									<a href="portal.php?mod=view&aid=24"
										title="扎克伯格为FB规划未来：连接全人类 让VR侵入生活" target="_blank">扎克伯格为FB规划未来：连接全人类
										让VR侵入生活</a> <span>2016-04-13</span>
								</div>
								<div class="imdex_list_r">
									在本届F8开发者大会上，图片社交应用Instagram没有被提及，视频直播、虚拟现实等则被重点推广，这显示Facebook已经将重心转移到下一个流行的传播形式：视频和VR。演讲中，通过自己的例子讲述人们的传播方式如何演变
								</div>
							</li>
							<li>
								<div class="imdex_list_l">
									<a href="portal.php?mod=view&aid=23" title="揭秘VR版《刀剑神域》同步测试全过程"
										target="_blank"> <img
										src="data/attachment/portal/201604/07/084602io8sr28gn42484qy.jpeg" />
										<span></span>
									</a>
								</div>
								<div class="imdex_list_c">
									<a href="portal.php?mod=view&aid=23" title="揭秘VR版《刀剑神域》同步测试全过程"
										target="_blank">揭秘VR版《刀剑神域》同步测试全过程</a> <span>2016-04-07</span>
								</div>
								<div class="imdex_list_r">
									《刀剑神域》的内容是玩家进入游戏内，以离开游戏为目的在游戏的虚拟环境中展开冒险的故事，说白了其实就是VR游戏的概念替换。IBM在3月使用目前开发的VR技术与OculusRift结合，开发出了《刀剑神域》的同步游戏测试版
								</div>
							</li>
							<li>
								<div class="imdex_list_l">
									<a href="forum.php?mod=viewthread&tid=48"
										title="首发VR游戏ADR1FT测评：沉迷宇宙与恶心到吐" target="_blank"> <img
										src="data/attachment/forum/201604/06/181717jo5jg2xs2z1sfo62.jpg" />
										<span></span>
									</a>
								</div>
								<div class="imdex_list_c">
									<a href="forum.php?mod=viewthread&tid=48"
										title="首发VR游戏ADR1FT测评：沉迷宇宙与恶心到吐" target="_blank">首发VR游戏ADR1FT测评：沉迷宇宙与恶心到吐</a>
									<span>2016-04-06</span>
								</div>
								<div class="imdex_list_r">今天，身在美国的大批游戏迷有福了，因为著名虚拟现实设备厂商
									Oculus 的第一批虚拟现实头盔 Oculus Rift 正式送到了他们手上，他们迫不及待地开始把玩这款心爱的设备。

									当然，对于绝大多数购买它的人来说，第一个</div>
							</li>
							<li>
								<div class="imdex_list_l">
									<a href="http://vr.qq.com/portal.php?mod=view&aid=21"
										title="延迟背后的真相，Oculus 首席科学家卡马克的分享" target="_blank"> <img
										src="data/attachment/portal/201604/18/093859o7d4x000hubzpsug.jpg" />
										<span></span>
									</a>
								</div>
								<div class="imdex_list_c">
									<a href="http://vr.qq.com/portal.php?mod=view&aid=21"
										title="延迟背后的真相，Oculus 首席科学家卡马克的分享" target="_blank">延迟背后的真相，Oculus
										首席科学家卡马克的分享</a> <span>2016-04-04</span>
								</div>
								<div class="imdex_list_r">从延迟的角度来看，VR
									技术是一项最需要「人在环中（human-in-loop）」的应用。对于高质量的 VR 体验而言，最重要的是用户头部物理移动与
									HMD 上实时刷新图像到达用户眼睛之间的延迟时间。人类的感官系统</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="index_sd">
					<div class="index_qd">
						<a href="plugin.php?id=k_misign:sign" target="_blank"><img
							src="template/vr_bbs/images/qd.jpg" /></a>
					</div>
					<div class="index_fb">
						<a href="forum.php?mod=misc&amp;action=nav"
							onclick="showWindow('nav', this.href, 'get', 0)">发表主题</a>
					</div>
					<div class="index_tj_hd">
						<div class="index_t_hd">
							<div class="blocktitle title">
								<span class="titletext">线上活动</span><span style="float: right"
									class="subtitle"><a href="" target="_blank">MORE</a></span>
							</div>
							<ul>
								<li><a
									href="http://vr.qq.com/forum.php?mod=viewthread&tid=24&extra=page%3D1"
									title="在虚拟现实中玩桌游是一种怎样的体验？" target="_blank"><img
										src="data/attachment/portal/201603/21/101727wl1k6kaq6yzyqq1u.png" />
									<p>在虚拟现实中玩桌游是一种怎样的体验？</p></a></li>
							</ul>
						</div>
						<div class="index_t_hd">
							<div class="blocktitle title">
								<span class="titletext">线下活动</span><span style="float: right"
									class="subtitle"><a href="" target="_blank">MORE</a></span>
							</div>
							<ul>
								<li><a href="http://vr.qq.com/portal.php?mod=view&aid=4"
									title="Tencent VR开发者沙龙（北京站）" target="_blank"><img
										src="data/attachment/portal/201603/10/080515i4za1mod4ot11cc4.jpg" />
									<p>Tencent VR开发者沙龙（北京站）</p></a></li>
							</ul>
						</div>
					</div>
					<div class="index_gj">
						<div class="blocktitle title">
							<span class="titletext">组件工具</span><span style="float: right"
								class="subtitle"><a href="" target="_blank">MORE</a></span>
						</div>
						<ul>
							<li class="gj_1"><a href="forum.php?mod=viewthread&tid=28"
								title="组件分享：ARM（VR.SDK）" target="_blank">组件分享：ARM（VR.SDK）<em>开源</em></a>
								<p>最新版本下载_0.2_Windows： 大 ...</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script
			src="misc.php?mod=diyhelp&action=get&type=index&diy=yes&r=WKMY"
			type="text/javascript" type="text/javascript"></script>
	</div>

	<script type="text/javascript">
		_attachEvent(window, 'load', getForbiddenFormula, document);
		function getForbiddenFormula() {
			var toGetForbiddenFormulaFIds = function() {
				ajaxget('plugin.php?id=cloudsearch&formhash=09a2169c');
			};
			var a = document.body.getElementsByTagName('a');
			for (var i = 0; i < a.length; i++) {
				if (a[i].getAttribute('sc')) {
					a[i].setAttribute('mid', hash(a[i].href));
					a[i].onmousedown = function() {
						toGetForbiddenFormulaFIds();
					};
				}
			}
			var btn = document.body.getElementsByTagName('button');
			for (var i = 0; i < btn.length; i++) {
				if (btn[i].getAttribute('sc')) {
					btn[i].setAttribute('mid', hash(btn[i].id));
					btn[i].onmousedown = function() {
						toGetForbiddenFormulaFIds();
					};
				}
			}
		}
	</script>

	<script type='text/javascript'>
		var urlRetry = SITEURL + '/plugin.php?id=security:job';
		var ajaxRetry = new Ajax();
		ajaxRetry.post(urlRetry, 'formhash=09a2169c', function(s) {
		});
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
			<p class="xs0">Copyright©2015 Tencent. All Rights Reserved.腾讯公司
				版权所有</p>
		</div>
	</div>
	<script src="home.php?mod=misc&ac=sendmail&rand=1461033409"
		type="text/javascript"></script>
	<div id="scrolltop">
		<span hidefocus="true"><a title="返回顶部"
			onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a></span>
	</div>
	<script type="text/javascript">
		_attachEvent(window, 'scroll', function() {
			showTopLink();
		});
		checkBlind();
	</script>

</body>
</html>
