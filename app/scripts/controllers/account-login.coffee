angular.module('auth')
  .controller 'LoginCtrl', ($scope, $http, auth) ->
    $scope.user =
      username: ''
      password: ''
    $scope.login = ->
      auth.login $scope.user