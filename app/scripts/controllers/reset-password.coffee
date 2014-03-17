'use strict'

angular.module('auth')
  .controller 'ResetPasswordCtrl', ($scope, $location, auth) ->
    $scope.user =
      username: ''
      email: ''
    console.log 'initialize reset controller'
    $scope.reset = ->
      auth.resetPassword($scope.user)
        .then (result) ->
          return $location.path '/reset-password-sent' if result.success
          $scope.error = result.error