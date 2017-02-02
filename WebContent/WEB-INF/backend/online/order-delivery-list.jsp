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
    <script type="text/javascript" src="js/snd_util.js"></script>
</body>
<script type="text/javascript">
	app.controller("myController", function($scope, $http, $filter) {
		$scope.selectedIds = [];
		$scope.postAccount = function() {
			if ($scope.selectedIds.length > 0) {
				layer.confirm('confirm post to account?', {
					  btn: ['Confirm', 'Cancel'] //可以无限个按钮
					}, function(index, layero){
						console.log(index, layero, "btn1");
						layer.close(index);
					  $
					}, function(index){
						console.log(index, "btn2");
					});
			} else {
				//layer.msg("selected row first", {icon:5,time:5000})
				layer.alert("selected row first", {icon: 5})
			}
		}
		Ctrl($scope, $http, $filter);
	})
	function Ctrl($scope, $http, $filter, $location){
		$scope.options = {};
		$scope.overrideOptions = {
			//ordering:  false,
			order: [],
			select: true
		};
		$scope.sampleData = '';
		$http.get("fetchOrderDeliveryList").then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
			  {"title":"DelST", width:"5%", className: "text-c", "visible":true, "data": "deliverStatus", orderable: false}
			 ,{"title":"Order NO.", width:"10%", className: "text-c", "visible":true, "data": "soNumber", orderable:false
	            	, render: function(data, type, row){
	            		return "<a style='text-decoration:none' class='btn btn-link orderDetails' href='javascript:;' title='Menu'>"+data+"<i class='Hui-iconfont Hui-iconfont-edit2'></i></a>";
	         }}
            ,{"title":"Customer Name", width:"10%", className: "text-c", "visible":true, "data": "custName"}
            ,{"title":"Contact Person", width:"10%", className: "text-c", "visible":true, "data": "custDelAtt"}
            ,{"title":"Delivery Date", width:"10%", className: "text-c", "visible":true, data:'schDelDate', render: function(data, type, row) {
                if (data != '') {
                    var date = $filter('date')(data); 
                    //console.log($scope.date);
                    return date;
                } else return data;
            }}
            ,{"title":"Time", width:"5%", className: "text-c", "visible":true, "data": "schDelTime"}
            ,{"title":"No.Pax", width:"5%", className: "text-c", "visible":true, "data": "noPax"}
            ,{"title":"Pay Type", width:"10%", className: "text-c", "visible":true, "data": "payType"}
            ,{"title":"Terms", width:"10%", className: "text-c", "visible":true, "data": "incoTerm"}
            ,{"title":"Order Amount", width:"10%", className: "text-c", "visible":true, "data": "orderAmount"}
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
	        $('td', nRow).find('.orderDetails').bind('click', function() {
	        	location.replace("orderDeliveryDetails?soNumber="+ aData.soNumber);
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