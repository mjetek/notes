angular.module('account')
  .controller 'RegisterCtrl', ($scope, $http) ->
    $scope.user =
      username: ''
      email: ''
      password: ''
      confirmPassword: ''
    $scope.register = ->
      $http.post '/auth/register', $scope.user
        # username: $scope.username
        # email: $scope.email
        # password: $scope.password


