'use strict'

angular.module('notes2App')
  .directive('ngMatch', () ->
    template: '<div></div>'
    restrict: 'E'
    # http://ericpanorel.net/2013/10/05/angularjs-password-match-form-validation/
    link: (scope, element, attrs) ->
      element.text 'this is the ngMatch directive'
  )
