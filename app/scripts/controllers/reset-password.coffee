angular.module('auth')
  .controller 'ResetPasswordCtrl', ($scope) ->
    $scope.resetPasswordModel =
      userName: ''
      email: ''