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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> Order Confirmation  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> Search </button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
        <span class="l">
        <!--<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> -->
        <a _href="order/orderNew" data-title=" New Order Confirmation" onclick="Hui_admin_tab(this)" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> New Order</a>
        <a ng-click="postAccount()" class="btn btn-danger radius">PostAccount</a>
        </span>
        <span class="r"></span> </div>
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
		$scope.selectedIds = [];
		$scope.postAccount = function() {
			if ($scope.selectedIds.length > 0) {
				layer.confirm('confirm post to account?', {
					  btn: ['Confirm', 'Cancel'] //可以无限个按钮
					}, function(index, layero){
					  //按钮【按钮一】的回调
						console.log(index, layero, "btn1");
						layer.close(index);
					  $
					}, function(index){
					  //按钮【按钮二】的回调
						console.log(index, "btn2");
					});
			} else {
				//layer.msg("selected row first", {icon:5,time:5000})
				layer.alert("selected row first", {icon: 5})
			}
		}
		Ctrl($scope, $http, $filter);
	})
	function Ctrl($scope, $http, $filter){
		$scope.options = {};
		$scope.overrideOptions = {
			//ordering:  false,
			order: [],
			select: true
		};
		$scope.sampleData = '';
		$http.get("fetchOrderConfrimationList").then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
			 {"title":'', width:"5%", className: "text-c", "visible":true, orderable:false
				,render:function(data, type, row){
					if (row.billStatus == 'Y') { return ''} else return '<input type="checkbox" class="soNumber" value="'+row.soNumber+'">';
			 }}
            ,{"title":"Status", width:"5%", className: "text-c", "visible":true, "data": "postStatus"}
            ,{"title":"BST", width:"5%", className: "text-c", "visible":true, "data": "billStatus"}
            ,{"title":"Order NO.", width:"10%", className: "text-c", "visible":true, "data": "soNumber"}
            ,{"title":"Customer Name", width:"10%", className: "text-c", "visible":true, "data": "custName"}
            ,{"title":"Event Date", width:"10%", className: "text-c", "visible":true, data:'eventDate', render: function(data, type, row) {
                if (data != '') {
                    var date = $filter('date')(data); 
                    //console.log($scope.date);
                    return date;
                } else return data;
            }}
            ,{"title":"No.Pax", width:"5%", className: "text-c", "visible":true, "data": "noPax"}
            ,{"title":"Pay Type", width:"10%", className: "text-c", "visible":true, "data": "payType"}
            ,{"title":"Terms", width:"10%", className: "text-c", "visible":true, "data": "incoTerm"}
            ,{"title":"PO NO.", width:"10%", className: "text-c", "visible":true, "data": "poNo"}
            ,{"title":"Invoice NO.", width:"10%", className: "text-c", "visible":true, "data": "invNo"}
            ,{"title":"Action", width:"5%", className: "text-c", "visible":true, orderable:false
             , render: function(data, type, row) {
            	 if(row.billStatus == 'Y') {
            		 return '' ;
            	 } else {
            		 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
            		 +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;' title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
            	 }
                                    
             }}
				]; 
		$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
	        $('td:eq(0)', nRow).find('input').bind('click', function() {
	        	console.log($(this).is(':checked'), "checked??");
	        	var checked = $(this).is(':checked');
	            $scope.$apply(function() {
	                $scope.selectedRow(aData, nRow, checked);
	            });
	        });
	        $('td:eq(1)', nRow).find("a").bind('click', function() {
	            $scope.$apply(function() {
	                $scope.someClickHandler(aData, nRow);
	            });
	        });
	        return nRow;
	    };
	    $scope.selectedRow = function(rowObj, nRow, checked) {
	    	if(checked) {
	    		$scope.selectedIds.push(rowObj.soNumber);
	    		$(nRow).addClass("selected");
	    	} else {
	    		$scope.selectedIds.splice($scope.selectedIds.indexOf(rowObj.soNumber), 1);
	    		$(nRow).removeClass("selected");
	    	}
	        console.log($scope.selectedIds);
	    };
	}
	
</script> 