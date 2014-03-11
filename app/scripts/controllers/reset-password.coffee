angular.module('account')
  .controller 'ResetPasswordCtrl', ($scope) ->
    $scope.resetPasswordModel =
      userName: ''
      email: ''