<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	/* _attachEvent(window, 'load', getForbiddenFormula, document);
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
	} */
</script>
<script type='text/javascript'>
	/* var urlRetry = SITEURL + 'plugin.php?id=security:job';
	var ajaxRetry = new Ajax();
	ajaxRetry.post(urlRetry, 'formhash=09a2169c', function(s) {
	}); */
</script>
<div id="ft" class=" cl">
	<div id="flk" class=" wp">
		<p>
			<a href="">首页</a>
			<a href="myWork">作品</a>
			<a href="forume">论坛</a>
		</p>
		<p class="xs0">Copyright©2016 Danica Personal. All Rights Reserved.</p>
	</div>
</div>
<div id="scrolltop">
	<span hidefocus="true">
	    <a title="返回顶部" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a>
	</span>
</div>
<script type="text/javascript">
	_attachEvent(window, 'scroll', function() {
		showTopLink();
	});
	checkBlind();
</script>