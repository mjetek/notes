'use strict'
# Based on: 
# http://ericpanorel.net/2013/10/05/angularjs-password-match-form-validation/
angular.module('account')
  .directive('ngMatch', ($parse) ->
    restrict: 'A'
    require: '?ngModel'
    link: (scope, element, attrs, ctrl) ->
      return unless ctrl and attrs.ngMatch

      firstPassword = $parse attrs.ngMatch

      validator = (value) ->
        tmp = firstPassword scope
        ctrl.$setValidity 'match', tmp == value
        value

      ctrl.$parsers.unshift validator
      ctrl.$formatters.push validator

      scope.$watch attrs.ngMatch, ->
        validator ctrl.$viewValue
  )
