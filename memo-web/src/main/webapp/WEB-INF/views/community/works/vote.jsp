<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发表帖子 - Danica World</title>
<%@include file="/WEB-INF/views/community/header.jsp"%>
<script src="<%=path%>/static/js/community/forum.js"
	type="text/javascript"></script>
</head>
<body id="nv_forum" class="vr_bbs pg_post"
	onkeydown="if(event.keyCode==27) return false;">
	<%@include file="/WEB-INF/views/community/top.jsp"%>
	<div id="wp" class="wp">
		<script type="text/javascript">
			var allowpostattach = parseInt('1');
			var allowpostimg = parseInt('1');
			var pid = parseInt('0');
			var tid = parseInt('0');
			var extensions = 'chm,pdf,zip,rar,tar,gz,bzip2,gif,jpg,jpeg,png';
			var imgexts = 'jpg, jpeg, gif, png';
			var postminchars = parseInt('10');
			var postmaxchars = parseInt('10000');
			var disablepostctrl = parseInt('0');
			var seccodecheck = parseInt('0');
			var secqaacheck = parseInt('0');
			var typerequired = parseInt('');
			var sortrequired = parseInt('');
			var special = parseInt('1');
			var isfirstpost = 1;
			var allowposttrade = parseInt('');
			var allowpostreward = parseInt('');
			var allowpostactivity = parseInt('');
			var sortid = parseInt('0');
			var special = parseInt('1');
			var fid = 2;
			var postaction = 'newthread';
			var ispicstyleforum = 0;
		</script>
		<script src="static/js/forum_post.js?PzP" type="text/javascript"></script>
		<div id="navi" class="bm cl">
			<div class="z">
				<a href="./" class="nvhm" title="首页">Tencent VR开发者社区</a> <em>&rsaquo;</em>
				<a href="forum.php">论坛</a> 
				<em>&rsaquo;</em> 
				<a href="forum.php?gid=1">VR论坛</a> 
				<em>&rsaquo;</em> 
				<a href="forum.php?mod=forumdisplay&fid=2">帖子</a> 
				<em>&rsaquo;</em>发起投票
			</div>
		</div>
		<form method="post" autocomplete="off" id="postform" onsubmit="return validate(this)">
			<div id="ct" class="ct2_a ct2_a_r wp cl">
				<input type="hidden" name="formhash" id="formhash" value="16b1d001" />
				<input type="hidden" name="posttime" id="posttime" value="1462785143" /> 
				<input type="hidden" name="wysiwyg" id="e_mode" value="1" /> 
				<input type="hidden" name="special" value="1" />
				<div class="bm bw0 cl">
					<ul class="tb cl mbw">
						<li>
						    <a href="javascript:;" onclick="switchpost('forum.php?mod=post&action=newthread')">发表帖子</a></li>
						<li class="a">
						    <a href="javascript:;" onclick="switchpost('forum.php?mod=post&action=newthread&special=1')">发起投票</a></li>
					</ul>
					<div id="draftlist_menu" style="display: none">
						<ul class="xl xl1">
							<li class="xi2">
							    <a href="forum.php?mod=guide&amp;view=my&amp;type=thread&amp;filter=save&amp;fid=0"
								target="_blank">查看所有草稿</a></li>
						</ul>
					</div>
					<div id="postbox">
						<div class="pbt cl">
							<div class="z">
								<span><input type="text" name="subject" id="subject"
									class="px" value="" onblur="if($('tags')){relatekw('-1','-1');doane();}"
									onkeyup="strLenCalc(this, 'checklen', 80);" style="width: 25em"
									tabindex="1" /></span> 
								<span id="subjectchk">还可输入 <strong id="checklen">80</strong> 个字符</span>
								<script type="text/javascript">
									strLenCalc($('subject'), 'checklen', 80)
								</script>
							</div>
						</div>

						<div id="attachnotice_attach" class="tbms mbm xl" style="display: none">
							您有 <span id="unusednum_attach"></span> 个未使用的附件 &nbsp; <a
								href="javascript:;" class="xi2"
								onclick="attachoption('attach', 2);" />查看</a><span class="pipe">|</span><a
								href="javascript:;" class="xi2"
								onclick="attachoption('attach', 1)">使用</a><span class="pipe">|</span><a
								href="javascript:;" class="xi2"
								onclick="attachoption('attach', 0)">删除</a>
							<div id="unusedlist_attach" style="display: none"></div>
						</div>
						<div id="attachnotice_img" class="tbms mbm xl"
							style="display: none">
							您有 <span id="unusednum_img"></span> 个未使用的图片 &nbsp; <a
								href="javascript:;" class="xi2"
								onclick="attachoption('img', 2);" />查看</a><span class="pipe">|</span><a
								href="javascript:;" class="xi2" onclick="attachoption('img', 1)">使用</a><span
								class="pipe">|</span><a href="javascript:;" class="xi2"
								onclick="attachoption('img', 0)">删除</a>
							<div id="unusedlist_img" style="display: none"></div>
						</div>

						<input type="hidden" name="polls" value="yes" />
						<div class="exfm cl">
							<div class="sinf sppoll z">
								<input type="hidden" name="fid" value="2" /> <input
									type="hidden" name="tpolloption" value="1" />
								<div class="cl">
									<h4 class="z">
										<em>选项: </em> 最多可填写 20 个选项 &nbsp; <span class="xw0"><input
											id="pollchecked" type="checkbox" class="pc"
											onclick="switchpollm(1)" /><label for="pollchecked">单框模式</label></span>
									</h4>
								</div>
								<div id="pollm_c_1" class="mbm">
									<span id="polloption_new"></span>
									<p id="polloption_hidden" style="display: none">
										<a href="javascript:;" class="d" onclick="delpolloption(this)">del</a>
										<input type="text" name="polloption[]" class="px vm"
											autocomplete="off" style="width: 290px;" tabindex="1" /> <span
											id="pollUploadProgress" class="vm" style="display: none;"></span>
										<span id="newpoll" class="vm"></span>
									</p>
									<p>
										<a href="javascript:;" onclick="addpolloption()">+增加一项</a>
									</p>
								</div>
								<div id="pollm_c_2" class="mbm" style="display: none">
									<textarea name="polloptions" class="pt" style="width: 340px;"
										tabindex="1" rows="6" onchange="switchpollm(0)" />
									</textarea>
									<p class="cl">每行填写 1 个选项</p>
								</div>
							</div>
							<div class="sadd z">
								<p class="mbn">
									<label for="maxchoices">最多可选</label> <input type="text"
										name="maxchoices" id="maxchoices" class="px pxs" value="1"
										tabindex="1" /> 项
								</p>
								<p class="mbn">
									<label for="polldatas">记票天数</label> <input type="text"
										name="expiration" id="polldatas" class="px pxs" value=""
										tabindex="1" /> 天
								</p>
								<p class="mbn">
									<input type="checkbox" name="visibilitypoll"
										id="visibilitypoll" class="pc" value="1" tabindex="1" /><label
										for="visibilitypoll">投票后结果可见</label>
								</p>
								<p class="mbn">
									<input type="checkbox" name="overt" id="overt" class="pc"
										value="1" tabindex="1" /><label for="overt">公开投票参与人</label>
								</p>
							</div>
						</div>
<script src="static/js/upload.js?PzP" type="text/javascript"></script>
<script type="text/javascript" reload="1">
var maxoptions = parseInt('20');
var curoptions = 0;
var curnumber = 1;
addpolloption();
addpolloption();
addpolloption();
function addUploadEvent(imgid, pollstr) {
new SWFUpload({
				upload_url : SITEURL
						+ 'misc.php?mod=swfupload&action=swfupload&operation=poll&fid=2',
				post_params : {
					"uid" : "308",
					"hash" : "bdfc3fdd8827c90231f460482bc9587e"
				},

				file_size_limit : "2048",
				file_types : "*.jpg;*.jpeg;*.gif;*.png;*.bmp",
				file_types_description : "图片文件",
				file_upload_limit : 0,
				file_queue_limit : 1,

				swfupload_preload_handler : preLoad,
				swfupload_load_failed_handler : loadFailed,
				file_dialog_start_handler : fileDialogStart,
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,

				button_image_url : IMGDIR
						+ "/uploadbutton_small_pic.png",
				button_placeholder_id : imgid,
				button_width : 26,
				button_height : 26,
				button_cursor : SWFUpload.CURSOR.HAND,
				button_window_mode : "transparent",

				custom_settings : {
					progressTarget : pollstr,
					uploadSource : 'forum',
					uploadType : 'poll'
				},

				debug : false
			});
}
</script>
						<div id="e_body_loading">
							<img src="static/image/common/loading.gif" width="16" height="16" class="vm" /> 请稍后 ...
						</div>
						<div class="edt" id="e_body" style="display: none">
							<div id="e_controls" class="bar">
								<div class="y">
									<div class="b2r nbl nbr" id="e_adv_5">
										<p><a id="e_undo" title="撤销">Undo</a></p>
										<p><a id="e_redo" title="重做">Redo</a></p>
									</div>
									<div class="z">
										<span class="mbn">
										    <a id="e_fullswitcher"></a>
										    <a id="e_simple"></a>
										</span> 
										<label id="e_switcher" class="bar_swch ptn">
										    <input id="e_switchercheck" type="checkbox" class="pc" name="checkbox" value="0"
											onclick="switchEditor(this.checked?0:1)" />纯文本</label>
									</div>
								</div>
								<div id="e_button" class="btn cl">
									<div class="b2r nbr nbl" id="e_adv_s2">
										<a id="e_fontname" class="dp" title="设置字体" menupos="43!"><span
											id="e_font">字体</span></a> <a id="e_fontsize" class="dp"
											title="设置文字大小" menupos="43!" menuwidth="25"><span
											id="e_size">大小</span></a> <span id="e_adv_1"> <a
											id="e_inserthorizontalrule" title="分隔线">Hr</a> <br />
										</span> <a id="e_bold" title="文字加粗">B</a> <a id="e_italic"
											title="文字斜体">I</a> <a id="e_underline" title="文字加下划线">U</a> <a
											id="e_forecolor" title="设置文字颜色">Color</a> <a id="e_backcolor"
											title="设置文字背景色">BgColor</a> <a id="e_url" title="添加链接">Url</a>
										<span id="e_adv_8"> <a id="e_unlink" title="移除链接">Unlink</a>
										</span>
									</div>
									<div class="b2r nbl" id="e_adv_2">
										<p id="e_adv_3">
											<a id="e_tbl" title="添加表格">Table</a>
										</p>
										<p>
											<a id="e_removeformat" title="清除文本格式">Removeformat</a>
										</p>
									</div>
									<div class="b2r">
										<p>
											<a id="e_autotypeset" title="自动排版">Autotypeset</a> <a
												id="e_justifyleft" title="居左">Left</a> <a
												id="e_justifycenter" title="居中">Center</a> <a
												id="e_justifyright" title="居右">Right</a>
										</p>
										<p id="e_adv_4">
											<a id="e_floatleft" title="左浮动">FloatLeft</a> <a
												id="e_floatright" title="右浮动">FloatRight</a> <a
												id="e_insertorderedlist" title="排序的列表">Orderedlist</a> <a
												id="e_insertunorderedlist" title="未排序列表">Unorderedlist</a>
										</p>
									</div>
									<div class="b1r" id="e_adv_s1">
										<a id="e_sml" title="添加表情">表情</a>
										<div id="e_imagen" style="display: none">!</div>
										<a id="e_image" title="添加图片" menupos="00" menuwidth="600">图片</a>
										<div id="e_attachn" style="display: none">!</div>
										<a id="e_attach" title="添加附件" menupos="00" menuwidth="600">附件</a>
									</div>
									<div class="b2r esb" id="e_adv_s3">
										<a id="e_quote" title="添加引用文字">引用</a> <a id="e_code"
											title="添加代码文字">代码</a> <a id="e_free" adv="1" title="添加免费信息">Free</a>
										<a id="e_pasteword" adv="1" title="从 Word 粘贴内容">Word 粘贴</a> <a
											id="e_page" adv="1" title="分页">Page</a> <a id="e_index"
											adv="1" title="目录">Index</a> <a id="e_password" adv="1"
											title="帖子密码">Password</a> <a id="e_postbg" adv="1"
											title="帖子背景">Background</a> <a id="e_cst1_qq" class="cst"
											title="显示 QQ 在线状态，点这个图标可以和他（她）聊天"><img
											src="static/image/common/bb_qq.gif"
											title="显示 QQ 在线状态，点这个图标可以和他（她）聊天" alt="qq" /></a>
									</div>
								</div>
							</div>

							<div id="rstnotice" class="ntc_l bbs" style="display: none">
								<a href="javascript:;" title="清除内容" class="d y"
									onclick="userdataoption(0)">close</a>您有上次未提交成功的数据 <a
									class="xi2" href="javascript:;" onclick="userdataoption(1)"><strong>恢复数据</strong></a>
							</div>

							<div class="area">
								<textarea name="message" id="e_textarea" class="pt" rows="15" tabindex="2"></textarea>
							</div>
							<link rel="stylesheet" type="text/css"
								href='data/cache/style_2_editor.css?PzP' />
							<script src="static/js/editor.js?PzP" type="text/javascript"></script>
							<script src="static/js/bbcode.js?PzP" type="text/javascript"></script>
							<script src="static/js/common_postimg.js?PzP"
								type="text/javascript"></script>
							<script type="text/javascript">
								var editorid = 'e';
								var textobj = $(editorid + '_textarea');
								var wysiwyg = (BROWSER.ie || BROWSER.firefox || (BROWSER.opera >= 9))
										&& parseInt('1') == 1 ? 1 : 0;
								var allowswitcheditor = parseInt('1');
								var allowhtml = parseInt('0');
								var allowsmilies = parseInt('1');
								var allowbbcode = parseInt('1');
								var allowimgcode = parseInt('1');
								var simplodemode = parseInt('1');
								var fontoptions = new Array("宋体", "新宋体", "黑体",
										"微软雅黑", "Arial", "Verdana", "simsun",
										"Helvetica", "Trebuchet MS", "Tahoma",
										"Impact", "Times New Roman",
										"仿宋,仿宋_GB2312", "楷体,楷体_GB2312");
								var smcols = 8;
								var custombbcodes = new Array();
								custombbcodes["qq"] = {
									'prompt' : '请输入 QQ 号码:<a href="" class="xi2" onclick="this.href=\'http://wp.qq.com/set.html?from=discuz&uin=\'+$(\'e_cst1_qq_param_1\').value" target="_blank" style="float:right;">设置QQ在线状态&nbsp;&nbsp;</a>'
								};
							</script>

							<div id="e_bbar" class="bbar">
								<em id="e_tip"></em> <span id="e_svdsecond"></span> <a
									href="javascript:;" onclick="discuzcode('svd');return false;"
									id="e_svd">保存数据</a> | <a href="javascript:;"
									onclick="discuzcode('rst');return false;" id="e_rst">恢复数据</a>
								&nbsp;&nbsp; <a href="javascript:;"
									onclick="discuzcode('chck');return false;" id="e_chck">字数检查</a>
								| <a href="javascript:;"
									onclick="discuzcode('tpr');return false;" id="e_tpr">清除内容</a>
								&nbsp;&nbsp; <span id="e_resize"><a href="javascript:;"
									onclick="editorsize('+');return false;">加大编辑框</a> | <a
									href="javascript:;" onclick="editorsize('-');return false;">缩小编辑框</a><img
									src="static/image/editor/resize.gif"
									onmousedown="editorresize(event)" /></span>
							</div>
						</div>
						<div id="post_extra" class="ptm cl">
							<div id="post_extra_tb" class="cl" onselectstart="return false">
								<label id="extra_additional_b"
									onclick="showExtra('extra_additional')"><span
									id="extra_additional_chk">附加选项</span></label>
							</div>

							<div id="post_extra_c">

								<div class="exfm cl" id="extra_additional_c"
									style="display: none;">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="xw1" valign="top">基本属性</td>
											<td><label for="hiddenreplies"><input
													type="checkbox" name="hiddenreplies" id="hiddenreplies"
													class="pc" value="1">回帖仅作者可见</label> <label for="ordertype"><input
													type="checkbox" name="ordertype" id="ordertype" class="pc"
													value="1" />回帖倒序排列</label> <label for="allownoticeauthor"><input
													type="checkbox" name="allownoticeauthor"
													id="allownoticeauthor" class="pc" value="1"
													checked="checked" />接收回复通知</label> <label for="usesig"><input
													type="checkbox" name="usesig" id="usesig" class="pc"
													value="1" checked="checked" />使用个人签名</label></td>
										</tr>
										<tr>
											<td class="xw1" valign="top">文本特性</td>
											<td><label for="htmlon"><input type="checkbox"
													name="htmlon" id="htmlon" class="pc" value="0"
													disabled="disabled" />HTML 代码</label> <label for="allowimgcode"><input
													type="checkbox" id="allowimgcode" class="pc"
													disabled="disabled" checked="checked" />[img] 代码</label> <label
												for="allowimgurl"><input type="checkbox"
													id="allowimgurl" class="pc" checked="checked" />解析图片链接</label> <label
												for="parseurloff"><input type="checkbox"
													name="parseurloff" id="parseurloff" class="pc" value="1" />禁用链接识别</label>
												<label for="smileyoff"><input type="checkbox"
													name="smileyoff" id="smileyoff" class="pc" value="1" />禁用表情</label>
												<label for="bbcodeoff"><input type="checkbox"
													name="bbcodeoff" id="bbcodeoff" class="pc" value="1" />禁用编辑器代码</label>
												<label for="imgcontent"><input type="checkbox"
													name="imgcontent" id="imgcontent" class="pc" value="0"
													disabled="disabled" />内容生成图片</label></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div id="seccheck"></div>
						<div class="mtm mbm pnpost">
							<a href="home.php?mod=spacecp&amp;ac=credit&amp;op=rule&amp;fid=2"
								class="y" target="_blank">本版积分规则</a>
							<button type="submit" id="postsubmit" class="pn pnc" value="true"
								name="topicsubmit">
								<span>发起投票</span>
							</button>
							<input type="hidden" id="postsave" name="save" value="" />
							<button type="button" id="postsubmit" class="pn" value="true"
								onclick="$('postsave').value = 1;$('postsubmit').click();">
								<em>保存草稿</em>
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<iframe name="ajaxpostframe" id="ajaxpostframe" style="display: none;"></iframe>
		<div id="e_menus" class="editorrow"
			style="overflow: hidden; margin-top: -5px; height: 0; border: none; background: transparent;">
			<div id="e_editortoolbar" class="editortoolbar">
				<div class="p_pop fnm" id="e_fontname_menu" style="display: none">
					<ul unselectable="on">
						<li onclick="discuzcode('fontname', '宋体')" style="font-family: 宋体"
							unselectable="on"><a href="javascript:;" title="宋体">宋体</a></li>
						<li onclick="discuzcode('fontname', '新宋体')"
							style="font-family: 新宋体" unselectable="on"><a
							href="javascript:;" title="新宋体">新宋体</a></li>
						<li onclick="discuzcode('fontname', '黑体')" style="font-family: 黑体"
							unselectable="on"><a href="javascript:;" title="黑体">黑体</a></li>
						<li onclick="discuzcode('fontname', '微软雅黑')"
							style="font-family: 微软雅黑" unselectable="on"><a
							href="javascript:;" title="微软雅黑">微软雅黑</a></li>
						<li onclick="discuzcode('fontname', 'Arial')"
							style="font-family: Arial" unselectable="on"><a
							href="javascript:;" title="Arial">Arial</a></li>
						<li onclick="discuzcode('fontname', 'Verdana')"
							style="font-family: Verdana" unselectable="on"><a
							href="javascript:;" title="Verdana">Verdana</a></li>
						<li onclick="discuzcode('fontname', 'simsun')"
							style="font-family: simsun" unselectable="on"><a
							href="javascript:;" title="simsun">simsun</a></li>
						<li onclick="discuzcode('fontname', 'Helvetica')"
							style="font-family: Helvetica" unselectable="on"><a
							href="javascript:;" title="Helvetica">Helvetica</a></li>
						<li onclick="discuzcode('fontname', 'Trebuchet MS')"
							style="font-family: Trebuchet MS" unselectable="on"><a
							href="javascript:;" title="Trebuchet MS">Trebuchet MS</a></li>
						<li onclick="discuzcode('fontname', 'Tahoma')"
							style="font-family: Tahoma" unselectable="on"><a
							href="javascript:;" title="Tahoma">Tahoma</a></li>
						<li onclick="discuzcode('fontname', 'Impact')"
							style="font-family: Impact" unselectable="on"><a
							href="javascript:;" title="Impact">Impact</a></li>
						<li onclick="discuzcode('fontname', 'Times New Roman')"
							style="font-family: Times New Roman" unselectable="on"><a
							href="javascript:;" title="Times New Roman">Times New Roman</a></li>
						<li onclick="discuzcode('fontname', '仿宋,仿宋_GB2312')"
							style="font-family: 仿宋, 仿宋_GB2312" unselectable="on"><a
							href="javascript:;" title="仿宋,仿宋_GB2312">仿宋,仿宋_GB2312</a></li>
						<li onclick="discuzcode('fontname', '楷体,楷体_GB2312')"
							style="font-family: 楷体, 楷体_GB2312" unselectable="on"><a
							href="javascript:;" title="楷体,楷体_GB2312">楷体,楷体_GB2312</a></li>
					</ul>
				</div>
				<div class="p_pop fszm" id="e_fontsize_menu" style="display: none">
					<ul unselectable="on">
						<li onclick="discuzcode('fontsize', 1)" unselectable="on"><a
							href="javascript:;" title="1"><font size="1"
								unselectable="on">1</font></a></li>
						<li onclick="discuzcode('fontsize', 2)" unselectable="on"><a
							href="javascript:;" title="2"><font size="2"
								unselectable="on">2</font></a></li>
						<li onclick="discuzcode('fontsize', 3)" unselectable="on"><a
							href="javascript:;" title="3"><font size="3"
								unselectable="on">3</font></a></li>
						<li onclick="discuzcode('fontsize', 4)" unselectable="on"><a
							href="javascript:;" title="4"><font size="4"
								unselectable="on">4</font></a></li>
						<li onclick="discuzcode('fontsize', 5)" unselectable="on"><a
							href="javascript:;" title="5"><font size="5"
								unselectable="on">5</font></a></li>
						<li onclick="discuzcode('fontsize', 6)" unselectable="on"><a
							href="javascript:;" title="6"><font size="6"
								unselectable="on">6</font></a></li>
						<li onclick="discuzcode('fontsize', 7)" unselectable="on"><a
							href="javascript:;" title="7"><font size="7"
								unselectable="on">7</font></a></li>
					</ul>
				</div>
			</div>

			<script type="text/javascript">
				smilies_show('smiliesdiv', 8, editorid + '_');
				showHrBox(editorid + '_inserthorizontalrule');
				showHrBox(editorid + '_postbg', 'postbg');
			</script>

			<script type="text/javascript">
				function switchImagebutton(btn) {
					switchButton(btn, 'image');
					$(editorid + '_image_menu').style.height = '';
					doane();
				}
				function switchAttachbutton(btn) {
					switchButton(btn, 'attach');
					doane();
				}
			</script>
			<div class="p_pof" id="e_image_menu" style="display: none"
				unselectable="on">
				<table width="100%" cellpadding="0" cellspacing="0" class="fwin">
					<tr>
						<td class="t_l"></td>
						<td class="t_c"></td>
						<td class="t_r"></td>
					</tr>
					<tr>
						<td class="m_l">&nbsp;&nbsp;</td>
						<td class="m_c"><div class="mtm">
								<ul class="tb tb_s cl" id="e_image_ctrl"
									style="margin-top: 0; margin-bottom: 0;">
									<li class="y"><span class="flbc"
										onclick="hideAttachMenu('image')">关闭</span></li>
									<li class="current" id="e_btn_imgattachlist"><a
										href="javascript:;" hidefocus="true"
										onclick="switchImagebutton('imgattachlist');">上传图片</a></li>
									<li id="e_btn_local" style="display: none;"
										did="e_btn_imgattachlist|local"><a href="javascript:;"
										hidefocus="true" onclick="switchImagebutton('local');">普通上传</a></li>
									<li id="e_btn_www"><a href="javascript:;" hidefocus="true"
										onclick="switchImagebutton('www');">网络图片</a></li>

								</ul>
								<div unselectable="on" id="e_www" style="display: none;">
									<div class="p_opt popupfix">
										<table cellpadding="0" cellspacing="0" width="100%">
											<tr class="xg1">
												<th width="74%" class="pbn">请输入图片地址</th>
												<th width="13%" class="pbn">宽(可选)</th>
												<th width="13%" class="pbn">高(可选)</th>
											</tr>
											<tr>
												<td><input type="text" id="e_image_param_1"
													onchange="loadimgsize(this.value)" style="width: 95%;"
													value="" class="px" autocomplete="off" /></td>
												<td><input id="e_image_param_2" size="3" value=""
													class="px p_fre" autocomplete="off" /></td>
												<td><input id="e_image_param_3" size="3" value=""
													class="px p_fre" autocomplete="off" /></td>
											</tr>
										</table>
									</div>
									<div class="o">
										<button type="button" class="pn pnc" id="e_image_submit">
											<strong>提交</strong>
										</button>
									</div>
								</div>

								<div unselectable="on" id="e_local" style="display: none;">
									<div class="p_opt">
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tbody id="imgattachbodyhidden" style="display: none">
												<tr>
													<td class="atnu"><span id="imglocalno[]"><img
															src="static/image/filetype/common_new.gif" /></span></td>
													<td class="atna"><span id="imgdeschidden[]"
														style="display: none"> <span id="imglocalfile[]"></span>
													</span> <input type="hidden" name="imglocalid[]" /></td>
													<td class="attc"><span id="imgcpdel[]"></span></td>
												</tr>
											</tbody>
										</table>
										<div class="p_tbl">
											<table cellpadding="0" cellspacing="0"
												summary="post_attachbody" border="0" width="100%">
												<tbody id="imgattachbody"></tbody>
											</table>
										</div>
										<div class="upbk pbm bbda">
											<div id="imgattachbtnhidden" style="display: none">
												<span><form name="imgattachform" id="imgattachform"
														method="post" autocomplete="off"
														action="misc.php?mod=swfupload&amp;operation=upload&amp;simple=1&amp;type=image"
														target="attachframe" enctype="multipart/form-data">
														<input type="hidden" name="uid" value="308"><input
															type="hidden" name="hash"
															value="bdfc3fdd8827c90231f460482bc9587e"><input
																type="file" name="Filedata" size="45" class="filedata" />
													</form></span>
											</div>
											<div id="imgattachbtn" class="ptm pbn"></div>
											<p id="imguploadbtn">
												<button class="pn pnc vm" type="button"
													onclick="uploadAttach(0, 0, 'img')">
													<span>上传</span>
												</button>
												<span class="xg1">&larr;选择完文件后请点击“上传”按钮</span>
											</p>
											<p id="imguploading" style="display: none;">
												<img src="static/image/common/uploading.gif"
													style="vertical-align: middle;" /> 上传中，请稍候，您可以<a
													href="javascript:;" onclick="hideMenu()">暂时关闭这个小窗口</a>，上传完成后您会收到通知
											</p>
										</div>
										<div class="notice upnf">
											文件尺寸: <span class="xi1">小于 1000KB </span> , 可用扩展名: <span
												class="xi1">jpg, jpeg, gif, png</span>&nbsp;
										</div>
									</div>
									<div class="o">
										<button onclick="hideAttachMenu('image')" class="pn pnc">
											<strong>确定</strong>
										</button>
									</div>
								</div>
								<div unselectable="on" id="e_imgattachlist">
									<div class="p_opt">
										<div class="pbm bbda cl">
											<div id="imgattach_notice" class="y" style="display: none">
											</div>
											<span id="imgSpanButtonPlaceholder"></span>
										</div>
										<div class="upfilelist upfl bbda">
											<div id="imgattachlist"></div>
											<div id="unusedimgattachlist"></div>
											<div class="fieldset flash" id="imgUploadProgress"></div>

											<script type="text/javascript">
												function createNewAlbum() {
													var inputObj = $('newalbum');
													if (inputObj.value == ''
															|| inputObj.value == '请输入相册名称') {
														inputObj.value = '请输入相册名称';
													} else {
														var x = new Ajax();
														x.get('home.php?mod=misc&ac=ajax&op=createalbum&inajax=1&name=' + inputObj.value,
															function(
																	s) {
																var aid = parseInt(s);
																var albumList = $('uploadalbum');
																var haveoption = false;
																for (var i = 0; i < albumList.options.length; i++) {
																	if (albumList.options[i].value == aid) {
																		albumList.selectedIndex = i;
																		haveoption = true;
																		break;
																	}
																}
																if (!haveoption) {
																	var oOption = document
																			.createElement("OPTION");
																	oOption.text = trim(inputObj.value);
																	oOption.value = aid;
																	albumList.options
																			.add(oOption);
																	albumList.selectedIndex = albumList.options.length - 1;
																}
																inputObj.value = '';
															});
														selectCreateTab(1);
													}
												}
												function selectCreateTab(flag) {
													var vwObj = $('uploadPanel');
													var opObj = $('createalbum');
													var selObj = $('uploadalbum');
													if (flag) {
														vwObj.style.display = '';
														opObj.style.display = 'none';
														selObj.value = selObj.options[0].value;
													} else {
														vwObj.style.display = 'none';
														opObj.style.display = '';
													}
												}
											</script>
										</div>
										<div class="notice upnf">
											点击图片添加到帖子内容中 <br />文件尺寸: <span class="xi1">小于 1000KB
											</span> , 可用扩展名: <span class="xi1">jpg, jpeg, gif, png</span>&nbsp;
										</div>
									</div>
									<div class="o">
										<button onclick="hideAttachMenu('image')" class="pn pnc">
											<strong>确定</strong>
										</button>
									</div>
								</div>
							</div></td>
						<td class="m_r"></td>
					</tr>
					<tr>
						<td class="b_l"></td>
						<td class="b_c"></td>
						<td class="b_r"></td>
					</tr>
				</table>
			</div>

			<div class="p_pof upf" id="e_attach_menu" style="display: none"
				unselectable="on">
				<table width="100%" cellpadding="0" cellspacing="0" class="fwin">
					<tr>
						<td class="t_l"></td>
						<td class="t_c"></td>
						<td class="t_r"></td>
					</tr>
					<tr>
						<td class="m_l">&nbsp;&nbsp;</td>
						<td class="m_c"><div class="mtm">
								<ul class="tb tb_s cl" id="e_attach_ctrl"
									style="margin-top: 0; margin-bottom: 0;">
									<li class="y"><span class="flbc"
										onclick="hideAttachMenu('attach')">关闭</span></li>
									<li class="current" id="e_btn_attachlist"><a
										href="javascript:;" hidefocus="true"
										onclick="switchAttachbutton('attachlist');">上传附件</a></li>
									<li id="e_btn_upload" style="display: none;"
										did="e_btn_attachlist|upload"><a href="javascript:;"
										hidefocus="true" onclick="switchAttachbutton('upload');">普通上传</a></li>
								</ul>

								<div class="p_opt" unselectable="on" id="e_upload"
									style="display: none;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tbody id="attachbodyhidden" style="display: none">
											<tr>
												<td class="atnu"><span id="localno[]"><img
														src="static/image/filetype/common_new.gif" /></span></td>
												<td class="atna"><span id="deschidden[]"
													style="display: none"> <span id="localfile[]"></span>
												</span> <input type="hidden" name="localid[]" /></td>
												<td class="attc"><span id="cpdel[]"></span></td>
											</tr>
										</tbody>
									</table>
									<div class="p_tbl">
										<table cellpadding="0" cellspacing="0"
											summary="post_attachbody" border="0" width="100%">
											<tbody id="attachbody"></tbody>
										</table>
									</div>
									<div class="upbk pbm bbda">
										<div id="attachbtnhidden" style="display: none">
											<span><form name="attachform" id="attachform"
													method="post" autocomplete="off"
													action="misc.php?mod=swfupload&amp;operation=upload&amp;simple=1"
													target="attachframe" enctype="multipart/form-data">
													<input type="hidden" name="uid" value="308"><input
														type="hidden" name="hash"
														value="bdfc3fdd8827c90231f460482bc9587e"><input
															type="file" name="Filedata" size="45" class="fldt" />
												</form></span>
										</div>
										<div id="attachbtn" class="ptm pbn"></div>
										<p id="uploadbtn">
											<button type="button" class="pn pnc vm"
												onclick="uploadAttach(0, 0)">
												<span>上传</span>
											</button>
											<span class="xg1">&larr;选择完文件后请点击“上传”按钮</span>
										</p>
										<p id="uploading" style="display: none;">
											<img src="static/image/common/uploading.gif"
												style="vertical-align: middle;" /> 上传中，请稍候，您可以<a
												href="javascript:;" onclick="hideMenu()">暂时关闭这个小窗口</a>，上传完成后您会收到通知
										</p>
									</div>
									<div class="notice upnf">
										文件尺寸: <span class="xi1">小于 1000KB </span> , 可用扩展名: <span
											class="xi1">chm,pdf,zip,rar,tar,gz,bzip2,gif,jpg,jpeg,png</span>&nbsp;
									</div>
								</div>


								<div class="p_opt post_tablelist" unselectable="on"
									id="e_attachlist">
									<div class="pbm bbda">
										<span id="spanButtonPlaceholder"></span>
									</div>
									<table cellpadding="0" cellspacing="0" border="0" width="100%"
										id="attach_tblheader" class="mtn bbs" style="display: none">
										<tr>
											<td class="atnu"></td>
											<td class="atna pbn">文件名 ( <a
												onclick="insertAllAttachTag();return false;"
												href="javascript:;" class="xi2">插入全部附件</a> )
											</td>
											<td class="atds pbn">描述</td>
											<td class="attc"></td>
										</tr>
									</table>
									<div class="upfl">
										<div id="attachlist"></div>
										<div id="unusedattachlist"></div>

										<div class="fieldset flash" id="fsUploadProgress"></div>

									</div>
									<div class="notice upnf">
										<p id="attach_notice" style="display: none">点击附件文件名添加到帖子内容中</p>
										文件尺寸: <span class="xi1">小于 1000KB </span> , 可用扩展名: <span
											class="xi1">chm,pdf,zip,rar,tar,gz,bzip2,gif,jpg,jpeg,png</span>&nbsp;
									</div>
								</div>
							</div>
							<div class="o">
								<button onclick="hideAttachMenu('attach')" class="pn pnc"
									id="attach_confirms">
									<strong>确定</strong>
								</button>
							</div></td>
						<td class="m_r"></td>
					</tr>
					<tr>
						<td class="b_l"></td>
						<td class="b_c"></td>
						<td class="b_r"></td>
					</tr>
				</table>
			</div>

			<iframe name="attachframe" id="attachframe" style="display: none;"
				onload="uploadNextAttach();"></iframe>

<script type="text/javascript">
if(wysiwyg) {
newEditor(1, bbcode2html(textobj.value));
} else {
newEditor(0, textobj.value);
}
editorsimple();

var ATTACHNUM = {'imageused':0,'imageunused':0,'attachused':0,'attachunused':0}, ATTACHUNUSEDAID = new Array(), IMGUNUSEDAID = new Array();
ATTACHNUM['imageused'] = 0;
switchImagebutton('multi');

ATTACHNUM['attachused'] = 0;
switchAttachbutton('swfupload');
setCaretAtEnd();
if(BROWSER.ie >= 5 || BROWSER.firefox >= '2') {
_attachEvent(window, 'beforeunload', unloadAutoSave);
}
loadData(1);
$(editorid + '_switchercheck').checked = !wysiwyg;
</script>
		</div>
<script src="static/js/calendar.js?PzP" type="text/javascript"></script>
<script type="text/javascript">
var imgUpload = new SWFUpload({
upload_url: "http://vr.qq.com/misc.php?mod=swfupload&action=swfupload&operation=upload&fid=2",
post_params: {"uid" : "308", "hash":"bdfc3fdd8827c90231f460482bc9587e", "type":"image"},
file_size_limit : "1000",
file_types : "*.jpg;*.jpeg;*.gif;*.png",
file_types_description : "Image File",
file_upload_limit : 0,
file_queue_limit : 0,
swfupload_preload_handler : preLoad,
swfupload_load_failed_handler : loadFailed,
file_dialog_start_handler : fileDialogStart,
file_queued_handler : fileQueued,
file_queue_error_handler : fileQueueError,
file_dialog_complete_handler : fileDialogComplete,
upload_start_handler : uploadStart,
upload_progress_handler : uploadProgress,
upload_error_handler : uploadError,
upload_success_handler : uploadSuccess,
upload_complete_handler : uploadComplete,
button_image_url : "static/image/common/uploadbutton.png",
button_placeholder_id : "imgSpanButtonPlaceholder",
button_width: 100,
button_height: 25,
button_cursor:SWFUpload.CURSOR.HAND,
button_window_mode: "transparent",
custom_settings : {
progressTarget : "imgUploadProgress",
uploadSource: 'forum',
uploadType: 'image',
imgBoxObj: $('imgattachlist'),
singleUpload: $('e_btn_local')
},
debug: false
});
var upload = new SWFUpload({
upload_url: "http://vr.qq.com/misc.php?mod=swfupload&action=swfupload&operation=upload&fid=2",
post_params: {"uid":"308", "hash":"bdfc3fdd8827c90231f460482bc9587e"},
file_size_limit : "1000",
file_types : "*.chm;*.pdf;*.zip;*.rar;*.tar;*.gz;*.bzip2;*.gif;*.jpg;*.jpeg;*.png",
file_types_description : "All Support Formats",
file_upload_limit : 0,
file_queue_limit : 0,
swfupload_preload_handler : preLoad,
swfupload_load_failed_handler : loadFailed,
file_dialog_start_handler : fileDialogStart,
file_queued_handler : fileQueued,
file_queue_error_handler : fileQueueError,
file_dialog_complete_handler : fileDialogComplete,
upload_start_handler : uploadStart,
upload_progress_handler : uploadProgress,
upload_error_handler : uploadError,
upload_success_handler : uploadSuccess,
upload_complete_handler : uploadComplete,
button_image_url : "static/image/common/uploadbutton.png",
button_placeholder_id : "spanButtonPlaceholder",
button_width: 100,
button_height: 25,
button_cursor:SWFUpload.CURSOR.HAND,
button_window_mode: "transparent",
custom_settings : {
progressTarget : "fsUploadProgress",
uploadSource: 'forum',
uploadType: 'attach',
singleUpload: $('e_btn_upload')
},

debug: false
});
</script>
<script type="text/javascript">
var editorsubmit = $('postsubmit');
var editorform = $('postform');
function switchpost(href) {
editchange = false;
saveData(1);
location.href = href + '&fid=2&cedit=yes&extra=';
doane();
}

addAttach();addAttach('img');
(function () {
var oSubjectbox = $('subjectbox'),
oSubject = $('subject'),
oTextarea = $('e_textarea'),
sLen = 0;
if(oSubjectbox) {
if(oTextarea && oTextarea.style.display == '') {
oTextarea.focus();
}
} else if(oSubject) {
if(BROWSER.chrome) {
sLen = oSubject.value.length;
oSubject.setSelectionRange(sLen, sLen);
}
oSubject.focus();
}
})();
</script>
	</div>
	<%@include file="/WEB-INF/views/community/bottom.jsp"%>
</body>
</html>
