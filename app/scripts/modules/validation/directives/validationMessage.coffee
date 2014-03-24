angular.module('validation')
  .directive 'validationMessage', ($parse, $animate) ->
    restrict: 'E'
    require: '^form'
    link: (scope, element, attributes, form) ->
      return unless attributes.valMessageFor
      scope.$watch "#{form.$name}.#{attributes.valMessageFor}.$error", (newValue, oldValue, scope) ->
        console.log 'valid has changed'
        if newValue
          $animate.addClass element, 'ng-hide'
        else
          $animate.removeClass element, 'ng-hide'
          errors = $parse("#{form.$name}.#{attributes.valMessageFor}.$error") scope
          console.log errors
        
      # valMessageForFn = $parse attributes.valMessageFor
      # $
      