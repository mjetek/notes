angular.module('validation')
  .controller 'RemoteValidationController', ($scope, $element, $attrs, $http) ->
    $scope.validate = (value) ->
      $scope.valRemoteUrl += '/' unless $scope.valRemoteUrl[-1..] is '/'
      $http.get "#{$scope.valRemoteUrl}#{value}"
  .directive 'valRemote', ($timeout) ->
    restrict: 'A'
    require: '?ngModel',
    controller: 'RemoteValidationController'
    scope: {
      valRemoteUrl: '@'
    }
    link: (scope, element, attrs, ctrl) ->
      return unless ctrl?

      timeout = null
      validator = (value) ->
        return unless value or ctrl.$valid
        $timeout.cancel(timeout) if timeout
        timeout = $timeout \
          (->
            console.log 'timeout'
            scope.validate(value)
            .then (result) -> ctrl.$setValidity 'remote', result.data.valid),
          1000
        value

      ctrl.$parsers.unshift validator
      ctrl.$formatters.push validator