'use strict'

angular.module('auth')
  .controller 'ChangePasswordCtrl', ($scope, $routeParams, auth) ->
    $scope.oldPasswordVisible = not $routeParams.token?
    $scope.data = 
      oldPassword: ''
      newPassword: ''
      confirmPassword: ''
    scope.changePassword = ->
      data =
        $scope.data.newPassword
      if $routeParams.token?
        data.token = $routeParams.token
      else
        data.oldPassword = $scope.data.oldPassword
      auth.changePassword data
