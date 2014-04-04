angular.module('notes2App')
  .controller 'DeleteNoteController', ($scope, $modalInstance) ->
    $scope.remove = ->
      $modalInstance.close 'remove'
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')