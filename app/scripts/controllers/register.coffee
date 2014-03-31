'use strict'

angular.module('auth')
  .controller 'RegisterCtrl', ($scope, $location, auth) ->
    $scope.user =
      username: ''
      email: ''
      password: ''
      confirmPassword: ''
    $scope.register = ->
      auth.register($scope.user)
        .then (data) ->
          $location.replace '/' if data.success 


