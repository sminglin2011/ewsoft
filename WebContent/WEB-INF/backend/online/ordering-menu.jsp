<!DOCTYPE HTML>
<html ng-app="app" ng-controller="myController">
<head>
<base href="/ewsoft/">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="favicon.ico" />
<LINK rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/newTab.css" rel="stylesheet" type="text/css" /> <!-- menu show  -->
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Ordering</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> Online Menu  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="pd-20">
	<div class="newtab-cell" ng-repeat="menu in menuList">
		<div class="newtab-site" draggable="true">
			<span class="newtab-sponsored"></span>
			<a class="newtab-link"
				title="{{menu.menuName}}"
				href="online/orderingMenuItem?menuId={{menu.menuId}}&menuGroupId={{menuGroupId}}"> 
				<img
				class="newtab-thumbnail"
				ng-if="(menu.url != null)" ng-src="{{menu.url}}"/>
				<img
				class="newtab-thumbnail"
				ng-if="(menu.url  == null)" src="img/missingimg.png"/>
				<span class="newtab-thumbnail enhanced-content"></span> 
				<span class="newtab-title">{{menu.menuName}}</span>
			</a>
		</div>
	</div>
	
</div>
</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/angular/angular.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
	<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
<script type="text/javascript">
function getParamFromUrl(paramName) {
	   return (window.location.search.match(new RegExp('[?&]' + paramName + '=([^&]+)')) || [, null])[1];
}
function reloadPage(url) {
	
}
function exportPDF() {
	console.log("export PDF");
}
var app = angular.module("app",["ngRoute"]);
app.controller("myController", function($scope, $http) {
	$scope.menuGroupId = getParamFromUrl("menuGroupId");
	console.log($scope.menuGroupId, "menuGroupId");
	$scope.menuList = [];
	$http.get("onlineFetchMenuListByMenuGroupId?menuGroupId="+$scope.menuGroupId)
		.then(function (response) {$scope.menuList=response.data });
})
/*
app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "main.htm"
    })
    .when("/red", {
        templateUrl : "red.htm"
    })
    .when("/green", {
        templateUrl : "green.htm"
    })
    .when("/blue", {
        templateUrl : "blue.htm"
    });
});*/
</script>
</html>