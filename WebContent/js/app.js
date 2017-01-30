var app = angular.module("app",[]);
app.directive("myTable", function() {
	return function(scope, element, attrs) {
        // apply DataTable options, use defaults if none specified by user
        var options = {};
        if (attrs.myTable.length > 0) {
            options = scope.$eval(attrs.myTable);
        } else {
            options = {
                "bStateSave": true,
                "iCookieDuration": 2419200, /* 1 month */
                "bJQueryUI": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bFilter": false,
                "bInfo": false,
                "bDestroy": true
            };
        }
        //console.log(options,"options");
        var explicitColumns = [];
        element.find('th').each(function(index, elem) {
            explicitColumns.push({"title":$(elem).text()});
        });
        
        console.log(explicitColumns,"explicitColumns");
        if (explicitColumns.length > 0) {
            options["aoColumns"] = explicitColumns;
        } else if (attrs.aoColumns) {
            options["aoColumns"] = scope.$eval(attrs.aoColumns);
        }
        
        if (attrs.aoColumnDefs) {
            options["aoColumnDefs"] = scope.$eval(attrs.aoColumnDefs);
        }
        
        if (attrs.fnRowCallback) {
            options["fnRowCallback"] = scope.$eval(attrs.fnRowCallback);
        }
       
        // apply the plugin
        var dataTable = element.dataTable(options);
        console.log(scope.$eval(attrs.aaData),"aa");
        
        scope.$watch(attrs.aaData, function(value) {
        	console.log(attrs.aaData,"attrs.aaData");
            var val = value || null;
            if (val) {
                dataTable.fnClearTable();
                dataTable.fnAddData(scope.$eval(attrs.aaData));
            }
        }); 
    };
});
function getParamFromUrl(paramName) {
	   return (window.location.search.match(new RegExp('[?&]' + paramName + '=([^&]+)')) || [, null])[1];
}
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
function openFullWind(title, url) {
    var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}