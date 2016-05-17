<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>每日签到-Danica个人社区</title>
<%@include file="/WEB-INF/views/community/header.jsp" %>
<link rel="stylesheet" type="text/css" href="data/cache/style_2_plugin_k_misign.css?Ou9" />
</head>

<body id="nv_plugin" class="vr_bbs pg_k_misign" onkeydown="if(event.keyCode==27) return false;">
	<%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
		<link rel="stylesheet" type="text/css" href="./source/plugin/k_misign/static/default/sign.css" />
		<div id="pt" class="bm cl">
			<div class="y">
				<span class="xg1">今日签到之星：马守富</span> 
				<span class="pipe">|</span> 
				<span class="xg1">历史最高人数：24人</span>
				<span class="pipe">|</span>
				<span class="xg1"><a href="plugin.php?id=k_misign:misc&operation=rewardrule">奖励规则</a></span>
			</div>
			<div class="z">
				<a href="./" class="nvhm" title="首页">Danica个人社区</a><em>&raquo;</em>
				<a href="plugin.php?id=k_misign:sign">每日签到</a>
			</div>
		</div>
		<div class="wp cl">
			<div class="lineB cl">
				<div class="qdleft">
					<a id="JD_sign" href="member.php?mod=logging&amp;action=login"
						onclick="showWindow('login', this.href);return false;"
						class="btn J_chkitot"></a>
					<div class="paiming cl">
						<input type="hidden" class="hidnum" id="qiandaobtnnum" value="">
							<div class="font">您今天还没有签到</div>
							<div class="pics J_numpic cl J_animation" id="qdbn2" style="display: none;">
								<span class=""></span>
							</div>
					</div>
				</div>
				<div class="qdright">
					<div class="content">
						<h3 class="mainCon">
							<div class="user">
								<a href="home.php?mod=space&amp;uid=0" c="1"><img
									src="http://vr.qq.com/uc_server/avatar.php?uid=0&size=small" /></a>
								<a href="home.php?mod=space&amp;uid=0" c="1" class="author"></a>
							</div>
						</h3>
						<ul class="countqian cl">
							<li>
								<h4>连续签到</h4>
								<p>
									<input type="hidden" class="hidnum" id="lxdays" value="">
										<b class="pics J_numpic J_animation" style="height: 23px;"><span class=""></span> </b> <b class="qiandao">天</b>
								</p>
							</li>
							<li>
								<h4>签到等级</h4>
								<p class="lvgrade">
									<input type="hidden" class="hidnum" id="lxlevel" value="">
										<b class="pics J_numpic J_animation" style="height: 26px;"><span
											class=""></span> </b>
								</p>
							</li>
							<li>
								<h4>积分奖励</h4>
								<p>
									<input type="hidden" class="hidnum" id="lxreward" value="">
										<b class="pics J_numpic J_animation" style="height: 23px;"><span
											class=""></span> </b> <b></b>
								</p>
							</li>
							<li>
								<h4>总天数</h4>
								<p>
									<input type="hidden" class="hidnum" id="lxtdays" value="">
										<b class="pics J_numpic J_animation" style="height: 23px;"><span
											class=""></span> </b> <b>天</b>
								</p>
							</li>
						</ul>
						<div class="weather_p">
							<div class="con">
								6<span>人</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="lineC cl">
				<div class="lineC_left cl" id="ranklist"></div>
				<script>ajaxget('plugin.php?id=k_misign:sign&operation=list','ranklist');</script>
				<div class="lineC_right cl">
					<h3 class="tit">推送信息</h3>
					<ul class="photos cl">
						<li><img
							src="data/attachment/common/4c/051108x36btbktzpb7ptf7.jpg?z56M7Z"
							class="head_img" />
							<div class="info  J_info" id="J_info_1" style="bottom: -161px;">
								<h3>虚拟现实中的手势交互</h3>
								<p class="con">虚拟现实中的手势交互</p>
								<p class="link">
									访问详情<img
										src="./source/plugin/k_misign/static/default/come_11.jpg">
								</p>
							</div> <a target="_blank" href="forum.php?mod=viewthread&tid=14"
							class="J_intro mask"></a></li>
					</ul>
				</div>
			</div>
			<div class="lineD">
				<h3 class="tit">中奖用户</h3>
				<div class="content cl">
					<ul class="leftcon cl J_mifens" id="J_mifens">
					</ul>
					<div class="rewardlist" id="demo"
						style="overflow: hidden; height: 180px;">
						<div id="demo1">
							<ul class="arts J_linescroll">
								<li><span class="user">Devil丶虹翼</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">nikojin</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">V1Dvr</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">admin</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">嘟乐斯</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">马守富</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">喵视眈眈</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">vrweare</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">歌代言</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">jimmytqzhao</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">未来研究者</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">伟哥起床啦</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">魔鬼召唤</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">whitebright</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">letian0111</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">kom58</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">long_00</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">™_3f</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">艾仁丶德馨_b4</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">maven_0b</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">Orisky</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user"> Vváde_川_e1</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">9.19_c9</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Falsehood</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">一娄丁..._0b</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">四叶_82</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">silence</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">Mr.L_ba</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">Kunris</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">pony</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">759311836</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">拂晓</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">Gekkko</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Vknight</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">VR-华少</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">806801334</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">星龙剑客_20</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Patrick</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">芦苇_86</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">我是小小白</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">VR资源VRZY.COM</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">唐家三少_e0</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">duning</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Joker</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">johnny</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Ghibli</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">TPMer</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">星の尘_16</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">StevenVon</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">马新军_bd</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">@24_cc</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">TLE_53</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">leono</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">ZpF</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">张鹏飞</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">法海_32</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">不如种花</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">Kunris_ff</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">故事_83</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">星夢奇緣™_c9</span><span>获得了&nbsp;2金钱</span></li>
								<li><span class="user">无情有思_20</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">damosh</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">腾讯-fredxiong</span><span>获得了&nbsp;3金钱</span></li>
								<li><span class="user">1234</span><span>获得了&nbsp;2金钱</span></li>
							</ul>
						</div>
						<div id="demo2"></div>
					</div>
				</div>
			</div>
			<SCRIPT>
				var speed = 15;//滚动速度
				var rows = 28;//每行高度
				var stim = 80; //停留时间倍数 * speed
				var stop = 0; //初始化值，不管
				demo2.innerHTML = demo1.innerHTML
				function Marquee(){
				    if(demo.scrollTop%rows==0 && stop<=stim){
				      stop++;
				      return;
				    }
				    stop = 0;
				    if(demo2.offsetTop-demo.scrollTop<=0)
				      demo.scrollTop-=demo1.offsetHeight
				    else{
				      demo.scrollTop++
				    }
				}
				var MyMar    = setInterval(Marquee,speed)
				demo.onmouseover = function() {clearInterval(MyMar)}
				demo.onmouseout = function() {MyMar=setInterval(Marquee,speed)}
			</SCRIPT>
			<script src="./source/plugin/k_misign/static/jquery18.js" type="text/javascript"></script>
			<script type="text/javascript">
			    var jq = jQuery.noConflict();
			</script>
			<script src="./source/plugin/k_misign/static/doT.js" type="text/javascript"></script>
			<script> 
			    var mifens = {"start":0,"end":9,"data":[]}; 
			</script>
			<script id="mifen-tmpl" type="text/template">
{{ for (var i = it.start, l = it.end; i < l; i++) { }}
   <li id="mifen{{=i}}">
        <a href="{{=it.data[i].href}}" c="1" class="headimg"><img src="{{=it.data[i].head}}"></a>
        <a href="{{=it.data[i].href}}" class="author">
        {{=it.data[i].name}}</a><br>
        <span class="thing">获得了{{=it.data[i].title}}</span>
    </li>
{{ } }}
	        </script>
			<script id="mifen2-tmpl" type="text/template">
{{ for (var i = it.start, l = it.end; i < l; i++) { }}
    <a href="{{=it.data[i].href}}" c="1" class="headimg"><img src="{{=it.data[i].head}}"></a>
    <a href="{{=it.data[i].href}}" class="author">
    {{=it.data[i].name}}</a><br>
    <span class="thing">获得了{{=it.data[i].title}}</span>
{{ } }}
            </script>
			<script src="./source/plugin/k_misign/static/come.js" type="text/javascript" charset="utf-8"></script>
		</div>
	</div>
    <%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>