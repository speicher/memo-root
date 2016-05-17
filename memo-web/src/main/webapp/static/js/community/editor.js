/**
 * editor.js
 * Author:Danica
 * Date: 2016.5.14
 */
//实例化编辑器
var um;
$(document).ready(function(){
	um = UM.getEditor('myEditor', {
	    autoHeight: false
	}); 
});
//按钮的操作
function insertHtml() {
    var value = prompt('插入html代码', '');
    um.execCommand('insertHtml', value);
}
function isFocus(){
    alert(um.isFocus());
}
function doBlur(){
    um.blur();
}
function createEditor() {
    um = UM.getEditor('myEditor');
}
function getAllHtml() {
    alert(UM.getEditor('myEditor').getAllHtml());
}
function getContent() {
    var arr = [];
    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
    arr.push("内容为：");
    arr.push(UM.getEditor('myEditor').getContent());
    alert(arr.join("\n"));
}
function getPlainTxt() {
    var arr = [];
    arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
    arr.push("内容为：");
    arr.push(UM.getEditor('myEditor').getPlainTxt());
    alert(arr.join('\n'));
}
function setContent(isAppendTo) {
    var arr = [];
    arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
    UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
    alert(arr.join("\n"));
}
function setDisabled() {
    UM.getEditor('myEditor').setDisabled('fullscreen');
    disableBtn("enable");
}

function setEnabled() {
    UM.getEditor('myEditor').setEnabled();
    enableBtn();
}

function getText() {
    //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
    var range = UM.getEditor('myEditor').selection.getRange();
    range.select();
    var txt = UM.getEditor('myEditor').selection.getText();
    alert(txt);
}

function getContentTxt() {
    var arr = [];
    arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
    arr.push("编辑器的纯文本内容为：");
    arr.push(UM.getEditor('myEditor').getContentTxt());
    alert(arr.join("\n"));
}
function hasContent() {
    var arr = [];
    arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
    arr.push("判断结果为：");
    arr.push(UM.getEditor('myEditor').hasContents());
    alert(arr.join("\n"));
}
function setFocus() {
    UM.getEditor('myEditor').focus();
}
function deleteEditor() {
    UM.getEditor('myEditor').destroy();
}