angular.module('account')
  .controller 'RegisterCtrl', ($scope) ->
    $scope.user =
      username: ''
      email: ''
      password: ''
      confirmPassword: ''
