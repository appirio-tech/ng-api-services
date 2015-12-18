'use strict'

TimelineAPIController = (TimelineAPIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = TimelineAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

TimelineAPIController.$inject = ['TimelineAPIService']

angular.module('example').controller 'TimelineAPIController', TimelineAPIController
