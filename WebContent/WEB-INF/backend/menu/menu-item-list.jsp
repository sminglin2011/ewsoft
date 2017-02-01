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

<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Menu Setup</title>
</head>
<body>
<nav class="breadcrumb">
    <a class="btn btn-success radius l" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="MenuItemGroup" ng-click="gotoMenuItemGroupList()"><i class="Hui-iconfont">&#xe6f5;</i>MenuItem Group</a>
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <div class="text-c"> 
		<form class="form form-horizontal" id="form-menuItem">
			<div class="row cl">
                <label class="form-label col-xs-2">MenuItem Group</label>
                <div class="formControls col-xs-4">
                    <span class="select-box">
						<select ng-model="menuItem.groupName" class="select" datatype="*">
		                    <option value="{{ group.code }}" ng-repeat="group in menuItemGroupList track by group.code">{{ group.menuItemName}}</option>
		                </select>
		            </span>
                </div>
                <label class="form-label col-xs-2">Price</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menuItem.price" datatype="*4-50" class="input-text">
                </div>
			</div>
            <div class="row cl">
                <label class="form-label col-xs-2">MenuItem Description</label>
                <div class="formControls col-xs-4">
                    <input type="hidden" ng-model="menuItem.menuGroupId">
                    <input type="hidden" ng-model="menuIem.menuId">
                    <span class="select-box">
						<select ng-model="menuItem.menuItemName" class="select" datatype="*">
		                    <option value="{{ stock.stockId }}" ng-repeat="stock in stockList | filter:{isMenuItem:'Y'} track by stock.code">{{ stock.descrip1}}</option>
		                </select>
		            </span>
                </div>
                <label class="form-label col-xs-2">MenuItem Original Description</label>
                <div class="formControls col-xs-4">
                    <input type="text" ng-model="menuItem.menuItemName" datatype="*4-50" class="input-text">
                </div>
			</div>
            <div class="row cl">
                
			</div>
            <div class="row cl">
                <div class="formControls col-xs-12">
                    <button class="btn btn-success" ng-click="saveMenuGroup()">
                        <i class="Hui-iconfont Hui-iconfont-save"></i> Save
                    </button>
                </div>
            </div>
        </form>
	</div>
    <!--
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
        <span class="l"></span> 
        <span class="r"></span>
    </div> -->
	<div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg    "
            my-table="overrideOptions"
        	aa-data="sampleData"
        	ao-columns="columns"
        	ao-column-defs="columnDefs"
        	fn-row-callback="myCallback"
            >
        </table>
    </div>
</div>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/datatables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="lib/angular/angular.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/ng-WdatePicker.js"></script>
    <script type="text/javascript" src="lib/select2-4.0.3/dist/js/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/select2-4.0.3/dist/css/select2.css" />
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" src="js/snd_util.js"></script>
</body>
<script type="text/javascript">
(function(){
	$(".select").select2();
    var validForm = $("#form-menuItem").Validform({
		tiptype:0,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
            console.log("click save")
			return false;
		}
	});
})(jQuery)

app.controller("myController", function($scope, $http) {
    $scope.menuGroupId = getParamFromUrl("menuGroupId");
    $scope.menuId = getParamFromUrl("menuId");
    $scope.menuItem = {};
    $scope.menuItemGroupList = [];
    $http.get("fetchMenuItemGroupListByMenuIdAndMenuGroupId?menuGroupId="+$scope.menuGroupId+"&menuId="+$scope.menuId)
		.then(function (response) {$scope.menuItemGroupList=response.data; });
    $scope.stockList = [];
    $http.get("fetchStockList")
	.then(function (response) {$scope.stockList=response.data; });
    dataTable($scope, $http);
    $scope.gotoMenuItemGroupList = function() {
       console.log(($scope.menuGroupId), 'menuGroupId');
       location.href =("backend/menuItemGroupList?menuGroupId="+$scope.menuGroupId+"&menuId=" + $scope.menuId);
    }
    $scope.save = function() {
        console.log("save", $scope.menuItem)
    }
})
function dataTable($scope, $http){
		$scope.options = {};
		$scope.overrideOptions = {
			    ordering:  false,
			    deferRender: true
		};
		$scope.sampleData = '';
		$http.get("fetchMenuItemListByMenuIdAndMenuGroupId?menuGroupId="+$scope.menuGroupId+"&menuId="+$scope.menuId)
			.then(function (response) {if(response.data != null && response.data != '') $scope.sampleData=response.data; });
        
		$scope.columns = [ 
             {"title":"MenuGroupId", width:"10%", className: "text-c", "visible":true, "data": "menuGroupId"}
            ,{"title":"MenuId", width:"10%", className: "text-c", "visible":true, "data": "menuId"}
            ,{"title":"itemId", width:"10%", className: "text-c", "visible":false, "data": "itemId"}
            ,{"title":"MenuItem Group", width:"10%", className: "text-c", "visible":true, "data": "groupName"}
            ,{"title":"MenuItem Description", width:"20%", className: "text-c", "visible":true, "data": "menuItemName"}
            ,{"title":"Price", width:"5%", className: "text-c", "visible":true, "data": "price", type: "currency"}
            ,{"title": "No. Delivery", width:"10%", className: "text-c", "visible":true, "data": "noDel"}
            ,{"title": "Action", width:"10%", className: "text-c action", "visible":true, "data": "code"
             , render: function(data, type, row) {
                 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
                                    +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;'      title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
             }}
        ]; 
		
		$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
            $('td:eq(3)', nRow).find(".menuItemUnderMenu").bind('click', function() {
                var el = this;
	            $scope.$apply(function() {
	                $scope.menuItemUnderMenu(el, aData);
	            });
	        });
	        $('.action', nRow).find("#edit").bind('click', function() {
	            $scope.$apply(function() {
	                $scope.editFunction(aData);
	            });
	        });
            $('.action', nRow).find("#del").bind('click', function() {
	            $scope.$apply(function() {
	                $scope.delFunction(aData);
	            });
	        });
	        return nRow;
	    };
	    $scope.editFunction = function(obj) {
	        console.log(obj, "edit")
            $scope.menuItem = obj;
            backTop();
	    };
        $scope.delFunction = function(obj) {
	        console.log(obj, "delete")
            
	    };
        $scope.menuItemUnderMenu = function(el, obj) {
            console.log(el, "");
        }
}

</script>
</html>