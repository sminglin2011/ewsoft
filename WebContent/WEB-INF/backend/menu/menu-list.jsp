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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> 
    Menu Setup
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <div class="text-c"> 
		<form class="form form-horizontal" id="form-menu">
			<div class="row cl">
                <label class="form-label col-xs-2">Menu Name</label>
                <div class="formControls col-xs-4">
                    <input type="hidden" ng-model="menu.menuGroupId">
                    <input type="hidden" ng-model="menu.menuId">
                    <input type="text" ng-model="menu.menuName" datatype="*4-50" class="input-text">
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="menu.delYN">
                        Delivery Y/N</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="menu.colYN">
                        Collection Y/N</label>
                    </div>
                </div>
			</div>
            <div class="row cl">
                <label class="form-label col-xs-2">Min. Pax</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.minPax" datatype="n1-4" class="input-text">
                </div>
                <label class="form-label col-xs-2">Price Per Pax</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.price" datatype="n1-4" class="input-text">
                </div>
                <label class="form-label col-xs-2">No. Item</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.noItem" datatype="n1-4" class="input-text">
                </div>
			</div>
            <div class="row cl">
                <label class="form-label col-xs-2">Cook Time</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.cookLeadTime" datatype="n1-4" class="input-text">
                </div>
                <label class="form-label col-xs-2">Delivery Time</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.deliveryLeadTime" datatype="n1-4" class="input-text">
                </div>
                <label class="form-label col-xs-2">Collection Time</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menu.collectionLeadTime" datatype="n1-4" class="input-text">
                </div>
			</div>
            <div class="row cl">
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="menu.priceByItem">
                        price By Item</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="menu.menuItemShowImage">
                        menuItem Show Image</label>
                    </div>
                </div>
                <div class="formControls col-xs-3">
                    <div class="check-box">
                        <label>
                        <input type="checkbox" ng-model="menu.multiDelivery">
                        Multi Delivery</label>
                    </div>
                </div>
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
    <script type="text/javascript" src="js/app.js"></script>
</body>
<script type="text/javascript">
(function(){
    var validForm = $("#form-menu").Validform({
		tiptype:0,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
            console.log("click save")
			return false;
		}
	});
})(jQuery)

app.controller("myController", function($scope, $http) {
    $scope.menuGroupId = getParamFromUrl("menuGroupId");
    $scope.menu = {delYN:true, colYN:true};    
    dataTable($scope, $http);
    $scope.save = function() {
        console.log("save", $scope.menu)
    }
})

function dataTable($scope, $http){
		$scope.options = {};
		$scope.overrideOptions = {
			   // ordering:  false
		};
		$scope.sampleData = '';
		$http.get("fetchMenuListByMenuGroupId?menuGroupId="+$scope.menuGroupId)
			.then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
             {"title": "Online", width:"5%", className: "text-c", "visible":true, "data": "active"
             , render:function(data, type, row){
                 if(data == true) 
                    return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                 else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
             }}
            ,{"title":"MenuGroupId", width:"10%", className: "text-c", "visible":true, "data": "menuGroupId"}
            ,{"title":"MenuId", width:"10%", className: "text-c", "visible":true, "data": "menuId"}
            ,{"title":"MenuName", width:"20%", className: "text-c", "visible":true, "data": "menuName"
             , render: function(data, type, row){
                 return "<a style='text-decoration:none' class='btn btn-link menuItemUnderMenu' href='javascript:;' title='MenuItem'>"+data+"<i class='Hui-iconfont Hui-iconfont-edit2'></i></a>";
             }}
            ,{"title":"MinPax", width:"5%", className: "text-c", "visible":true, "data": "minPax"}
            ,{"title": "Price", width:"5%", className: "text-c", "visible":true, "data": "price", type: "currency"}
            ,{"title": "No.Item", width:"5%", className: "text-c", "visible":true, "data": "noItem"}
            ,{"title": "Delivery Y/N", width:"10%", className: "text-c", "visible":true, "data": "delYN"
             , render: function(data, type, row) {
                 if(data == true) 
                    return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                 else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
             }}
            ,{"title": "Collection Y/N", width:"10%", className: "text-c", "visible":true, "data": "colYN"
             , render: function(data, type, row) {
                 if(data == true) 
                    return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                 else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
             }}
            ,{"title": "Action", width:"10%", className: "text-c action", "visible":true, "data": "code", orderable: false
             , render: function(data, type, row) {
                 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
                                    +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;'      title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
             }}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "sequence"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "menuOrigName"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "ledger"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "addPaxPrice"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "cookLeadTime"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "deliveryLeadTime"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "collectionLeadTime"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "terms"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "termsWeb"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "multiDelivery"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "noDelivery"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "priceByItem"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "menuItemShowImage"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "deliveryRef"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "minTotalWaiver"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "minPaxWaiver"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "minWaiverMode"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "deliveryFee"}
            ,{"title": "Add On", width:"1%", className: "text-c", "visible":false, "data": "addOn"}
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
            $scope.menu = obj;
            backTop();
	    };
        $scope.delFunction = function(obj) {
	        console.log(obj, "delete")
            
	    };
        $scope.menuItemUnderMenu = function(el, obj) {
            $(el).attr("data-title", "Menu:"+obj.menuName);
            $(el).attr("_href", "backend/menuItemList?menuGroupId="+encodeURI(obj.menuGroupId)+"&menuId=" + encodeURI(obj.menuId));//encodeURI()
            Hui_admin_tab($(el));
        }
}

</script>
</html>