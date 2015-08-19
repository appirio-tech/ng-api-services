'use strict'

UserV3Controller = (UserV3APIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = UserV3APIService.get params, (data) ->
      vm.get = data

    vm

  activate()

UserV3Controller.$inject = ['UserV3APIService']

angular.module('example').controller 'UserV3Controller', UserV3Controller
