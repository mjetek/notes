angular.module('validation')
  .directive 'validationMessage', ($parse, $animate) ->
    restrict: 'E'
    require: '^form'
    template: '<small class="error ng-hide"></small>',
    replace: true
    link: (scope, element, attributes, form) ->
      return unless attributes.valMessageFor
      scope.$watchCollection "#{form.$name}.#{attributes.valMessageFor}.$error", (newValue, oldValue, scope) ->
        return unless $parse("#{form.$name}.#{attributes.valMessageFor}.$dirty") scope
        return if oldValue is newValue
        for own error, invalid of newValue
          if invalid
            element.text attributes[error] ? 'error message'
            $animate.removeClass element, 'ng-hide'
            return

        $animate.addClass element, 'ng-hide'
      