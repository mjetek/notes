angular.module('validation')
  .directive 'valRemote', ($timeout) ->
    restrict: 'A'
    require: '?ngModel',
    controller: 'RemoteValidationController'
    scope: {
      remoteUrl: '@'
    }
    link: (scope, element, attrs, ctrl) ->
      return unless ctrl?

      validate

