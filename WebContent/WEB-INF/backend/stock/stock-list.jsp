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
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
        <span class="l">
        <a ng-click="defaultSupplier()" class="btn btn-danger radius">Default Supplier</a>
        </span>
        <span class="r"></span>
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
<div id="purchaseRequest" style="display: none;">
	<div class="page-container">
		<div class="row cl">
                <label class="form-label col-xs-4">Request Quantity</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="pr.quantityOrder" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-3">UOM</label>
                <div class="formControls col-xs-3">
                    <input type="text" ng-model="pr.unitMs" datatype="*4-50" class="input-text">
                </div>
		</div>
	</div>
</div>
<div id="defaultSupplier" style="display: none;">
	<div class="page-container">
		<div class="row cl">
            <span class="select-box">
				<select ng-model="stock.supplier" class="select">
					<option value=""></option>
                    <option value="{{ c.id }}" ng-repeat="c in supplierList track by c.id">{{ c.name}} / {{c.contactPerson}} / {{c.telephone}}</option>
                </select>
            </span>
		</div>
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
    <script type="text/javascript" src="js/stock.js"></script>
</body>
<script type="text/javascript">
$(function(){
	$(".select").select2();
})
	
	
</script> 