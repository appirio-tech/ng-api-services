'use strict'

ThreadsAPIController = (ThreadsAPIService) ->
  vm = this

  activate = ->
    params =
      id          : 'id'
      subscriberId: 'subscriberId'

    resource = ThreadsAPIService.get params, (data) ->
      vm.get = data

    vm

  activate()

ThreadsAPIController.$inject = ['ThreadsAPIService']

angular.module('example').controller 'ThreadsAPIController', ThreadsAPIController
