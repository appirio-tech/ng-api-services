'use strict'

WorkAPIController = (WorkAPIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = WorkAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

WorkAPIController.$inject = ['WorkAPIService']

angular.module('example').controller 'WorkAPIController', WorkAPIController
