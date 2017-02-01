angular.module('app', ["ng-WdatePicker","ngRoute"]).controller('myController', function ($scope, $http, $timeout) {
	$scope.currentMenuGroupId = '';
	$scope.currentMenuId = "";
	$scope.Delivery4 = [
	                      {title:'Delivery 1', menuGroupId: '', addistionItems:[]}
	                    , {title:'Delivery 2', menuGroupId: '', addistionItems:[]}
						, {title:'Delivery 3', menuGorupId: '', addistionItems:[]}
						, {title:'Delivery 4', menuGroupId: '', addistionItems:[]}
						];
  	$scope.customer = {};
  	$scope.so = {};
  	$scope.timeSheet = [];
  	$http.get("fetchTimeSheet").then(function(response){$scope.timeSheet = response.data;});
  	$scope.customerList = [];
  	$http.get("fetchCustomerList").then(function(response){$scope.customerList = response.data;});
  	$scope.menuGroupList = [];
  	$http.get("fetchMenuGroupList").then(function(response){$scope.menuGroupList = response.data;});
  	$scope.menuList = [];
  	$http.get("fetchAllMenu").then(function(response){$scope.menuList = response.data;});
  	$scope.menuItemGroupList = [];
	$http.get("fetchAllMenuItemGroup").then(function(response){$scope.menuItemGroupList = response.data;});
	$scope.menuItemList = [];
	$http.get("fetchAllMenuItem").then(function(response){$scope.menuItemList = response.data;});

  	$scope.newCustomer = function(isNew) {
  		if(isNew == 1){
  			$scope.customer.id = "";
  		} else {
  			$scope.customer = $http.get("getCustomerInfo?customerId="+$scope.so.custCode).then(function(response) {$scope.customer = response.data})
  		}
  		layer.open({
  			type:1,
  			title: "New Customer",
  			content: $("#customerDiv"),
  			area: ['800px', '600px'],
  			btn: ['Save']
		  	,yes: function(index, layero){
		  		$http({
		  	        url: 'saveCustomer',
		  	      	method: "POST",
		          	dataType: "json",
		          	headers: { 'Content-Type': 'application/json; charset=UTF-8' }, //application/x-www-form-urlencoded; charset=UTF-8
		          	data: $scope.customer
		  	    })
		  	    .then(function(response) {// success
		  	        console.log("success", response.data);
		  	    	$scope.customer = response.data;
		  	    	if(isNew == 1){
		  	    		$scope.customerList.push($scope.customer);
			  	    	$scope.so.custCode = $scope.customer.id;
		  	    	}
		  	    	console.log("herererererer");
		  	    	layer.close(index);
		  	    }, 
		  	    function(response) { // optional // failed
		  	    	 console.log("failed");
		  	    });
		  	}
  		, cancel: function(){
  			console.log("close");
  		}
  		});
  	}
  	$scope.selectedMenu = function(menuGroupId, menuId) {
  		$scope.currentMenuGroupId = menuGroupId;
  		$scope.currentMenuId = menuId;
  		layer.open({
  			type:1,
  			content: $("#menuItemDiv"),
  			area: ['800px', '600px']
  		});
  	}
}).directive('accordion',function(){
	  return {
	        restrict : 'EA',
	        replace : true,
	        transclude : true,
	        template : '<div ng-transclude></div>',
	        controller : function() {
	            var expanders = [];
	            this.gotOpened = function(selectedExpander) {
	                angular.forEach(expanders, function(expander) {
	                    if (selectedExpander != expander) {
	                        expander.showMe = false;
	                    }
	                });
	            };
	            this.addExpander = function(expander) {
	                expanders.push(expander);
	            };
	        }
	    };
}).directive('expander', function(){
	  return {
	        restrict : 'EA',
	        replace : true,
	        transclude : true,
	        require : '^?accordion',
	        scope : {
	            expanderTitle : '='
	        },
	        template : '<dl class="panel panel-default" style="margin-top:5px;">'
	                 +' <dt ng-click="toggle()" class="panel-header" style="cursor:pointer;">{{expanderTitle}}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>'
	                 + '<dd ng-show="showMe" ng-transclude class="panel-body"></dd>'
	                 + '</dl>',
	        link : function(scope, iElement, iAttrs, accordionController) {
	            scope.showMe = false;
	            accordionController.addExpander(scope);
	            scope.toggle = function toggle() {
	                scope.showMe = !scope.showMe;
	                accordionController.gotOpened(scope);
	            };
	        }
	    };
}).config(function($routeProvider) {
    $routeProvider
    .when("/newCustomer1", {
        templateUrl : "welcome.jsp"
    })
    .when("/red", {
        templateUrl : "red.htm"
    })
    .when("/green", {
        templateUrl : "green.htm"
    })
    .when("/blue", {
        templateUrl : "blue.htm"
    });
});