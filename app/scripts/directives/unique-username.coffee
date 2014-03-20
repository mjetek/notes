'use strict'

angular.module('auth')
  .directive 'uniqueUsername', (auth) ->
    require: '?ngModel'
    restrict: 'A'
    link: (scope, element, attrs, ctrl) ->
      return unless ctrl
      console.log 'link unique username'
      element.on 'blur', () ->
        ctrl.$error['username-not-available'] = undefined
        auth.usernameAvailable(ctrl.$viewValue)
          .then (data) ->
            ctrl.$error['username-not-available'] = not data.available
