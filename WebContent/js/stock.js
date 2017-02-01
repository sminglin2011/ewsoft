app.controller("myController", function($scope, $http, $filter) {
		$scope.pr = {};
		$scope.selectedIds = [];
		$scope.selectedRow = function(id, nRow, checked) {
	    	if(checked) {
	    		$scope.selectedIds.push(id);
	    		$(nRow).addClass("selected");
	    	} else {
	    		$scope.selectedIds.splice($scope.selectedIds.indexOf(id), 1);
	    		$(nRow).removeClass("selected");
	    	}
	    };
	    $scope.supplierList = [];
	    $http.get("fetchCustomerList").then(function(response){$scope.supplierList = response.data});
		$scope.stock = {isMenuItem: true};
		$scope.saveStock = function() {
			console.log("save Stock");
			layer.msg('Edit model!', {icon: 1,time:2000});
		}
		$scope.defaultSupplier = function() {
			console.log($scope.selectedIds);
			if ($scope.selectedIds.length > 0) {
				console.log($scope.stock.supplier, "supplierId");
				popUpLayout("Default Supplier", 'defaultSupplier', $.param({param: $scope.selectedIds.toString(), supplierId: $scope.stock.supplier}), 'submitDefaultSupplier', 'text', $http);
			} else {
				layer.alert("selected row first", {icon: 5})
			}
		}
		$scope.purchaseRequest = function(stockId) {
			$scope.pr.stockId = stockId;
			popUpLayout("Purchase Request", 'purchaseRequest', $scope.pr, 'submitPR', 'json', $http);
		}
		Ctrl($scope, $http, $filter);
	})
	function Ctrl($scope, $http, $filter){
		$scope.options = {};
		$scope.overrideOptions = {
			order: [],
		};
		$scope.sampleData = '';
		$http.get("fetchStockList")
			.then(function (response) {if(response.data != null && response.data != '')$scope.sampleData=response.data });
		$scope.columns = [ 
            {"title":"", width:"5%", className: "text-c", "visible":true, orderable:false, render: function(data, type, row){
            	return'<input type="checkbox" class="checkbox" value="'+row.code+'">'
            }}
            ,{"title":"Stock ID", width:"10%", className: "text-c", "visible":true, "data": "stockId"}
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
            ,{"title":"Purchase Request", width:"5%", className: "text-c", "visible":true, orderable:false, searchable: false, render: function(data, type, row) {
                return '<a class="btn btn-danger radius pr">Request</a>';
            }}
            ,{"title":"Action", width:"5%", className: "text-c", "visible":true, orderable:false, searchable: false
             , render: function(data, type, row) {
                 return "<a style='text-decoration:none' class='ml-5 edit' id='edit' href='javascript:;' title='Edit'><i class='Hui-iconfont Hui-iconfont-edit'></i></a>"
                                    +"<a style='text-decoration:none' class='ml-5 del' id='del' href='javascript:;' title='Delete'><i class='Hui-iconfont Hui-iconfont-del3'></i></a>";
             }}
				]; 
		$scope.myCallback = function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {            
			$('td:eq(0)', nRow).find('input').bind('click', function() {
	        	var checked = $(this).is(':checked');
	            $scope.$apply(function() {
	                $scope.selectedRow(aData.code, nRow, checked);
	            });
	        });
			$('td', nRow).find('.pr').bind('click', function() {
	            $scope.$apply(function() {
	                $scope.purchaseRequest(aData.stockId);
	            });
	        });
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