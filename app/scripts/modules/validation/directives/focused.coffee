angular.module('validation')
  .directive 'valFocused', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      element.on 'blur', () ->
        