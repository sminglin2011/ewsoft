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
<!--<link href="lib/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->
<link href="css/newTab.css" rel="stylesheet" type="text/css" /> <!-- menu show  -->
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Ordering</title>
<style>
.input-group {
  position: relative;
  display: table;
  border-collapse: separate;
}
.input-group .input-text {
  position: relative;
  z-index: 2;
  float: left;
  width: 100%;
  margin-bottom: 0;
  border-radius: 0 4px 4px 0;
}
.input-group .input-text:focus {
  z-index: 3;
}
.input-group-addon,
.input-group-btn,
.input-group .input-text {
  display: table-cell;
}
.input-group-addon:not(:first-child):not(:last-child),
.input-group .input-text:not(:first-child):not(:last-child) {
  border-radius: 0;
}
.input-group-addon,
.input-group-btn {
  width: 1%;
  white-space: nowrap;
  vertical-align: middle;
}
.input-group-addon {
  padding: 6px 12px;
  font-size: 14px;
  font-weight: normal;
  line-height: 1;
  color: #555;
  text-align: center;
  background-color: #eee;
  border: 1px solid #ccc;
  border-radius: 4px 0 0 4px ;
}
.request{
  background-color: #dd514c;
}
</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> 
    {{menuGroupId | remove20Spaces}}
    <span class="c-gray en">&gt;</span> {{menuId}}<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray mt-20">
    {{menuId}} minPax 30, $13/Per, 8 Items
</div>
<div class="mt-20"> 
<form class="form form-horizontal" id="form-menuCategory">
    <div class="row cl">
		<div class="formControls col-xs-4" ng-repeat="itemGroup in menuItemGroupList track by itemGroup.code">
	  		<ul> <strong>{{itemGroup.menuItemName}}</strong><br>
	  			<div class="check-box"
	  				ng-repeat="item in menuItemList | filter:{sequence: itemGroup.sequence} track by item.code">
				<label>
				<input type="checkbox" ng-checked="ngCheckItem(item)" 
					ng-click="toggleSelection($event, itemGroup, item)">
				{{item.menuItemName}}</label>
			</div>
	  		</ul>
	  	</div>
    </div>
<!-- 
	<div class="newtab-cell" ng-repeat="menu in menuList">
		<div class="newtab-site" draggable="true">
			<span class="newtab-sponsored"></span>
			<a class="newtab-link"
				title="{{menu.menuName}}"
				href="ordering-menuItem.html?menuId={{menu.menuId}}&menuGroupId={{menuGroupId}}"> 
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
	 -->
    <div class="row cl">
        <div class="formControls col-xs-12">
            <div class="panel panel-success">
                <div class="panel-header">Selected Items</div>
                <div class="panel-body">
                    <div ng-repeat="selectedItem in selectedItems track by selectedItem.code">
                    {{selectedItem.menuItemName}}<a href="javascript:;" class="ml-5" style="text-decoration:none"
                    ng-click="removeSelectedItem(selectedItem)"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-12">
            <div class="panel panel-danger">
                <div class="panel-header">Additional Items</div>
                <div class="panel-body">
                    <div class="check-box"
                        ng-repeat="addOnItem in menuItemList | filter:{addOn:true} track by addOnItem.code">
                        <label>
                        <input type="checkbox" ng-model="selectedAddOnItems[$index]" ng-true-value="{{addOnItem}}" >
                        {{addOnItem.menuItemName}}</label><label> {{addOnItem.price | currency}}</label>
                         Quantity <input type="text" class="input-text" style="width:40px"> {{addOnItem.prepareUnitMs}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h4>Delivery Information</h4>
    <div class="row cl">
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont">&#xe690;</i></span>
                <input type="text" class="form-control input-text radius date" ng-model="eventDate" wdate-picker placeholder="Event Date" >
            </div>
        </div>
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-shijian"></i></span>
                <span class="select-box" style="border-radius: 0 4px 4px 0">
                  <select class="select" size="1" name="demo1">
                    <option value="" selected>Event Time</option>
                    <option value="1">08:00</option>
                    <option value="2">08:30</option>
                    <option value="3">09:00</option>
                  </select>
                </span>
            </div>
        </div>
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-usergroup2"></i></span>
                <input type="text" class="form-control input-text radius date" 
                       ng-model="noPax"  placeholder="No. of pax" >
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-userid"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="First Name" >
            </div>
        </div>
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-zhizhao"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Last Name">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-12">
            <div class="input-group">
                <span class="input-group-addon"><i class="Hui-iconfont Hui-iconfont-gongsi"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Company">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-email"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Email">
            </div>
        </div>
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-phone"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Mobile Phone">
            </div>
        </div>
        <div class="formControls col-xs-4">
            <div class="input-group">
                <span class="input-group-addon"><i class="Hui-iconfont Hui-iconfont-tel"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Telephone">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-3">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-home2"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Postal Code">
            </div>
        </div>
        <div class="formControls col-xs-3">
            <div class="input-group">
                <span class="input-group-addon"><strong>#</strong></span>
                <input type="text" class="form-control input-text radius" placeholder="02-03">
            </div>
        </div>
        <div class="formControls col-xs-6">
            <div class="input-group">
                <span class="input-group-addon request"><i class="Hui-iconfont Hui-iconfont-home"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Address">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-12">
            <div class="input-group">
                <span class="input-group-addon"><i class="Hui-iconfont Hui-iconfont-comment"></i></span>
                <input type="text" class="form-control input-text radius" placeholder="Delivery Instructions... If applicable, kindly state your function room booked timing.">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-12 l">
            <button class="btn btn-success radius"><i class="Hui-iconfont Hui-iconfont-cart-selected"></i> Add To Cart</button>
        </div>
    </div>
    </form>
</div>
</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/angular/angular.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/ng-WdatePicker.js"></script>
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
var app = angular.module("app",["ngRoute","ng-WdatePicker"]);
app.filter("remove20Spaces", function(){
    return function(text) {
        return text.replace('%20', ' ');
    }
})
app.controller("myController", function($scope, $http) {
	$scope.menuGroupId = getParamFromUrl("menuGroupId");
	$scope.menuId = getParamFromUrl("menuId");
	$scope.menuItemList = [];
	$scope.menuItemGroupList = [];
	$scope.selectedItems = [];
    $scope.selectedAddOnItems = [];
	$http.get("onlineFetchMenuItemListByMenuIdAndMenuGroupId?menuGroupId="+$scope.menuGroupId+"&menuId="+$scope.menuId)
		.then(function (response) {
			$scope.menuItemList=response.data;
			/* $scope.menuItemGroupList = 
			 response.data.filter(function(item){
				console.log("menuItemGroup", angular.uppercase(item.menuCategoryType));	
				if (angular.uppercase(item.menuCategoryType) == 'MENU-ITEM-GROUP') {
					return item;
				}
			}); */
		});
	$http.get("onlineFetchMenuItemGroupListByMenuIdAndMenuGroupId?menuGroupId="+$scope.menuGroupId+"&menuId="+$scope.menuId)
	.then(function (response){
		$scope.menuItemGroupList = response.data;
		});
	
	$scope.toggleSelection = function($event, itemGroup, item) {
		console.log(itemGroup);
		var checkbox = $event.target;
		var limitSelection = itemGroup.limitSelection;
		console.log("limitSelecton=", limitSelection);
		var selected = 0;
		if ($event.target.checked) {
			angular.forEach($scope.selectedItems, function(obj, index) {
				if (item.menuId == obj.menuId && item.sequence == obj.sequence) {//count group selected 
					selected = selected + 1;
				}
			})
			console.log("current selected how many = " , selected);
			if (selected < limitSelection) {
				$event.target.checked = true;
				$scope.selectedItems.push(item);
			} else {
				$event.target.checked = false;
			}
		} else {
			//selectedItems.splice(selectedItems.indexOf(item), 1); // remove item
			console.log("what is it = ", $scope.selectedItems);
			$scope.removeSelectedItem(item);
		}
	}
	$scope.ngCheckItem = function (item) {
		var checked = false;
		/*angular.forEach($scope.selectedItems, function(obj, index) {
			if (obj.code == item.code) {
				checked = true;
				return false;
			}
		})*/
		$.each($scope.selectedItems, function(i){
		    if($scope.selectedItems[i].code === item.code) {
		    	checked = true;
		    	return false;
		    }
		});
		return checked;
	}
	// remove item from selected List
	$scope.removeSelectedItem = function(item) {
		angular.forEach($scope.selectedItems, function(obj, index){
		    // sourceArray is a reference to the original array passed to ng-repeat, 
		    // rather than the filtered version. 
		    // 1. compare the target object's hashKey to the current member of the iterable:
		    console.log(obj.code, "?=?", item.code)
            //if (obj.$$hashKey === hashKey) {
            if (obj.code === item.code) {
		      // remove the matching item from the array
		      $scope.selectedItems.splice(index, 1);
		      // and exit the loop right away
		      return;
		    };
		  });
	}
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