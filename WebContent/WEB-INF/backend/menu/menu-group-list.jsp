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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home <span class="c-gray en">&gt;</span> 
    Menu Setup
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Reload" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
    <div class="text-c"> 
		<form class="form form-horizontal" id="form-menuGroup">
			<div class="row cl">
                <label class="form-label col-xs-2">Menu Group Name:</label>
                <div class="formControls col-xs-2">
                    <input type="hidden" ng-model="menuGroup.menuGroupId">
                    <input type="text" ng-model="menuGroup.menuGroupName" datatype="*4-50" 
                    class="input-text">
                </div>
                <label class="form-label col-xs-2">Sequence:</label>
                <div class="formControls col-xs-1">
                    <input type="text" ng-model="menuGroup.sequence" datatype="n1-3"
                    style="width: 50px" class="input-text">
                </div>
                <div class="formControls col-xs-3">
                	<div class="check-box">
					    <input type="checkbox" ng-model="menuGroup.webShowMenu">
					    <label>Show On WebSite</label>
					</div>
                </div>
                <div class="formControls col-xs-1">
                    <button class="btn btn-success" ng-click="saveMenuGroup()">
                        <i class="Hui-iconfont Hui-iconfont-save"></i> Save
                    </button>
                </div>
			</div>
        </form>
	</div>
    <!--
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
        <span class="l"><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r"></span>
    </div> -->
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
</body>
<script type="text/javascript">
(function(){
    var validForm = $("#form-menuGroup").Validform({
		tiptype:0,
		beforeSubmit:function(form) { // here must return false to stop submit data by form
            console.log("click save")
			return false;
		}
	});
})(jQuery)
function backTop(){
    //把内容滚动指定的像素数（第一个参数是向右滚动的像素数，第二个参数是向下滚动的像素数）
    window.scrollBy(0,-100);
    //延时递归调用，模拟滚动向上效果
    scrolldelay = setTimeout('backTop()',100);
    //获取scrollTop值，声明了DTD的标准网页取document.documentElement.scrollTop，否则取document.body.scrollTop；因为二者只有一个会生效，另一个就恒为0，所以取和值可以得到网页的真正的scrollTop值
    var sTop=document.documentElement.scrollTop+document.body.scrollTop;
    //判断当页面到达顶部，取消延时代码（否则页面滚动到顶部会无法再向下正常浏览页面）
    if(sTop==0) clearTimeout(scrolldelay);
}
var app = angular.module("app", []);
app.controller("myController", function($scope, $http) {
    $scope.menuGroup = {};
    dataTable($scope, $http);
    $scope.saveMenuGroup = function() {
        console.log("save", $scope.menuGroup)
    }
}).directive("myTable", function() {
		return function(scope, element, attrs) {
	        // apply DataTable options, use defaults if none specified by user
	        var options = {};
	        if (attrs.myTable.length > 0) {
	            options = scope.$eval(attrs.myTable);
	        } else {
	            options = {
	                "bStateSave": true,
	                "iCookieDuration": 2419200, /* 1 month */
	                "bJQueryUI": true,
	                "bPaginate": false,
	                "bLengthChange": false,
	                "bFilter": false,
	                "bInfo": false,
	                "bDestroy": true
	            };
	        }
	        //console.log(options,"options");
	        var explicitColumns = [];
	        element.find('th').each(function(index, elem) {
	            explicitColumns.push({"title":$(elem).text()});
	        });
	        
	        console.log(explicitColumns,"explicitColumns");
	        if (explicitColumns.length > 0) {
	            options["aoColumns"] = explicitColumns;
	        } else if (attrs.aoColumns) {
	            options["aoColumns"] = scope.$eval(attrs.aoColumns);
	        }
	        
	        if (attrs.aoColumnDefs) {
	            options["aoColumnDefs"] = scope.$eval(attrs.aoColumnDefs);
	        }
	        
	        if (attrs.fnRowCallback) {
	            options["fnRowCallback"] = scope.$eval(attrs.fnRowCallback);
	        }
	       
	        // apply the plugin
	        var dataTable = element.dataTable(options);
	        console.log(scope.$eval(attrs.aaData),"aa");
	        
	        scope.$watch(attrs.aaData, function(value) {
	        	console.log(attrs.aaData,"attrs.aaData");
	            var val = value || null;
	            if (val) {
	                dataTable.fnClearTable();
	                dataTable.fnAddData(scope.$eval(attrs.aaData));
	            }
	        }); 
	    };
});
function openFullWind(title, url) {
    var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
function dataTable($scope, $http){
		$scope.options = {};
		$scope.overrideOptions = {
			    //ordering:  false
		};
		$scope.sampleData = '';
		$http.get("fetchMenuGroupList")
			.then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
			  {"title": "Sequence", width:"10%", className: "text-c", "visible":true, "data": "sequence"}
			 ,{"title": "MenuGroupId", width:"10%", className: "text-c", "visible":true, "data": "menuGroupId"}
			 ,{"title":"MenuGroupName", width:'30%', className:'text-c', 'visible':true, data: 'menuGroupName'
				, render: function (data, type, row) {
					 return "<a style='text-decoration:none' class='btn btn-link menuUnderGroup' href='javascript:;' title='Menu'>"+data+"<i class='Hui-iconfont Hui-iconfont-edit2'></i></a>";
				 }
			 }
			 ,{"title":"Show On Website", width: '20%', calssName: 'text-c', 'visible':true, data:'webShowMenu', render: function (data, type, row) {
					 if(data) 
                         return "<i class='Hui-iconfont Hui-iconfont-xuanze'></i>";
                      else return "<i class='Hui-iconfont Hui-iconfont-close'></i>";
			}}
			 , {"title": "Action", width: '10%', calssName: 'text-c', 'visible':true, data:'code', orderable: false
				 , render: function (data, type, row) {
					 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
                     +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;'      title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
				 }}
			]; 
		
		$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
	        $('td:eq(0)', nRow).bind('click', function() {
	            $scope.$apply(function() {
	                $scope.editFunction(aData);
	            });
	        });
            $('td:eq(2)', nRow).find(".menuUnderGroup").bind('click', function() {
                var obj = this;
	            $scope.$apply(function() {
	                $scope.menuUnderGroup(obj, aData);
	            });
	        });
	        $('td:eq(4)', nRow).find("#edit").bind('click', function() {
	            $scope.$apply(function() {
	                $scope.editFunction(aData);
	            });
	        });
            $('td:eq(4)', nRow).find("#del").bind('click', function() {
	            $scope.$apply(function() {
	                $scope.delFunction(aData);
	            });
	        });
	        return nRow;
	    };
	    $scope.editFunction = function(obj) {
	        console.log(obj, "edit")
            $scope.menuGroup = obj;
            backTop();
	    };
        $scope.delFunction = function(obj) {
	        console.log(obj, "delete")
            
	    };
        $scope.menuUnderGroup = function(el, obj) {
            console.log(el, "menuGroup");
            $(el).attr("data-title", "MenuGroup:"+obj.menuGroupName);
            $(el).attr("_href", "backend/menuList?menuGroupId="+encodeURI(obj.menuGroupId));
            Hui_admin_tab($(el));
            //openFullWind("Menu", "menuList.html?menuGroupId="+obj.menuGroupId);
        }
}

</script>
</html>