
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
<div class="page-container">
    <div class="text-c"> 
		
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
app.controller("myController", function($scope, $http, $filter) {
    $scope.menuGroupId = getParamFromUrl("menuGroupId");
    console.log($scope.menuGroupId, 'menuGroupId');
    $scope.menuId = getParamFromUrl("menuId");
    console.log($scope.menuId);
    $scope.menuItem = {};    
    dataTable($scope, $http, $filter);
    $scope.save = function() {
        console.log("save", $scope.menuItem)
    }
})
function dataTable($scope, $http, $filter){
		$scope.options = {};
		$scope.overrideOptions = {
			    ordering:  false,
			    deferRender: true
		};
		$scope.sampleData = '';
		$http.get("fetchAllMenuItem")
			.then(function (response) {
				var a = [];
				if(response.data != null && response.data != '') {
					$scope.sampleData = response.data;
					if($scope.menuGroupId != null && $scope.menuId != null) {
						angular.forEach(response.data, function(obj, index){
							//console.log("$scope.menuId", $scope.menuId, "obj.menuId", obj.menuId);
							//console.log("$scope.menuGroupId", $scope.menuGroupId, "obj.menuGroupId", obj.menuGroupId);
							 if(obj != '' && encodeURI(obj.menuId) == $scope.menuId && encodeURI(obj.menuGroupId) == $scope.menuGroupId) {
								 //console.log(a,"a");
								 a.push(obj);
							 }
						})
						if(a.length > 0){
							$scope.sampleData = a;
						} else $scope.sampleData = "";
						
					}
				}
		});
        
		$scope.columns = [ 
             {"title":"MenuGroupId", width:"10%", className: "text-c", "visible":true, "data": "menuGroupId"}
            ,{"title":"MenuId", width:"10%", className: "text-c", "visible":true, "data": "menuId"}
            ,{"title":"itemId", width:"10%", className: "text-c", "visible":false, "data": "itemId"}
            ,{"title":"MenuItem Group", width:"10%", className: "text-c", "visible":true, "data": "groupName"}
            ,{"title":"MenuItem Description", width:"20%", className: "text-c", "visible":true, "data": "menuItemName"}
            ,{"title":"Price", width:"5%", className: "text-c", "visible":true, "data": "price", type: "currency"}
            ,{"title": "No. Delivery", width:"10%", className: "text-c", "visible":true, "data": "noDel"}
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