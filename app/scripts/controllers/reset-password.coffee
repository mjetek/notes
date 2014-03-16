angular.module('auth')
  .controller 'ResetPasswordCtrl', ($scope, $location, auth) ->
    $scope.user =
      username: ''
      email: ''
    $scope.reset = ->
      auth.resetPassword($scope.user)
        .then (result) ->
          return $location.path '/reset-password-sent' if result.success
          $scope.error = result.error