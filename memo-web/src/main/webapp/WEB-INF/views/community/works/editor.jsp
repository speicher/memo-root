<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>发帖－Danica World</title>
    <%@include file="/WEB-INF/views/community/header.jsp" %>
    <link href="<%=path%>/static/assets/js/libs/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <%-- <script type="text/javascript" src="<%=path%>/static/assets/js/libs/ueditor/third-party/jquery.min.js"></script> --%>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/static/assets/js/libs/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/static/assets/js/libs/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/assets/js/libs/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="<%=path%>/static/js/community/editor.js" type="text/javascript"></script>
</head>
<body onkeydown="if(event.keyCode==27) return false;">
    <%@include  file="/WEB-INF/views/community/top.jsp" %>
	<div id="wp" class="wp">
	    <div class="boardnav">
		    <div id="navi" class="bm cl">
				<div class="z">
					<a href="" class="nvhm" title="首页">Danica World</a> <em>&rsaquo;</em>
					<a href="works/index">作品</a> <em>&rsaquo;</em>
					发表帖子
				</div>
			</div>
			<form method="post" autocomplete="off" id="postform" >
			    <div id="ct" class="ct2_a ct2_a_r wp cl">
			        <div class="bm bw0 cl" id="editorbox">
						<ul class="tb cl mbw">
						</ul>
						<div id="postbox">
							<div class="pbt cl">
								<div class="z">
								    <span>标题：</span>
								    <input type="text" id="subject" name="subject" value="" class="px" tabindex="1" style="width: 25em" onkeyup="strLenCalc(this, 'checklen', 80);" onblur="" >
								    <!-- <span id="subjectchk">还可输入<strong id="checklen">80</strong>个字符</span> -->
								</div>
							</div>
							<!--style给定宽度可以影响编辑器的最终宽度-->
						    <script type="text/plain" id="myEditor" style="width:1200px;height:240px;"></script>
					    </div>
					</div>
			    </div>
			</form>
            <div class="mtm mbm pnpost">
                <input class="pn btnl" type="button" id="btn_s" onclick="submit()" value="发表贴子" />
                <input class="pn btnr" type="button" id="btn_p" onclick="savepreview()" value="保存草稿" />
            </div>
        </div>
    </div>
    <%@include  file="/WEB-INF/views/community/bottom.jsp" %>
</body>
</html>
