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
<title></title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> Stock  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form class="form form-horizontal" id="form-menuItem">
			<div class="row cl">
                <label class="form-label col-xs-2">Stock Description</label>
                <div class="formControls col-xs-4">
                	<input type="hidden" ng-model="stock.stockId">
                    <input type="text" ng-model="stock.descrip1" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Original Description</label>
                <div class="formControls col-xs-4">
                    <input type="text" ng-model="stock.oriDesc" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="stock.isMenuItem">
                        MenuItem</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="stock.foodItems">
                        FoodItem</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="stock.equipment">
                        Equipment</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="stock.disposables">
                        Disposable</label>
                    </div>
                </div>
			</div>
			<div class="row cl">
                <div class="formControls col-xs-12">
                    <button class="btn btn-success" ng-click="saveStock()">
                        <i class="Hui-iconfont Hui-iconfont-save"></i> Save
                    </button>
                </div>
            </div>
		</form>
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort"
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
    <script type="text/javascript" src="js/app.js"></script>
</body>
<script type="text/javascript">
	app.controller("myController", function($scope, $http, $filter) {
		$scope.stock = {isMenuItem: true};
		$scope.saveStock = function() {
			console.log("save Stock");
			layer.msg('Edit model!', {icon: 1,time:2000});
		}
		Ctrl($scope, $http, $filter);
	})
	function Ctrl($scope, $http, $filter){
		$scope.options = {};
		$scope.overrideOptions = {
			   // ordering:  false
		};
		$scope.sampleData = '';
		$http.get("fetchStockList")
			.then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
            // {"title":"Sn", width:"5%", className: "text-c", "visible":true, "data": null, defaultContent:1}
            {"title":"Stock ID", width:"10%", className: "text-c", "visible":true, "data": "stockId"}
            ,{"title":"Description", width:"20%", className: "text-c", "visible":true, "data": "descrip1"}
            ,{"title":"Original Description", width:"20%", className: "text-c", "visible":true, "data": "oriDesc"}
            ,{"title":"MenuItem", width:"5%", className: "text-c", "visible":true, data:'menuItem', orderable:false, searchable: false, render: function(data, type, row) {
                if (data) return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
            }}
            ,{"title":"FoodItem", width:"5%", className: "text-c", "visible":true, data:'foodItems', orderable:false, searchable: false, render: function(data, type, row) {
                if (data) return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
            }}
            ,{"title":"Equipment", width:"5%", className: "text-c", "visible":true, data:'equipment', orderable:false, searchable: false, render: function(data, type, row) {
                if (data) return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
            }}
            ,{"title":"Disposables", width:"5%", className: "text-c", "visible":true, data:'disposables', orderable:false, searchable: false, render: function(data, type, row) {
                if (data) return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
            }}
            ,{"title":"Action", width:"5%", className: "text-c", "visible":true, orderable:false, searchable: false
             , render: function(data, type, row) {
                 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
                                    +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;'      title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
             }}
				]; 
		$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
	        $('td:eq(7)', nRow).find('.edit').bind('click', function() {
	            $scope.$apply(function() {
	                $scope.editFunction(aData);
	            });
	        });
	        $('td:eq(7)', nRow).find('.del').bind('click', function() {
	            $scope.$apply(function() {
	                $scope.delFunction(aData);
	            });
	        });
	        return nRow;
	    };
	    
	    $scope.editFunction = function(obj) {
	    	$scope.stock = obj;
            backTop();
	    }
		$scope.delFunction = function(obj) {
	    	
	    }
	}
	
</script> 