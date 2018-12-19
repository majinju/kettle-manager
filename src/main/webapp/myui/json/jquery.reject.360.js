jQuery(function(){
	try{
		var $option = {}; 
		/* 浏览器图片地址 */
		$option["imagePath"] = "/misc/browsers/";
		/* 阻止所有浏览器 */
		$option["reject"] = { all: true };
		/* 要显示的浏览器 */
		$option["display"] = ['chrome','firefox','safari','opera'],
		/* 浏览器提示信息 */
		$option["browserInfo"] = {
			safari: {
				text: "Apple Safari"
			},
			opera: {
				text: "Opera"
			}
		};
		/* 显示的标题 */
		$option["header"]  = "<span class=\"bold red\">红色警报</span>",
		/* 第一段文字 */
		$option["paragraph1"] = "您目前使用的浏览器有可能无法正常使用JSON工具!";
		/* 第二段文字 */
		$option["paragraph2"] = "为了不影响您的正常使用, 同时也为了方便您的开发, 我们推荐安装下列浏览器:";
		/* 关闭文字 */
		$option["closeLink"]  = "好的, 我知道了!";
		/* 关闭提醒 */
		$option["closeMessage"] = "关闭本窗口, 意味着您接受无法正常使用的可能性.";
		/* 一次会话显示一次
		$option["closeCookie"] = true; */


		/* 浏览器判断 */
		var $reject = false;
		/* 1. 判断是否为偷窥用户隐私的 360 浏览器 */
		var $browser= navigator.userAgent.toLowerCase();
		if( $browser.indexOf('360ee') !== -1 || $browser.indexOf('360se') !== -1 ){
			$reject = true;
			$option.paragraph1 = "本站不推荐您用现在的 <span class=\"bold red\">邪恶360浏览器</span>! 它将严重侵犯您的隐私!";
			$option.paragraph2 = "为了您的隐私安全, 请换用下列浏览器:";
			$option.closeLink  = "我希望隐私被泄露!";
			$option.closeMessage = "<span class=\"bold red\">关闭本窗口, 意味着您接受隐私泄露的可能性</span>.";
		}
		/* 2. 判断是否为 IE 浏览器 */
		if( $.browser.msie )
			$reject = true;
		/* 查看是否需要拒绝 */
		if( $reject )
			$.reject( $option );
	}
	catch(e){
	}
});
