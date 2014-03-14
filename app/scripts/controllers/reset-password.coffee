angular.module('auth')
  .controller 'ResetPasswordCtrl', ($scope, auth) ->
    $scope.user =
      userName: ''
      email: ''
    $scope.reset = ->
      auth.resetPassword($scope.user)
        .then (result) ->
          return $location.path '/reset-password-sent' if result.success
          $scope.error = result.error