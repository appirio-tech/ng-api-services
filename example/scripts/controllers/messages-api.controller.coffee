'use strict'

MessagesAPIController = (MessagesAPIService) ->
  vm = this

  activate = ->
    params =
      id : 123

    resource = MessagesAPIService.put params, (data) ->
      vm.get = data

    vm

  activate()

MessagesAPIController.$inject = ['MessagesAPIService']

angular.module('example').controller 'MessagesAPIController', MessagesAPIController
