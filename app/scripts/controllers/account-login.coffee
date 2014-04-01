angular.module('auth')
  .controller 'LoginCtrl', ($scope, $http, $window, auth) ->
    $scope.user =
      username: ''
      password: ''
    $scope.login = ->
      auth.login($scope.user)
        .then (result) ->
          return $scope.error = message: result.data.message unless result.data.success
          $window.location.href = '/app'
