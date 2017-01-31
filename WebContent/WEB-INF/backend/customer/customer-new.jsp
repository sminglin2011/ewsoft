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
<div class="page-container">
		<form action="saveCustomer.htm" method="post" class="form form-horizontal responsive" id="form-customer">
			<h5>Billing Information</h5>
			<div class="row cl">
                <label class="form-label col-xs-2">Customer Name</label>
                <div class="formControls col-xs-4">
                	<input type="hidden" ng-model="customer.id">
                    <input type="text" ng-model="customer.name" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Contact Person</label>
                <div class="formControls col-xs-4">
                    <input type="text" ng-model="customer.contactPerson" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
                <label class="form-label col-xs-2">Telephone</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.telephone" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Fax</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.fax" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Email</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.contactPersonEmail" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
                <label class="form-label col-xs-2">PostalCode</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.addPostal" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Address</label>
                <div class="formControls col-xs-6">
                    <input type="text" ng-model="customer.address1" datatype="*4-50" class="input-text">
                </div>
			</div>
			<span><input type="checkbox" id="sameas" checked disabled="disabled">same as bill information</span>
			<h5>Delivery Information</h5>
			<div class="line"></div>
			<div class="row cl">
                <label class="form-label col-xs-2">Contact Person</label>
                <div class="formControls col-xs-4">
                    <input type="text" ng-model="customer.contactPerson" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
                <label class="form-label col-xs-2">Telephone</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.telephone" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Fax</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.fax" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
                <label class="form-label col-xs-2">PostalCode</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="customer.addPostal" datatype="*4-50" class="input-text">
                </div>
                <label class="form-label col-xs-2">Address</label>
                <div class="formControls col-xs-6">
                    <input type="text" ng-model="customer.address1" datatype="*4-50" class="input-text">
                </div>
			</div>
			<div class="row cl">
                <div class="formControls col-xs-7 col-xs-offset-5">
                    <button class="btn btn-success" ng-click="saveFunction()">
                        <i class="Hui-iconfont Hui-iconfont-save"></i> Save
                    </button>
                </div>
            </div>
		</form>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/datatables/jquery.dataTables.js"></script>
	<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="lib/angular/angular.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/ng-WdatePicker.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
</body>
<script type="text/javascript">
(function(){
	 var validForm = $("#form-customer").Validform({
			tiptype:0,
			beforeSubmit:function(form) { // here must return false to stop submit data by form
	            console.log("click save")
				return false;
			}
		});
})()
	app.controller("myController", function($scope, $http, $filter) {
		$scope.customer = {};
		$scope.saveFunction = function() {
			console.log("save");
			layer.msg('save model, in development!', {icon: 5,time:2000});
			var index = parent.layer.getFrameIndex(window.name);
			parent.obj = $scope.customer;
			console.log(parent.obj);
			parent.layer.close(index);
		}
	})
	
</script> 