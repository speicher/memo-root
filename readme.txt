ui.js 引入的
jquery.min.js 必须是 v1.8.3
因为报错：$.browser is undefined
jQuery 从 1.9 版开始，移除了 $.browser 和 $.browser.version ， 取而代之的是 $.support 。 
在更新的 2.0 版本中，将不再支持 IE 6/7/8。 以后，如果用户需要支持 IE 6/7/8，只能使用 jQuery 1.9。