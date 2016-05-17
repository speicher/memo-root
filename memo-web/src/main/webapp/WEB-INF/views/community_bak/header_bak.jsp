<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<base href="<%=path%>/community/" />
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/community/style_2_common.css" />
<script src="<%=path%>/static/js/community/common.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/community/portal.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/community/pc_css.css" />
<script src="<%=path%>/static/js/community/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
	var STYLEID = '2', 
	STATICURL = '<%=path%>/static/', 
	IMGDIR = '<%=path%>/static/css/community/images/', 
//	VERHASH = 'Ou9', 
	charset = 'utf-8', 
	discuz_uid = '0', 
	cookiepre = 'yxct_2132_', 
	cookiedomain = '', 
	cookiepath = '/', 
	showusercard = '1', 
	attackevasive = '0', 
	disallowfloat = 'newthread', 
//	creditnotice = '1|威望|,2|金钱|,3|贡献|', 
	defaultstyle = '', 
	REPORTURL = 'aHR0cDovL3ZyLnFxLmNvbS8=', 
	SITEURL = '<%=path%>/community/', 
	JSPATH = '<%=path%>/static/js/community/', 
	CSSPATH = '<%=path%>/static/css/community', 
	DYNAMICURL = '';
</script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		var h = jQuery(window).height();
		var ht = h - 271;
		jQuery("#wp").css("min-height", ht + 'px');
	});
</script>