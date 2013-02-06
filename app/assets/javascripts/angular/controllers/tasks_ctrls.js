function TasksCtrl ($scope, $http) {
	$http.get('index?term=sanjeev').success(function  (data) {
		$scope.names = data;
		console.log(data);
	});

	$scope.names = 
		[{"name":"sanjeev", "address":"gurgaon", "phone":"11111"},
		{"name":"Rana", "address":"delhi", "phone":"11111"}]
}
// var TasksCtrl = ['$scope', '$http', function($scope, $http)];
