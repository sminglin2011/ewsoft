<!DOCTYPE HTML>
<html ng-app="app" ng-controller="myController">
<head>
<base href="/ewsoft/">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title></title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> New Order Confirmation  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="form form-horizontal responsive" id="form-orderConfirmation">
    <div class="row cl">
        <label class="form-label col-xs-2">Order Number:</label>
        <div class="formControls col-xs-2">
            <input type="text" class="input-text disabled" ng-model="so.soNumber" >
        </div>
        <label class="form-label col-xs-2"><span class="c-red">*</span>Customer Name:</label>
        <div class="formControls col-xs-4">
        	<span class="select-box">
				<select ng-model="so.custCode" class="select">
                    <option value="{{ c.id }}" ng-repeat="c in customerList track by c.code">{{ c.name}} / {{c.contactPerson}} / {{c.telephone}}</option>
                </select>
            </span>
        </div>
        <label class="form-label col-xs-1"><a href="#newCustomer1" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe600;</i>New</a></label>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2">Address:</label>
        <div class="formControls col-xs-6">
            <input type="text" class="input-text" ng-model="so.a.address" >
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2"><span class="c-red">*</span>Event Date:</label>
        <div class="formControls col-xs-1">
        	<input type="text" class="input-text date" ng-model="so.eventDate" datatype="*">
        </div>
        
        <label class="form-label col-xs-2"><span class="c-red">*</span>Event Time:</label>
        <div class="formControls col-xs-1">
            <span class="select-box">
				<select ng-model="so.eventTime" class="select">
                    <option value="{{ t.time }}" ng-repeat="t in timeSheet | filter:{blocked:false} track by t.time">{{t.time}}</option>
                </select>
            </span>
        </div>
        <label class="form-label col-xs-2"><span class="c-red">*</span>Delivery Time:</label>
        <div class="formControls col-xs-1">
            <span class="select-box">
				<select ng-model="so.deliveryTime" class="select">
                    <option value="{{ t.time }}" ng-repeat="t in timeSheet | filter:{blocked:false} track by t.time">{{t.time}}</option>
                </select>
            </span>
        </div>
        <label class="form-label col-xs-2"><span class="c-red">*</span>Collection Time:</label>
        <div class="formControls col-xs-1">
            <span class="select-box">
				<select ng-model="so.collectionTime" class="select">
                    <option value="{{ t.time }}" ng-repeat="t in timeSheet | filter:{blocked:false} track by t.time">{{t.time}}</option>
                </select>
            </span>
        </div>
    </div>
    
    <accordion>
	<expander class='expander' ng-repeat='delivery in Delivery4' expander-title='delivery.title'>
		<div class="row cl">
		<label class="form-label col-xs-2">Menu Group:</label>
        <div class="formControls col-xs-3">
            <span class="select-box">
				<select ng-model="delivery.menuGorupId" class="select" style="width:100%;">
                    <option value="{{ menuGroup.menuGroupId }}" ng-repeat="menuGroup in menuGroupList track by menuGroup.code">{{ menuGroup.menuGroupName }}</option>
                </select>
            </span>
        </div>
        <label class="form-label col-xs-2">Menu:</label>
        <div class="formControls col-xs-3">
            <span class="select-box">
				<select ng-model="delivery.menuId" class="select" style="width:100%;" ng-change="selectedMenu($index+1)">
                    <option value="{{ menu.menuId }}" ng-repeat="menu in menuList | filter : {menuGroupId: delivery.menuGorupId} track by menu.code">{{ menu.menuName }}</option>
                </select>
            </span>
        </div>
        </div>
	    <div class="row cl">
	    	<div class="formControls col-xs-12">
	           	<div class="panel panel-success">
					<div class="panel-header">Selected Items</div>
					<div class="panel-body">
						<div ng-repeat="selectedItem in so.selectedItems track by selectedItem.id">
	            		{{selectedItem.menuItemName}}<a href="javascript:;" class="ml-5" style="text-decoration:none"
	            		ng-click="removeSelectedItem(selectedItem, so.selectedItems)"><i class="Hui-iconfont">&#xe6e2;</i></a>
	            		</div>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="row cl">
	    	<div class="formControls col-xs-12">
	           	<div class="panel panel-success">
					<div class="panel-header">Additional Items</div>
					<div class="panel-body">
						<div ng-repeat="selectedItem in so.selectedItems track by selectedItem.id">
	            		{{selectedItem.menuItemName}}<a href="javascript:;" class="ml-5" style="text-decoration:none"
	            		ng-click="removeSelectedItem(selectedItem, so.selectedItems)"><i class="Hui-iconfont">&#xe6e2;</i></a>
	            		</div>
					</div>
				</div>
	        </div>
	    </div>
    </expander>
  	</accordion>
    
	<div class="mt-20">
	
  	</div>
    </form>
</div>
</body>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/angular/angular.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/ng-WdatePicker.js"></script>
<script type="text/javascript" src="lib/select2-4.0.3/dist/js/select2.js"></script>
<link rel="stylesheet" type="text/css" href="lib/select2-4.0.3/dist/css/select2.css" />
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>

<script type="text/javascript">
$(function(){
	$(".select").select2();
	$.Huifold("#Huifold1 .item h4","#Huifold1 .item .info","fast",1,"click"); /*5个参数顺序不可打乱，分别是：相应区,隐藏显示的内容,速度,类型,事件*/
});
var obj = {address:'111'};
angular.module('app', ["ng-WdatePicker","ngRoute"]).controller('myController', function ($scope, $http) {
	$scope.Delivery4 = [
	                      {title:'Delivery 1', menuGroupId: '', addistionItems:[]}
	                    , {title:'Delivery 2', menuGroupId: '', addistionItems:[]}
						, {title:'Delivery 3', menuGorupId: '', addistionItems:[]}
						, {title:'Delivery 4', menuGroupId: '', addistionItems:[]}
						];
  	$scope.so = {customer:{}};
  	$scope.so.customer = obj;
  	$scope.so.a = obj;
  	$scope.timeSheet = [];
  	$http.get("fetchTimeSheet").then(function(response){$scope.timeSheet = response.data;});
  	$scope.customerList = [];
  	$http.get("fetchCustomerList").then(function(response){$scope.customerList = response.data;});
  	$scope.menuGroupList = [];
  	$http.get("fetchMenuGroupList").then(function(response){$scope.menuGroupList = response.data;});
  	$scope.menuList = [];
  	$http.get("fetchAllMenu").then(function(response){$scope.menuList = response.data;});
  	$scope.menuItemGroupList = [];
  	$http.get("fetchAllMenuItemGroup").then(function(response){$scope.menuItemGroupList = response.data;});
  	$scope.menuItemList = [];
  	$http.get("fetchAllMenuItem").then(function(response){$scope.menuItemList = response.data;});
  	$scope.newCustomer = function() {
  		layer_show("New Customer","backend/customerNew",800,520);
  	}
  	$scope.selectedMenu = function(index) {
  		//layer_show("New Customer",$('#menuItemDiv'+index),800,520);
  		
  	}
}).directive('accordion',function(){
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
	        template : '<dl class="panel panel-default" style="margin-top:5px;">'
	                 +' <dt ng-click="toggle()" class="panel-header" style="cursor:pointer;">{{expanderTitle}}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>'
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
}).config(function($routeProvider) {
    $routeProvider
    .when("/newCustomer1", {
        templateUrl : "welcome.jsp"
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
});
</script> 