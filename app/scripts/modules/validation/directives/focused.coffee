FOCUSED_CLASS = 'ng-focused'

angular.module('validation')
  .directive 'valFocused', ($animate) ->
    restrict: 'A'
    require: '?ngModel'
    link: (scope, element, attrs, ctrl) ->
      return unless ctrl?

      setFocused = (value)->
        return ->
          console.log "setFocused #{value}"
          ctrl.$focused = value
          if value then $animate.addClass element, FOCUSED_CLASS
          else $animate.removeClass element, FOCUSED_CLASS

      element.on 'focus', setFocused on
      element.on 'blur', setFocused off