<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Danica个人社区</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
</head>

<body id="nv_portal" class="vr_bbs pg_index" onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
		<style id="diy_style" type="text/css"></style>
		<div class="wp">
			<div id="diy1" class="area"></div>
		</div>
		<script src="<%=path%>/static/js/community/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>/static/js/community/slider.js" type="text/javascript"></script>
		<div class="index_hd">
			<div class="flexslider" id="banner_tabs">
				<ul class="slides">
					<li>
					    <a href="javascript:;" title="早上去公园散步可以让自己更加舒心" target="_blank">
						    <img src="<%=path%>/static/css/community/images/alpha.png"
							style="background: url(<%=path%>/static/css/community/images/portal_img/flower_v.jpg) no-repeat center;">
						</a>
					</li>
					<li>
					    <a href="javascript:;" title="来一场说走就走的旅行" target="_blank">
						    <img src="<%=path%>/static/css/community/images/alpha.png"
							style="background: url(<%=path%>/static/css/community/images/portal_img/xiamen_v.jpg) no-repeat center;">
						</a>
					</li>
				</ul>
				<ul class="flex-direction-nav">
					<li><a href="javascript:;" class="flex-prev">Previous</a></li>
					<li><a href="javascript:;" class="flex-next">Next</a></li>
				</ul>
				<ol class="flex-control-nav flex-control-paging" id="bannerCtrl">
					<li>
					    <a href="javascript:;" title="早上去公园散步可以让自己更加舒心" target="_blank">
					        <img src="<%=path%>/static/css/community/images/alpha.png"
							style="background: url(<%=path%>/static/css/community/images/portal_img/flower_v.jpg) no-repeat center;">
						</a>
					</li>
					<li>
					    <a href="javascript:;" title="来一场说走就走的旅行" target="_blank">
					        <img src="<%=path%>/static/css/community/images/alpha.png"
							style="background: url(<%=path%>/static/css/community/images/portal_img/xiamen_v.jpg) no-repeat center;">
						</a>
					</li>
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
					bannerSlider.prev();
				});
				jQuery('#banner_tabs .flex-next').click(function() {
					bannerSlider.next();
				});
			})
		</script>
		<div class="wp">
			<div class="index_ct cl">
				<div class="index_mn">
					<div class="index_tj cl">
						<ul>
							<li class="tj_1">
							    <a href=""
								title="My Recepy NO.1：虾仁炒饭&芒果切块" target="_blank">
								    <img src="<%=path%>/static/css/community/images/portal_img/myrecepy1_v.jpg" /> 
								    <p><font style="color: #FFFFFF;">My Recepy NO.1：虾仁炒饭&芒果切块</font></p>
									<span> <em style="background: #da1a6b;">营养</em></span>
								</a>
							</li>
							<li class="tj_2">
							    <a href="" title="蛋堡吐司&小番茄＋鸡蛋牛奶布丁＋黑咖啡" target="_blank">
								    <img src="<%=path%>/static/css/community/images/portal_img/myrecepy2_v.jpg" />
								    <p>蛋堡吐司&小番茄＋鸡蛋牛奶布丁＋黑咖啡</p>
									<span> <em style="background: #da1a6b;">精致</em></span>
								</a>
							</li>
							<li class="tj_3">
							    <a href="" title="番茄肉酱意面＋黑咖啡" target="_blank">
								    <img src="<%=path%>/static/css/community/images/portal_img/myrecepy3_v.jpg" />
								    <p>番茄肉酱意面＋黑咖啡</p>
									<span> <em style="background: #da1a6b;">简单</em></span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="index_sd">
					<div class="index_qd">
						<a href="signin" target="_blank">
						    <img src="<%=path%>/static/css/community/images/qd.jpg" /></a>
					</div>
					<!-- 
					<div class="index_fb">
						<a href="forum.php?mod=misc&amp;action=nav" onclick="showWindow('nav', this.href, 'get', 0)">发表主题</a>
					</div> -->
					<div class="index_tj_hd">
						<div class="index_t_hd">
							<div class="blocktitle title">
								<span class="titletext">最新作品</span>
								<span style="float: right" class="subtitle"><a href="" target="_blank">MORE</a></span>
							</div>
							<ul>
								<li>
								    <a href=""
									title="韭菜饼&脆脆肠＋酸牛奶" target="_blank">
									    <img src="<%=path%>/static/css/community/images/portal_img/myrecepy4_v.jpg" />
									    <p>韭菜饼&脆脆肠＋酸牛奶</p>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
