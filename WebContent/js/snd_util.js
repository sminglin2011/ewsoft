/**
 * popUp layout current page, confirm to post data
 * @param title
 * @param divId
 * @param jsonParam
 * @param postUrl
 * @param json
 * @param $http
 * @returns
 */
function popUpLayout(title, divId, jsonParam, postUrl, json, $http) {
		layer.open({
			title:title,
			type: 1,
			content: $("#"+divId),btn: ['Submit']
		  	,yes: function(index, layero){
		  		var checkInput = true;
		  		$("#"+divId).find('input select').each(function(index) {
					if($(this).val() == '') checkInput = false;
				})
				console.log(checkInput, "here");
			  	if(checkInput) {
			  		var header = {'Content-Type': 'application/json; charset=UTF-8'}
			  		if (json != 'json') header = {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'};
			  		console.log(json != 'json', 'true or false', header);
			  		$http({
			  	        url: postUrl,
			  	      	method: "POST",
			          	dataType: "json",
			          	headers: header, //{ 'Content-Type': 'application/json; charset=UTF-8' }, //application/x-www-form-urlencoded; charset=UTF-8
			          	data: jsonParam
			  	    }).then(function(response) {// success
			  	    	if (response.data.status){
			  	    		layer.msg(response.data.msg, {icon: 1});
			  	    	} else {
			  	    		layer.msg(response.data.msg, {icon: 5});
			  	    	}
			  	    	setTimeout(function() { layer.closeAll(); }, 3000);
			  	    }, 
			  	    function(response) { // optional // failed
			  	    	 console.log("failed", response.data);
			  	    	 layer.msg(response.data.msg, {icon: 5});
			  	    });
			  	} else {
			  		layer.msg("Please fill in text", {icon: 5});
			  	}
		  	}//yes end
		});
}
/**
 * get current location URL parameter
 * @param paramName
 * @returns
 */
function getParamFromUrl(paramName) {
	   return (window.location.search.match(new RegExp('[?&]' + paramName + '=([^&]+)')) || [, null])[1];
}

/**
 * back to Top
 * @returns
 */
function backTop(){
 //把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数）
 window.scrollBy(0,-100);
 //延时递归调用，模拟滚动向上效果
 scrolldelay = setTimeout('backTop()',100);
 //获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值
 var sTop=document.documentElement.scrollTop+document.body.scrollTop;
 //判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面）
 if(sTop==0) clearTimeout(scrolldelay);
}

/**
 * open full window by Iframe
 * @param title
 * @param url
 * @returns
 */
function openFullWind(title, url) {
 var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}