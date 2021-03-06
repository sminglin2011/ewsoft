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
    <form action="" method="post" class="form form-horizontal responsive" id="form-orderConfirmation">
    <div class="row cl">
        <label class="form-label col-xs-2">Order Number:</label>
        <div class="formControls col-xs-2">
            <input type="text" class="input-text disabled" ng-model="so.soNumber" >
        </div>
        <label class="form-label col-xs-2"><span class="c-red">*</span>Postal Code:</label>
        <div class="formControls col-xs-2">
            <input type="text" class="input-text date" ng-model="so.postal" 
             datatype="*">
        </div>
    </div>
	<div class="row cl">
        <label class="form-label col-xs-2"><span class="c-red">*</span>Customer Name:</label>
        <div class="formControls col-xs-2">
        	<span class="select-box">
				<select ng-model="customer.custName" class="select">
                    <option value="{{ c.custCode }}" ng-repeat="c in customerList">{{ c.custName}}</option>
                </select>
            </span>
        </div>
        
        <label class="form-label col-xs-2"><span class="c-red">*</span>Address:</label>
        <div class="formControls col-xs-4">
            <input type="text" class="input-text date" ng-model="so.postal" 
             datatype="*">
        </div>
    </div>
    <div class="row cl">
    	<label class="form-label col-xs-2"><span class="c-red">*</span>Start Date:</label>
        <div class="formControls col-xs-2">
            <input type="text" class="input-text date" ng-model="startDate" wdate-picker >
        </div>
        <label class="form-label col-xs-2"><a class="btn btn-danger radius" ng-click="changeDate()"><i class="Hui-iconfont">&#xe6f7;</i>Change Start Date</a></label>
    </div>
	<div class="mt-20">
	<div id="tab_demo" class="HuiTab">
      <div class="tabBar clearfix"><span ng-repeat="tab in tabs track by $index">{{tab.title}}</span></div>
      <div class="tabCon" ng-repeat="tab in tabs track by tab.title">
          <ul id="Huifold{{$index}}" class="Huifold">
			  <li class="item" ng-repeat="so in tab.deliverySo track by so.noDel">
			    <h4>Delivery {{$index+1}}<b>+</b></h4>
			    <div class="info">
			    <!-- Delivery -->
			    <div class="row cl">
			    	<label class="form-label col-xs-2">No. Pax:</label>
			    	<div class="formControls col-xs-2">
			            <input class="input-text" type="text" ng-model="so.noPax">
			        </div>
			        <label class="form-label col-xs-2">Price Per Pax:</label>
			    	<div class="formControls col-xs-2">
			            <input class="input-text" type="text" ng-model="so.unitPrice">
			        </div>
			    </div>
			    <div class="row cl">
			        <label class="form-label col-xs-2">Menu Category:</label>
			        <div class="formControls col-xs-4">
			            <span class="select-box">
							<select ng-model="so.menuCategory" class="select" style="width:250px">
			                    <option value="{{ category.categoryId }}" ng-repeat="category in menuCategoryList track by category.id">{{ category.categoryName }}</option>
			                </select>
			            </span>
			        </div>
			        <label class="form-label col-xs-2">Menu:</label>
			        <div class="formControls col-xs-4">
			            <span class="select-box">
							<select ng-model="so.menu" class="select" style="width:250px">
			                    <option value="{{ menu.menuId }}" ng-repeat="menu in menuList | filter:{categoryId: so.menuCategory} track by menu.menuId">{{ menu.menuName }}</option>
			                </select>
			            </span>
			        </div>
			    </div>
			    <div class="row cl" ng-if="so.menu">
			    	<div class="formControls col-xs-4" ng-repeat="itemGroup in menuItemGroupList | filter:{menuId: so.menu} track by itemGroup.id">
			    		<ul> <strong ng-model="itemGroup.sequence">{{itemGroup.groupName}}</strong><br>
			    			<div class="check-box" ng-show="so.menu"
			    				ng-repeat="item in menuItemList | filter:{menuId: so.menu, sequence:itemGroup.sequence} track by item.id">
								<label>
								<input type="checkbox" ng-checked="ngCheckItem(item, so.selectedItems)" 
									ng-click="toggleSelection($event, itemGroup, item, so.selectedItems)"
								  >
								{{item.menuItemName}}</label>
							</div>
			    		</ul>
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
			           	<div class="panel panel-danger">
							<div class="panel-header">Additional Items</div>
							<div class="panel-body">
								<div class="check-box" ng-show="so.menu"
				    				ng-repeat="addOnItem in menuItemList | filter:{menuId: so.menu, addOn:true} track by addOnItem.id">
									<label>
									<input type="checkbox" ng-model="so.selectedAddOnItems[$index]" ng-true-value="{{addOnItem}}" >
									{{addOnItem.menuItemName}}</label><label> {{addOnItem.price | currency}}</label>
									 Quantity <input type="text" class="input-text" style="width:40px" 
									 	ng-model="so.selectedAddOnItems[$index].quantity"> {{addOnItem.prepareUnitMs}}
								</div>
							</div>
						</div>
			        </div>
			    </div>
			    <!-- Delivery -->
			    </div>
			  </li>
		  </ul>
      </div>
    </div>
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

<script type="text/javascript">
$(function(){
	$(".select").select2();
    $.Huitab("#tab_demo .tabBar span","#tab_demo .tabCon","current","click","0");
    //$.Huifold("#Huifold0 .item h4","#Huifold0 .item .info","fast",2,"click"); /*5个参数顺序不可打乱，分别是：相应区,隐藏显示的内容,速度,类型,事件*/
    
});
	angular.module('app', ["ng-WdatePicker"]);
    angular.module('app').controller('myController', function ($scope, $http) {
	$scope.customer = {};
	$scope.tabs = [];
	
	$scope.menuCategoryList = [];
	$scope.menuList = [];
	$scope.menuItemGroupList = [];
	$scope.menuItemList = [];
	
	$http.get("http://ews-web.servebbs.com:8090/zsoft/fetchMenuCategory.ewsvc")
		.then(function (response) {console.log(response.data);$scope.menuCategoryList=response.data });
	$http.get("http://ews-web.servebbs.com:8090/zsoft/fetchMenu.ewsvc")
		.then(function (response) {console.log(response.data);$scope.menuList=response.data });
	$http.get("http://ews-web.servebbs.com:8090/zsoft/fetchMenuItemGroup.ewsvc")
		.then(function (response) {console.log("meniItemGroup",response.data);$scope.menuItemGroupList=response.data });
	$http.get("http://ews-web.servebbs.com:8090/zsoft/fetchMenuItem.ewsvc")
		.then(function (response) {console.log("meniItem",response.data);$scope.menuItemList=response.data });
	
	var tomorrow = new Date(new Date().getTime() + 24*60*60*1000);
	$scope.startDate = tomorrow.toISOString().substring(0, 10);
	var currentDay = tomorrow;
	
	for (var i=0; i <2; i++) {
		$scope.deliverySo = []; // 4 deliverys 
		for (var deliveryTime = 1; deliveryTime <=4; deliveryTime++){
			$scope.so = {};
			$scope.so.selectedItems = [];
			$scope.so.selectedAddOnItems = [];
			$scope.so.noDel = deliveryTime;
			$scope.deliverySo.push($scope.so);
		}
		$scope.tabs.push(
				{ title:currentDay.getDate()+"/"+(currentDay.getMonth()+1), content:currentDay
				  , deliverySo: $scope.deliverySo 
				}
		);
		currentDay = new Date(currentDay.getTime() + 24*60*60*1000);
	}
	$scope.changeDate = function(){
		$scope.tabs = [];
		currentDay = new Date($scope.startDate);
		for (var i=0; i <2; i++) {
			$scope.deliverySo = []; // 4 deliverys 
			for (var deliveryTime = 1; deliveryTime <=4; deliveryTime++){
				$scope.so = {};
				$scope.so.selectedItems = [];
				$scope.so.noDel = deliveryTime;
				$scope.deliverySo.push($scope.so);
			}
			$scope.tabs.push(
					{ title:currentDay.getDate()+"/"+(currentDay.getMonth()+1), content:currentDay
					  , deliverySo: $scope.deliverySo 
					}
			);
			currentDay = new Date(currentDay.getTime() + 24*60*60*1000);
		}
    }
	$scope.toggleSelection = function($event, itemGroup, item, selectedItems) {
		var checkbox = $event.target;
		
		var limitSelection = itemGroup.limitSelection;
		var selected = 0;
		if ($event.target.checked) {
			for(var i=0; i<selectedItems.length; i++) {
				if(item.menuId == selectedItems[i].menuId && item.sequence == selectedItems[i].sequence) {
					selected = selected + 1;
				}
			}
			if (selected < limitSelection) {
				$event.target.checked = true;
				selectedItems.push(item);
			} else {
				$event.target.checked = false;
			}
		} else {
			selectedItems = $scope.removeSelectedItem(item, selectedItems);
		}
		console.log(selectedItems);
	}
	$scope.ngCheckItem = function (item, selectedItems) {
		var checked = false;
		$.each(selectedItems, function(i){
		    if(selectedItems[i].id === item.id) {
		    	checked = true;
		    	return false;
		    }
		});
		return checked;
	}
	// remove item from selected List
	$scope.removeSelectedItem = function(obj, selectedItems) {
		selectedItems = $.each(selectedItems, function(i){
		    if(selectedItems[i].id === obj.id) {
		    	selectedItems.splice(i,1);
		    	return false
		    }
		});
		console.log("after removed", selectedItems);
		return selectedItems;
	}
	$scope.checkData = function() {
		console.log("check data tabs=", $scope.tabs);
	}
	
 });
</script> 