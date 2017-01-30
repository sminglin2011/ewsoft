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

<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>Menu Setup</title>
</head>
<body>
<nav class="breadcrumb">
    <a class="btn btn-success radius l" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="MenuItemGroup" ng-click="goToMenuItem()"><i class="Hui-iconfont">&#xe6f5;</i>MenuItem</a>
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <div class="text-c"> 
		<form class="form form-horizontal" id="form-menuItem">
			<div class="row cl">
                <label class="form-label col-xs-2">MenuItem Group</label>
                <div class="formControls col-xs-2">
                    <input type="hidden" ng-model="menuItemGroup.menuGroupId">
                    <input type="hidden" ng-model="menuItemGroup.menuId">
                    <input type="text" ng-model="menuItemGroup.menuItemName" datatype="*4-50" class="input-text">
                </div>
                <div class="formControls col-xs-2">
                    <div class="check-box">
                        <label><input type="checkbox" ng-model="menuItemGroup.optional" >Optional
                        </label>
                    </div>
                </div>
                <label class="form-label col-xs-2">Limit Selection</label>
                <div class="formControls col-xs-2">
                    <input type="text" ng-model="menuItemGroup.limitSelection" datatype="*4-50" class="input-text">
                </div>
                <div class="formControls col-xs-2">
                    <div class="check-box">
                        <label><input type="checkbox" ng-model="menuItemGroup.addOn" >Add On
                        </label>
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
    $scope.menuItemGroup = {};    
    dataTable($scope, $http);
    $scope.goToMenuItem = function() {
        location.replace("backend/menuItemList?menuGroupId="+$scope.menuGroupId+"&menuId=" + $scope.menuId);
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
		$http.get("fetchMenuItemGroupListByMenuIdAndMenuGroupId?menuGroupId="+$scope.menuGroupId+"&menuId="+$scope.menuId)
			.then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
             {"title":"MenuGroupId", width:"10%", className: "text-c", "visible":true, "data": "menuGroupId"}
            ,{"title":"MenuId", width:"10%", className: "text-c", "visible":true, "data": "menuId"}
            ,{"title":"itemId", width:"10%", className: "text-c", "visible":false, "data": "itemId"}
            ,{"title":"MenuItem Group", width:"20%", className: "text-c", "visible":true, "data": "menuItemName"}
            ,{"title":"Optional", width:"5%", className: "text-c", "visible":true, "data": "optional"}
            ,{"title":"Limit Selection", width:"10%", className: "text-c", "visible":true, "data": "limitSelection"}
            ,{"title":"Add On", width:"5%", className: "text-c", "visible":true, "data": "addOn"}
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
            $scope.menuItemGroup = obj;
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