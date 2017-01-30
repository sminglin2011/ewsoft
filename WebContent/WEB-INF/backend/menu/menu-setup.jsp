<!DOCTYPE HTML>
<html ng-app="app" ng-controller="myController">
<head>
<base href="/ewsoft/">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" />
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Menu Setup</title>
<style type="text/css">
.panel{ background-color:#fff; border:solid 1px transparent}
	.panel-header{ border-bottom:solid 1px transparent; padding:4px 5px; font-size:14px; font-weight:700}/*面板标题*/
	.panel-body{ padding:5px}/*面板内容*/
	.panel-footer{background-color: #f5f5f5;border-top: 1px solid #ddd;padding:5px 20px}/*面板页脚*/
/*默认面板*/
.panel-default{border-color:#ddd;}
.panel-default > .panel-header{ border-color:#ddd; background-color:#f5f5f5; color:#444}
 
/*主要面板*/
.panel-primary{border-color:#5a98de;}
.panel-primary > .panel-header{ border-color:#5a98de; background-color:#5a98de; color:#fff}
 
/*次要面板*/
.panel-secondary{border-color:#3bb4f2;}
.panel-secondary > .panel-header{ border-color:#3bb4f2; background-color:#3bb4f2; color:#fff}
 
/*成功面板*/
.panel-success{border-color:#5eb95e;}
.panel-success > .panel-header{ border-color:#5eb95e; background-color:#5eb95e; color:#fff}
 
/*警告面板*/
.panel-warning{border-color:#f37b1d;}
.panel-warning > .panel-header{ border-color:#f37b1d; background-color:#f37b1d; color:#fff}
 
/*危险面板*/
.panel-danger{border-color:#dd514c;}
.panel-danger > .panel-header{ border-color:#dd514c; background-color:#dd514c; color:#fff}
</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> Menu Setup  
<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div>
	<div>
		<a class="btn btn-warning" ng-click="showMenuGroupList()">Menu Group</a>
	</div>
	<accordion>
	<expander class='expander' ng-repeat='menuGroup in menuGroupList' expander-title='menuGroup.menuGroupId'>
          <ul>
			<li ng-repeat="menu in menuList | filter: {menuGroupId: menuGroup.menuGroupId} track by menu.code ">
			<a ng-click="showMenuItem(menu)">{{menu.menuId}}</a>
			</li>
		  </ul>
      </expander>
  	</accordion>
</div>
<section class="Hui-article-box" style="left: 25%">
<IFRAME ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=auto width=100%  height=100% SRC="backend/allMenuItem"></IFRAME>
</section>

</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="lib/layer/2.1/layer.js"></script> 
	<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> 
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="lib/angular/angular.js"></script>
<script type="text/javascript">
angular.module("app",[]).directive('accordion',function(){
	  return {
        restrict : 'EA',
        replace : true,
        transclude : true,
        template : '<div ng-transclude></div>',
        controller : function() {
            var expanders = [];
            this.gotOpened = function(selectedExpander) {
                angular.forEach(expanders, function(expander) {
                    if (selectedExpander != expander) {
                        expander.showMe = false;
                    }
                });
            };
            this.addExpander = function(expander) {
                expanders.push(expander);
            };
        }
    };
}).directive('expander', function(){
	  return {
        restrict : 'EA',
        replace : true,
        transclude : true,
        require : '^?accordion',
        scope : {
            expanderTitle : '='
        },
        template : '<dl class="panel panel-success" style="width:230px; margin-top:1px;">'
                 +' <dt ng-click="toggle()" class="panel-header">{{expanderTitle}} <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>'
                 + '<dd ng-show="showMe" ng-transclude class="panel-body"></dd>'
                 + '</dl>',
        link : function(scope, iElement, iAttrs, accordionController) {
            scope.showMe = false;
            accordionController.addExpander(scope);
            scope.toggle = function toggle() {
                scope.showMe = !scope.showMe;
                accordionController.gotOpened(scope);
            };
        }
    };
}).controller("myController", function($scope, $http){
	
	$scope.showMenuGroupList = function() {
		location.href="backend/menuGroupList";
	}
	$scope.menuGroupList = [];
	$scope.menuList = [];
	$scope.expanders = $scope.menuGroupList;
	$http.get("fetchMenuGroupList")
	.then(function (response) {
		if(response.data != null && response.data != '') {
			$scope.menuGroupList=response.data;
		}
		});
	$http.get("fetchAllMenu")
	.then(function (response) {
		if(response.data != null && response.data != '') {
			$scope.menuList=response.data;
			
		}
		});
	console.log($scope.menuList,"menuList");
	$scope.showMenuItem = function(menu) {
		$("#testIframe").attr("src","backend/allMenuItem?menuGroupId="+encodeURI(menu.menuGroupId)+"&menuId="+encodeURI(menu.menuId));
	}
})
		
$(document).ready(function(){
	
});

</script>
</body>
</html>